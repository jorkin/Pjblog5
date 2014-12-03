var plugin = new Class();

plugin.add('install', function( folder ){
	var msg = { success: false, message: '插件安装失败' },
		file_config = folder + '\\config.json',
		file_config_exist = this.file_config_exist(file_config);
	
	var id = 0;
	
	if ( file_config_exist ){
		blog.conn.BeginTrans();
		try{
		/*
		 * 第一步： 获取插件配置信息
		 * 		配置信息必须包含插件的标识
		 *		如果不存在标识，表示不明插件，不予安装。
		 *		插件标识必须为40位，由云平台生成。
		 */
			var plus_config_data = require(file_config);
			
		/*
		 * 第二步： 确定插件是否已安装
		 * 		插件标识是否为40位编码
		 *		插件标识是否已存在于数据库中
		 */
			var plus_mark_exist = this.plus_mark_exist(plus_config_data);
			
			// 只有不存在数据库中的标识的插件才能被安装
			if ( !plus_mark_exist ){
			/*
			 * 第三步： 安装插件信息到数据库
			 * 		返回安装后插件所在数据库表中的ID
			 *		如果之后的操作失败，系统会回滚数据库信息到初始化。
			 */	
			 	id = this.plus_setup(plus_config_data);
				
				// id > 0 才能继续，表示已安装到数据库成功。
				if ( id > 0 ){
					/*
					 * 第四步： 更新插件系统缓存
					 * 		采用索引标识的模式，以便通过插件的ID或者标识来获取插件的信息。
					 *		前台插件页面建议采用插件标识来获取插件信息
					 */
					 	this.plus_set_cache();
						
					/*
					 * 第五步： 建立插件后台自定义页面数据
					 * 		如果存在插件自定义页面数据，那么就将插件信息输入到插件自定义数据内部
					 *		插件就能自动加载这些页面到侧边栏
					 */	
					 	this.plus_control_nav(id, plus_config_data.ControlNavs);
					
					/*
					 * 第六步： 安装插件前台导航
					 * 		只允许一个入口。其他页面希望插件作者自行提供页面方法
					 *		需要有很高的JS操作水平
					 */	
					 	if ( this.plus_assets_nav(id, plus_config_data.AssetNav) ){
							
						}
				}else{
					msg.message = '数据库数据安装失败';
				}
			}else{
				msg.message = '插件已安装';
			}
			blog.conn.CommitTrans();
		}catch(e){
			blog.conn.RollBackTrans();
		}
	};
	
	return msg;	
});

plugin.add('plus_control_nav', function(id, data){
	fs(contrast(':public/pmenu.json')).unExist().create('{}');
	var navs = require(':public/pmenu.json');
	if ( data ){
		navs[id + ''] = data;
	}else{
		try{ delete navs[id + '']; }catch(e){};
	}
	fs(contrast(':public/pmenu.json')).create(JSON.stringify(navs));
});

plugin.add('plus_assets_nav', function(id, data){
	var categoryModules = require(':public/library/category'),
		categoryModule = new categoryModules();
		
	var status = false, rec, nid = 0;
		
	if ( data ){
		nid = categoryModule.inst({
			cate_name: data.name,
			cate_des: data.des,
			cate_parent: 0,
			cate_src: 'iPress:' + JSON.stringify(['page', 'plugin', { id: id }]),
			cate_outlink: true,
			cate_isroot: 0,
			cate_order: 99,
			cate_icon: 'fa-star'
		});
		
		if ( nid > 0 ){
			rec = new dbo(blog.tb + 'params', blog.conn);
			rec.selectAll().create().set({
				par_keyword: 'iPress.Plugin.Navgation.ID',
				par_keyvalue: nid + '',
				par_pid: id,
				par_hide: 1
			}).save().close();
			
			status = true;
		};
	}else{
		rec = new dbo(blog.tb + 'params', blog.conn);
		rec.selectAll().and('par_pid', id).and('par_keyword', 'iPress.Plugin.Navgation.ID').and('par_hide', 1).open(3).exec(function(object){
			nid = object('par_keyvalue').value;
			if ( nid && nid.length > 0 && !isNaN(nid) ){ nid = Number(nid); };
			if ( nid > 0 ){ this.remove(); };
		}).close();
		
		if ( nid > 0 ){
			status = categoryModule.remove(nid);
		}else{
			status = true;
		}
	}
	
	return status;
});

plugin.add('file_config_exist', function(file){
	return fs(file_config).exist().then(function(){ return true; }).fail(function(){ return false; }).value();
});

plugin.add('plus_mark_exist', function(plus_config_data){
	var exist = true;
	if ( plus_config_data.mark && plus_config_data.mark.length === 40 ){
		var count = blog.conn.Execute("Select Count(id) From " + blog.tb + "plugins Where plu_mark='" + plus_config_data.mark + "'")(0).value;
		if ( count === 0 ){
			exist = false;
		}
	};
	
	return exist;
});

plugin.add('plus_setup', function(params){
	var rec = new dbo(blog.tb + 'plugins', blog.conn);
	var id = 0;
	
	rec.selectAll().create().set({
		plu_mark: 	params.mark,
		plu_name: 	params.name,
		plu_des: 	params.des,
		plu_author: params.author,
		plu_mail: 	params.mail,
		plu_web: 	params.site,
		plu_icon: 	params.icon,
		plu_folder: this.folder,
		plu_stop: 	true
	}).save().exec(function(object){
		id = object('id').value;
	}).close();
	
	return id;
});

plugin.add('plus_set_cache', function(){
	var PluginModules = require(':public/library/cache');
	var PluginModule = new PluginModules();
	PluginModule.plugins();
});

module.exports = plugin;