axios.defaults.timeout = 5000;axios.defaults.baseURL ='';axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8';var requestList  = [];//http request 拦截器axios.interceptors.request.use(    config => {        // sysconst token = getCookie('名称');注意使用的时候需要引入cookie方法，推荐js-cookie        config.headers = {             'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8',             'X-Requested-With':'XMLHttpRequest'        }        let requestFlag = JSON.stringify(config.url) + JSON.stringify(config.data) + '&' + config.method;        if (requestList.includes(requestFlag)) {//请求标记已经存在，则取消本次请求，否则在请求列表中加入请求标记            layer.msg('您点击的太快啦！请求已发送~');            return ;//取消本次请求        } else {            requestList.push(requestFlag);        }        // if(token){        //   config.params = {'token':token}        // }        return config;    },    error => {        return Promise.reject(err);    });//http response 拦截器axios.interceptors.response.use(    response => {        //请求返回后，将请求标记从requestList中移除        let requestFlag = JSON.stringify(response.config.url) + JSON.stringify(response.config.data) + '&' + response.config.method;        requestList.splice(requestList.findIndex(item => item === requestFlag), 1);        return response;    },    error => {        //置空请求列表        requestList.length = 0;        return Promise.reject(error)    })const request = {    fetch:function (url,params={}){        return new Promise((resolve,reject) => {            axios.get(url,{                params:params            })            .then(response => {                if(response.data.code==200|response.data.code==0){                    resolve(response.data.data);                }else{                    top.layer.msg(response.data.message, {icon: 5});                }            })            .catch(err => {                try {                    top.layer.msg(err.response.data.message, {icon: 5});                }                catch(err){                    top.layer.msg("网络错误！", {icon: 5});                }                reject(err)            })        })    },    post:function (url,data = {}) {        return new Promise((resolve, reject) => {            var load = top.layer.load(2);            axios.post(url,Qs.stringify(data))                .then(response => {                    top.layer.close(load);                    if(response.data.code==200){                        resolve(response.data.data);                    }else{                        top.layer.msg(response.data.message, {icon: 5});                    }                }, err => {                    top.layer.close(load);                    try {                        top.layer.msg(err.response.data.message, {icon: 5});                    }                    catch(err){                        top.layer.msg("网络错误！", {icon: 5});                    }                    reject(err)                })        })    },    $postData:function(url,data,callback){        $.ajax({            type:'POST',            url:url,            dataType:'json',            async:false,            data:data,            success:function(res){                if (res.code == 200) {                    callback(res.data);                }else{                    top.layer.msg(res.message, {icon: 5});                }            }        });    }}//https://blog.csdn.net/fyk844645164/article/details/101064597