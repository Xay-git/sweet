package com.sweet.modular.system.service;import com.sweet.modular.system.model.UploadResult;import org.springframework.web.multipart.MultipartFile;public interface FileService {    public UploadResult uploadFile(MultipartFile file, String fileSavePath);}