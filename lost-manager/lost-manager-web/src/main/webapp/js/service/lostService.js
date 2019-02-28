	//物品服务
		app.service("lostService",function($http){
		
			//查询所有物品分类
			this.findAllCategory=function(){
				return $http.get("../category/findAll.do");
			}
			
			this.findAll=function(){
				return $http.get("../lost/findAll.do");
			}
			
			this.findPage=function(page,size){
				return $http.get('../lost/findPage.do?page='+page+'&size='+size);
			}
			
			this.findOne=function(id){
				return $http.get("../lost/findOne.do?id="+id);
			}
			
			this.add=function(entity){
				return $http.post("../lost/add.do",entity);
			}
			
			this.update=function(entity){
				return $http.post("../lost/update.do",entity);
			}
			
			this.del=function(ids){
				return $http.get('../lost/delete.do?ids='+ids);
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../lost/search.do?page='+page+'&size='+size,searchEntity);
			}
			
			//更改状态
			this.updateStatus=function (lostId,status) {
				return $http.get('../lost/updateStatus.do?lostId='+ lostId +'&status='+ status);
			}
			
		
		});