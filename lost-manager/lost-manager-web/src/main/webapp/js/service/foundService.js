	//品牌服务
		app.service("foundService",function($http){
		
			//查询所有物品分类
			this.findAllCategory=function(){
				return $http.get("../category/findAll.do");
			}
			
			this.findAll=function(){
				return $http.get("../found/findAll.do");
			}
			
			this.findPage=function(page,size){
				return $http.get('../found/findPage.do?page='+page+'&size='+size);
			}
			
			this.findOne=function(id){
				return $http.get("../found/findOne.do?id="+id);
			}
			
			this.add=function(entity){
				return $http.post("../found/add.do",entity);
			}
			
			this.update=function(entity){
				return $http.post("../found/update.do",entity);
			}
			
			this.del=function(ids){
				return $http.get('../found/delete.do?ids='+ids);
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../found/search.do?page='+page+'&size='+size,searchEntity);
			}
		
		});