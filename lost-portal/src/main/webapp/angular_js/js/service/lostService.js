	//失物服务
		app.service("lostService",function($http){
			
			//查询最近一周内的失物
			this.findNewest=function(page,size){
				return $http.get('../lost/newest.action?page='+page+'&size='+size)
			}
			
			//查询所有物品分类
			this.findAllCategory=function(){
				return $http.get("../category/findAll.action");
			}
			
			this.findAll=function(){
				return $http.get("../lost/findAll.action");
			}
			
			this.findPage=function(page,size){
				return $http.get('../lost/findPage.action?page='+page+'&size='+size);
			}
			
			this.findOne=function(id){
				return $http.get("../lost/findOne.action?id="+id);
			}
			
			this.add=function(entity){
				return $http.post("../lost/add.action",entity);
			}
			
			this.update=function(entity){
				return $http.post("../lost/update.action",entity);
			}
			
			this.del=function(ids){
				return $http.get('../lost/delete.action?ids='+ids);
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../lost/search.action?page='+page+'&size='+size,searchEntity);
			}
		
		});