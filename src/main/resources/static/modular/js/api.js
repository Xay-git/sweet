const api = {     getMenuTree:()=> {         return request.fetch('/admin/menu/tree');     },     addMenu:(menuId)=>{         return request.post("/admin/menu/addMenu",{menuId:menuId});     }}