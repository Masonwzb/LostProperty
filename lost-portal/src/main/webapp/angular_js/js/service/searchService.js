	//失物服务
		app.service("searchService",function($http){
					
			this.searchLost=function(page,size,queryEntity){
				return $http.post('../lost/search.action?page='+page+'&size='+size,queryEntity);
			}
			
			this.searchFound=function(page,size,queryEntity){
				return $http.post('../found/search.action?page='+page+'&size='+size,queryEntity);
			}
			
			this.lostFindAll=function(){
				return $http.get("../lost/findAll.action");
			}
			
			this.foundFindAll=function(){
				return $http.get("../found/findAll.action");
			}
		
		});