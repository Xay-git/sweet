const api = {    getMenuTree: () => {        return request.fetch('/admin/menu/tree');    },    getTableTree: () => {        return request.fetch('/admin/menu/tableTree');    },    getMenulist(){        return request.fetch('/admin/menu/menulist');    },    addMenu: (menuId) => {        return request.post("/admin/menu/addMenu", {menuId: menuId});    },    editMenu: (data) => {        return request.post("/admin/menu/editMenu", data);    },    getMenuDetail:(menuId) => {        return request.fetch("/admin/menu/getMenuDetail", {menuId: menuId});    },    getDeptTree: () => {        return request.fetch('/admin/dept/tree');    },    getDeptList: () => {        return request.fetch('/admin/dept/list');    },    getDeptDetail:(deptId) => {        return request.fetch("/admin/dept/getDeptDetail", {deptId: deptId});    },    addDept: (deptId) => {        return request.post("/admin/dept/addDept", {deptId: deptId});    },    editDept: (id,title) => {        return request.post("/admin/dept/editDept", {deptId:id,deptName:title});    },    delDept: (id,title) => {        return request.post("/admin/dept/delDept", {deptId:id});    },    addUser: (data) => {        return request.post("/admin/user/addUser", data);    },    deptTree: (data) => {        return request.post("/admin/user/deptTree", data);    },    getUserDetail:(userId) => {        return request.fetch("/admin/user/getUser", {userId: userId});    },    getRoleDetail:(roleId) => {        return request.fetch("/admin/role/getRoleDetail", {roleId: roleId});    },    addRole: (data) => {        return request.post("/admin/role/addRole", data);    },    getRoleXmSelect:()=>{        return request.fetch("/admin/role/getXmSelect");    },    setAuthority(roleId,menuIds,fun){        return request.$postData("/admin/role/setAuthority", {roleId:roleId,menuIds:menuIds},(res)=>{            fun(res)        });    },    getAuthority:(roleId) => {        return request.fetch("/admin/role/getAuthority", {roleId: roleId});    },    getUserRole:(userId) => {        return request.fetch("/admin/user/getUserRole", {userId: userId});    },}