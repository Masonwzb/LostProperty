	//品牌服务
		app.service("foundService",function($http){
		
			//查询最近一周内的失物
			this.findNewest=function(page,size){
				return $http.get('../found/newest.action?page='+page+'&size='+size)
			}
			
			//查询所有物品分类
			this.findAllCategory=function(){
				return $http.get("../category/findAll.action");
			}
			
			this.findAll=function(){
				return $http.get("../found/findAll.action");
			}
			
			this.findPage=function(page,size){
				return $http.get('../found/findPage.action?page='+page+'&size='+size);
			}
			
			this.findOne=function(id){
				return $http.get("../found/findOne.action?id="+id);
			}
			
			this.add=function(entity){
				return $http.post("../found/add.action",entity);
			}
			
			this.update=function(entity){
				return $http.post("../found/update.action",entity);
			}
			
			this.del=function(ids){
				return $http.get('../found/delete.action?ids='+ids);
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../found/search.action?page='+page+'&size='+size,searchEntity);
			}
		
		});