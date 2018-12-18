	//品牌服务
		app.service("categoryService",function($http){
		
			this.findAll=function(){
				return $http.get("../category/findAll.do");
			}
			
			this.findPage=function(page,size){
				return $http.get('../category/findPage.do?page='+page+'&size='+size);
			}
			
			this.findOne=function(id){
				return $http.get("../category/findOne.do?id="+id);
			}
			
			this.add=function(entity){
				return $http.post("../category/add.do",entity);
			}
			
			this.update=function(entity){
				return $http.post("../category/update.do",entity);
			}
			
			this.del=function(ids){
				return $http.get('../category/delete.do?ids='+ids);
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../category/search.do?page='+page+'&size='+size,searchEntity);
			}
		
		});