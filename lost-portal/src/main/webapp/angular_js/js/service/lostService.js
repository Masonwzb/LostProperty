	//失物服务
		app.service("lostService",function($http){
			
			//获取该物品ID
			var goodsId = $("#goodsId").val();
			//获取基础URL
			var baseUrl = $("#PageContext").val();
			
			//查询最近一周内的失物
			this.findNewest=function(page,size){
				return $http.get('../lost/newest.action?page='+page+'&size='+size)
			}
			
			//查询所有物品分类
			this.findAllCategory=function(){
				return $http.get( baseUrl + "/category/findAll.action");
			}
			
			this.findAll=function(){
				return $http.get("../lost/findAll.action");
			}
			
			this.findPage=function(page,size){
				return $http.get('../lost/findPage.action?page='+page+'&size='+size);
			}
			
			this.findOne=function(){
				return $http.get(baseUrl + "/lost/findOneUpdate/"+ goodsId +".action");
			}
			
			this.add=function(entity){
				return $http.post("../lost/add.action",entity);
			}
			
			this.validate=function(entity){
				entity.id = goodsId;
				return $http.post(baseUrl + '/lost/pwd/validate.action',entity);
			}
			
			this.update=function(entity){
				return $http.post(baseUrl + "/lost/update.action",entity);
			}
			
			this.del=function(){
				return $http.get(baseUrl + "/lost/delete/"+ goodsId +".action");
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../lost/search.action?page='+page+'&size='+size,searchEntity);
			}
			
			this.sendEmail=function(id){
				return $http.get(baseUrl + "/lost/sendEmail/"+ id + ".action");
			}
			
		
		});