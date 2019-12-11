package com.sweet.system.service.impl;import com.baomidou.mybatisplus.core.toolkit.IdWorker;import com.sweet.core.exception.ServiceException;import com.sweet.core.exception.enums.BizExceptionEnum;import com.sweet.core.properties.SystemProperties;import com.sweet.core.shiro.ShiroKit;import com.sweet.core.util.ToolUtil;import com.sweet.system.entity.FileInfo;import com.sweet.system.mapper.FileInfoMapper;import com.sweet.system.model.UploadResult;import com.sweet.system.service.FileService;import lombok.extern.slf4j.Slf4j;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Service;import org.springframework.web.multipart.MultipartFile;import java.io.File;import java.math.BigDecimal;@Slf4j@Servicepublic class FileServiceImpl implements FileService {    @Autowired    FileInfoMapper fileInfoMapper;    @Autowired    SystemProperties systemProperties;    private static final int DIR = 0;    private static final int FILE = 1;    public String getSysUploadPath(){        String SysUploadPath = systemProperties.getUploadPath();        File filepath = new File(SysUploadPath);        if (!filepath.exists()) {            boolean mkdirs = filepath.mkdirs();        }        return SysUploadPath;    }    public boolean delFile(File file) {        if (!file.exists()) {            return false;        }        if (file.isDirectory()) {            File[] files = file.listFiles();            for (File f : files) {                delFile(f);            }        }        return file.delete();    }    public FileInfo makeSavePathDir(File SavePathDir,String parentId,String fileSavePath){        boolean mkdirs = SavePathDir.mkdirs();        FileInfo fileInfo = new FileInfo();        fileInfo.setFileId(IdWorker.get32UUID());        fileInfo.setParentId(parentId);        fileInfo.setFileName(fileSavePath);        fileInfo.setFinalName(fileSavePath);        fileInfo.setFileType(DIR);        fileInfo.setFileSuffix("dir");        fileInfo.setFileSysPath(SavePathDir.getAbsolutePath());        fileInfoMapper.insert(fileInfo);        return fileInfo;    }    /**     * 上传文件（指定上传路径）     *     * @author fengshuonan     * @Date 2019-05-04 17:18     */    public UploadResult uploadFile(MultipartFile file, String fileSavePath) {        UploadResult uploadResult = new UploadResult();        //默认顶级        String parentId = "/";        //生成文件的唯一id        String fileId = IdWorker.get32UUID();        uploadResult.setFileId(fileId);        //获取文件后缀        String fileSuffix = ToolUtil.getFileSuffix(file.getOriginalFilename());        uploadResult.setFileSuffix(fileSuffix);        //获取文件原始名称        String originalFilename = file.getOriginalFilename();        uploadResult.setOriginalFilename(originalFilename);        //生成文件的最终名称        String finalName = fileId + "." + ToolUtil.getFileSuffix(originalFilename);        uploadResult.setFinalName(finalName);        uploadResult.setFileSavePath(fileSavePath + finalName);        String sysUploadPath= getSysUploadPath();        if(!ToolUtil.isEmpty(fileSavePath)){            //判断目录存不存在,不存在得加上            File SavePathDir = new File(sysUploadPath+fileSavePath);            if (!SavePathDir.exists()) {                FileInfo fileInfo = makeSavePathDir(SavePathDir,parentId,fileSavePath);                parentId = fileInfo.getFileId();            }else {               FileInfo fileInfo = fileInfoMapper.getFileDirByName(fileSavePath);               if(fileInfo==null){                   File fileTempDir= new File(sysUploadPath+fileSavePath);                   boolean tempDir = fileTempDir.delete();                   if (fileTempDir.isDirectory()) {                       File[] files = fileTempDir.listFiles();                       for (File f : files) {                           delFile(f);                       }                   }                       fileInfo = makeSavePathDir(SavePathDir,parentId,fileSavePath);               }                parentId = fileInfo.getFileId();            }        }else{            fileSavePath="";        }        String newFileSavePath = "";        //判断有没有结尾符,没有得加上        if (!fileSavePath.endsWith(File.separator)) {            newFileSavePath = fileSavePath + File.separator;        }        try {            //保存文件到指定目录            File newFile = new File(sysUploadPath+newFileSavePath+finalName);            file.transferTo(newFile);            FileInfo fileInfo = new FileInfo();            fileInfo.setParentId(parentId);            //保存文件信息            fileInfo.setFileId(fileId);            fileInfo.setFileName(originalFilename);            fileInfo.setFileSuffix(fileSuffix);            fileSavePath += "/";            fileInfo.setFilePath("/upload/" + fileSavePath + finalName);            uploadResult.setFileSavePath(fileInfo.getFilePath());            fileInfo.setFinalName(finalName);            fileInfo.setFileType(FILE);            //计算文件大小kb            long kb = new BigDecimal(file.getSize())                    .divide(BigDecimal.valueOf(1024))                    .setScale(0, BigDecimal.ROUND_HALF_UP).longValue();            fileInfo.setFileSizeKb(kb);            fileInfo.setCreateUser(ShiroKit.getUser().getUserId());            fileInfo.setFileSysPath(newFile.getAbsolutePath());            fileInfoMapper.insert(fileInfo);        } catch (Exception e) {            log.error("上传文件错误！", e);            throw new ServiceException(BizExceptionEnum.UPLOAD_ERROR);        }        return uploadResult;    }}