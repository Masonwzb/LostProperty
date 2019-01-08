
app.controller('searchController',function($scope,$timeout,$controller,searchService){
		
			$controller('baseController',{$scope:$scope});//继承
			
			$scope.queryEntity={};
			
			//寻物查询
			$scope.searchLost=function(page,size){
			
				searchService.searchLost(page,size,$scope.queryEntity).success(
					function(response){
						$scope.listLost=response.rows;//显示当前页数据
						$scope.paginationConf1.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
			//招领查询
			$scope.searchFound=function(page,size){
			
				searchService.searchFound(page,size,$scope.queryEntity).success(
					function(response){
						$scope.listFound=response.rows;//显示当前页数据
						$scope.paginationConf2.totalItems=response.total;//更新总记录数
					}
				);	
			}
			
			//分页控件配置 currentPage:当前页 totalItems：总记录数
			//itemsPerPage:每页记录数 perPageOptions：分页选项  onChange:当页码变更后自动触发的方法
			$scope.paginationConf1 = {
					 currentPage: 1,
					 totalItems: 10,
					 itemsPerPage: 8,
					 perPageOptions: [8,12, 16, 20, 24],
					 onChange: function(){
					       $scope.reloadList1();//重新加载
					 }
			}; 
			
			//分页控件配置 currentPage:当前页 totalItems：总记录数
			//itemsPerPage:每页记录数 perPageOptions：分页选项  onChange:当页码变更后自动触发的方法
			$scope.paginationConf2 = {
					 currentPage: 1,
					 totalItems: 10,
					 itemsPerPage: 8,
					 perPageOptions: [8, 12, 16, 20, 24],
					 onChange: function(){
					       $scope.reloadList2();//重新加载
					 }
			}; 
			
			//重新加载列表 数据 刷新列表
			$scope.reloadQuery=function(){
				 //切换页码  
				 $scope.searchLost( $scope.paginationConf1.currentPage, $scope.paginationConf1.itemsPerPage );
				 $scope.searchFound( $scope.paginationConf2.currentPage, $scope.paginationConf2.itemsPerPage );
			}
			
			//重新加载列表 数据 刷新列表
			$scope.reloadList1=function(){
				 //切换页码  
				 $scope.searchLost( $scope.paginationConf1.currentPage, $scope.paginationConf1.itemsPerPage );
			}
			
			//重新加载列表 数据 刷新列表
			$scope.reloadList2=function(){
				 //切换页码  
				 $scope.searchFound( $scope.paginationConf2.currentPage, $scope.paginationConf2.itemsPerPage );
			}
			
		
		});