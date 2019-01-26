	//品牌服务
		app.service("foundService",function($http){
		
			//获取该物品ID
			var goodsId = $("#goodsId").val();
			//获取基础URL
			var baseUrl = $("#PageContext").val();
			
			//查询最近一周内的失物
			this.findNewest=function(page,size){
				return $http.get('../found/newest.action?page='+page+'&size='+size)
			}
			
			//查询所有物品分类
			this.findAllCategory=function(){
				return $http.get( baseUrl + "/category/findAll.action");
			}
			
			this.findAll=function(){
				return $http.get("../found/findAll.action");
			}
			
			this.findPage=function(page,size){
				return $http.get('../found/findPage.action?page='+page+'&size='+size);
			}
			
			this.findOne=function(){
				return $http.get(baseUrl + "/found/findOneUpdate/"+ goodsId +".action");
			}
			
			this.add=function(entity){
				return $http.post("../found/add.action",entity);
			}
			
			this.validate=function(entity){
				entity.id = goodsId;
				return $http.post(baseUrl + '/found/pwd/validate.action',entity);
			}
			
			this.update=function(entity){
				return $http.post(baseUrl + "/found/update.action",entity);
			}
			
			this.del=function(){
				return $http.get(baseUrl + "/found/delete/"+ goodsId +".action");
			}
			
			this.search=function(page,size,searchEntity){
				return $http.post('../found/search.action?page='+page+'&size='+size,searchEntity);
			}
		
		});