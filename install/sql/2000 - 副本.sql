CREATE TABLE [blog_themes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tm_key] [varchar](255) NULL,
	[tm_value] [ntext] NULL,
 CONSTRAINT [blog_themes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [blog_tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag_name] [varchar](255) NULL,
	[tag_count] [int] NULL,
 CONSTRAINT [blog_tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [blog_plugins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[plu_mark] [varchar](255) NULL,
	[plu_name] [varchar](255) NULL,
	[plu_des] [ntext] NULL,
	[plu_author] [varchar](255) NULL,
	[plu_mail] [varchar](255) NULL,
	[plu_web] [ntext] NULL,
	[plu_folder] [varchar](255) NULL,
	[plu_icon] [ntext] NULL,
	[plu_stop] [bit] NULL,
 CONSTRAINT [blog_plugins] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [blog_params](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[par_keyword] [varchar](255) NULL,
	[par_keyvalue] [ntext] NULL,
	[par_pid] [int] NULL,
 CONSTRAINT [blog_params] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [blog_messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[msg_member_id] [int] NULL,
	[msg_content] [ntext] NULL,
	[msg_postdate] [datetime] NULL,
	[msg_reply] [ntext] NULL,
	[msg_username] [varchar](255) NULL,
	[msg_usermail] [varchar](255) NULL,
 CONSTRAINT [blog_messages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [blog_members](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[member_mark] [varchar](255) NULL,
	[member_nick] [varchar](255) NULL,
	[member_hashkey] [varchar](40) NULL,
	[member_salt] [varchar](10) NULL,
	[member_mail] [varchar](255) NULL,
	[member_group] [varchar](50) NULL,
	[member_comments] [int] NULL,
	[member_messages] [int] NULL,
	[member_forbit] [bit] NULL,
	[member_logindate] [datetime] NULL,
	[member_birthday] [datetime] NULL,
	[member_address] [ntext] NULL,
	[member_website] [ntext] NULL,
	[member_sex] [int] NULL,
	[member_avatar] [ntext] NULL,
	[member_token] [varchar](50) NULL,
	[member_openid] [varchar](50) NULL,
 CONSTRAINT [blog_members] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [blog_links](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[link_name] [varchar](255) NULL,
	[link_des] [ntext] NULL,
	[link_src] [ntext] NULL,
	[link_type] [int] NULL,
	[link_hide] [bit] NULL,
 CONSTRAINT [blog_links] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [blog_levels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code_name] [varchar](255) NULL,
	[code_des] [ntext] NULL,
	[code_isystem] [bit] NULL,
	[code_mark] [varchar](255) NULL,
 CONSTRAINT [blog_code] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET IDENTITY_INSERT [blog_levels] ON
INSERT [blog_levels] ([id], [code_name], [code_des], [code_isystem], [code_mark]) VALUES (1, CONVERT(TEXT, N'查看文章'), N'查看文章', 1, CONVERT(TEXT, N'ViewArticles'))
INSERT [blog_levels] ([id], [code_name], [code_des], [code_isystem], [code_mark]) VALUES (2, CONVERT(TEXT, N'管理后台'), N'管理后台', 1, CONVERT(TEXT, N'ControlSystem'))
INSERT [blog_levels] ([id], [code_name], [code_des], [code_isystem], [code_mark]) VALUES (3, CONVERT(TEXT, N'编辑文章'), N'编辑文章', 1, CONVERT(TEXT, N'ModifyArticles'))
INSERT [blog_levels] ([id], [code_name], [code_des], [code_isystem], [code_mark]) VALUES (4, CONVERT(TEXT, N'删除文章'), N'删除文章', 1, CONVERT(TEXT, N'RemoveArticles'))
INSERT [blog_levels] ([id], [code_name], [code_des], [code_isystem], [code_mark]) VALUES (5, CONVERT(TEXT, N'发表评论'), N'发表评论', 1, CONVERT(TEXT, N'PostComments'))
INSERT [blog_levels] ([id], [code_name], [code_des], [code_isystem], [code_mark]) VALUES (6, CONVERT(TEXT, N'发表留言'), N'发表留言', 1, CONVERT(TEXT, N'PostMessage'))
SET IDENTITY_INSERT [blog_levels] OFF

CREATE TABLE [blog_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [varchar](255) NULL,
	[group_code] [ntext] NULL,
	[group_isystem] [bit] NULL,
 CONSTRAINT [blog_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET IDENTITY_INSERT [blog_groups] ON
INSERT [blog_groups] ([id], [group_name], [group_code], [group_isystem]) VALUES (1, CONVERT(TEXT, N'普通会员'), N'[1,5,6]', 1)
INSERT [blog_groups] ([id], [group_name], [group_code], [group_isystem]) VALUES (2, CONVERT(TEXT, N'超级管理员'), N'[1,2,3,4,5,6]', 1)
SET IDENTITY_INSERT [blog_groups] OFF

CREATE TABLE [blog_global](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[blog_name] [varchar](255) NULL,
	[blog_title] [varchar](255) NULL,
	[blog_des] [ntext] NULL,
	[blog_mail] [varchar](255) NULL,
	[blog_copyright] [varchar](50) NULL,
	[blog_keywords] [ntext] NULL,
	[blog_description] [ntext] NULL,
	[blog_theme] [varchar](255) NULL,
	[blog_themename] [varchar](255) NULL,
	[blog_thememail] [varchar](255) NULL,
	[blog_themeweb] [ntext] NULL,
	[blog_themeversion] [varchar](255) NULL,
	[blog_status] [int] NULL,
	[blog_message] [ntext] NULL,
	[blog_categoryremove] [int] NULL,
	[blog_articlecut] [int] NULL,
	[blog_categoryremovechild] [int] NULL,
	[blog_appid] [int] NULL,
	[blog_appkey] [varchar](50) NULL,
	[blog_articlepage] [int] NULL,
 CONSTRAINT [blog_global] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET IDENTITY_INSERT [blog_global] ON
INSERT [blog_global] ([id], [blog_name], [blog_title], [blog_des], [blog_mail], [blog_copyright], [blog_keywords], [blog_description], [blog_theme], [blog_themename], [blog_thememail], [blog_themeweb], [blog_themeversion], [blog_status], [blog_message], [blog_categoryremove], [blog_articlecut], [blog_categoryremovechild], [blog_appid], [blog_appkey], [blog_articlepage]) VALUES (1, CONVERT(TEXT, N'我的个人博客'), CONVERT(TEXT, N'又一个PJBlog5博客'), N'心有多大，舞台就有多大。', CONVERT(TEXT, N'contact@PJBlog5.com'), CONVERT(TEXT, N''), N'pjblog5', N'pjblog5', CONVERT(TEXT, N'default'), CONVERT(TEXT, N'创时代经典主题（默认主题）'), CONVERT(TEXT, N'evio@vip.qq.com'), N'http://webkits.cn', NULL, 0, N'抱歉，网站因更新，暂时关闭！', 0, 500, 0, 10004, CONVERT(TEXT, N'72ad517093fea177c87596224a16c07e577c9d04'), 10)
SET IDENTITY_INSERT [blog_global] OFF

CREATE TABLE [blog_comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[com_article_id] [int] NULL,
	[com_member_id] [int] NULL,
	[com_content] [ntext] NULL,
	[com_parent] [int] NULL,
	[com_postdate] [datetime] NULL,
 CONSTRAINT [blog_comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [blog_categorys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cate_name] [varchar](255) NULL,
	[cate_des] [ntext] NULL,
	[cate_count] [int] NULL,
	[cate_parent] [int] NULL,
	[cate_src] [ntext] NULL,
	[cate_outlink] [bit] NULL,
	[cate_isroot] [bit] NULL,
	[cate_order] [int] NULL,
	[cate_icon] [ntext] NULL,
 CONSTRAINT [blog_categorys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET IDENTITY_INSERT [blog_categorys] ON
INSERT [blog_categorys] ([id], [cate_name], [cate_des], [cate_count], [cate_parent], [cate_src], [cate_outlink], [cate_isroot], [cate_order], [cate_icon]) VALUES (1, CONVERT(TEXT, N'首页'), N'网站首页，获取最新的日志文章', 0, 0, N'default.asp', 1, 1, 1, N'22.gif')
INSERT [blog_categorys] ([id], [cate_name], [cate_des], [cate_count], [cate_parent], [cate_src], [cate_outlink], [cate_isroot], [cate_order], [cate_icon]) VALUES (2, CONVERT(TEXT, N'默认分类'), N'默认分类', 0, 0, N'', 0, 1, 2, N'15.gif')
INSERT [blog_categorys] ([id], [cate_name], [cate_des], [cate_count], [cate_parent], [cate_src], [cate_outlink], [cate_isroot], [cate_order], [cate_icon]) VALUES (3, CONVERT(TEXT, N'默认分类的子分类'), N'默认分类的子分类', 0, 2, N'', 0, 0, 1, N'8.gif')
SET IDENTITY_INSERT [blog_categorys] OFF

CREATE TABLE [blog_attments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[att_des] [ntext] NULL,
	[att_type] [varchar](50) NULL,
	[att_src] [ntext] NULL,
 CONSTRAINT [blog_attments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [blog_articles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[art_title] [varchar](255) NULL,
	[art_des] [ntext] NULL,
	[art_category] [int] NULL,
	[art_content] [ntext] NULL,
	[art_tags] [ntext] NULL,
	[art_draft] [bit] NULL,
	[art_tname] [varchar](255) NULL,
	[art_postdate] [datetime] NULL,
	[art_modifydate] [datetime] NULL,
	[art_comment_count] [int] NULL,
	[art_cover] [ntext] NULL,
	[art_tdes] [ntext] NULL,
 CONSTRAINT [blog_articles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET IDENTITY_INSERT [blog_articles] ON
INSERT [blog_articles] ([id], [art_title], [art_des], [art_category], [art_content], [art_tags], [art_draft], [art_tname], [art_postdate], [art_modifydate], [art_comment_count], [art_cover], [art_tdes]) VALUES (1, CONVERT(TEXT, N'第一次使用PJBlog5，请先看看程序说明吧！'), N'非常感谢您使用PJBlog5独立博客管理系统。本程序采用非复古式ASP语法，放弃VBscri&#112;t，选用Jscri&#112;t脚本，实现前后台一统。PJBlog5基于TRONASP框架而得以运行，解决了ASP中一些难以突破的限制。比如说，动态include，模块之间的require。但是可惜的是，我们还是无法解决sleep或者setTimeout这些问题。无法突破不代表我们的ASP程序不能实现对以往语言的超越。我相信，PJBlog5作为TRONASP的代表作，一定会厚积薄发，史无前例地为创造用户体验而努力！让时间证明一切吧。', 16, N'<p style="text-indent: 2em;"><span style="font-size: 12px;">非常感谢您使用PJBlog5独立博客管理系统。本程序采用非复古式ASP语法，放弃VBscript，选用Jscript脚本，实现前后台一统。PJBlog5基于TRONASP框架而得以运行，解决了ASP中一些难以突破的限制。比如说，动态include，模块之间的require。但是可惜的是，我们还是无法解决sleep或者setTimeout这些问题。无法突破不代表我们的ASP程序不能实现对以往语言的超越。我相信，PJBlog5作为TRONASP的代表作，一定会厚积薄发，史无前例地为创造用户体验而努力！让时间证明一切吧。</span></p><p><br/></p><ol class=" list-paddingleft-2" style="list-style-type: decimal;"><li><p><span style="font-size: 14px;"><strong>用户云平台管理</strong></span></p><p><span style="font-size: 12px;">在我创建PJBlog5之前，和舜子商议了PJBlog5建立联盟圈的想法，得到了舜子的一致认同，这是独立博客想做而无法做的事情。虽然这样的做法，对于ASP程序来说非常艰难，但是我们渐渐克服了困难，将云平台搭建起来。</span></p><p><span style="font-size: 12px;">我们的用户，统一由云平台上注册，采用国际协议Oauth2.0登录后台。这也表示，基于云平台的用户已经可以在独立博客上登录了。这是史无前例的独立博客体系。</span></p><p><span style="font-size: 12px;">对于访问者用户，也可以通过PJBlog5云平台账户登录任何一个PJBlog5网站（无须注册），来完成你的评论，留言，以及分享。这方便了用户，也可以让我们统一管理这群用户。</span></p><p><span style="font-size: 12px;">PJBlog5的Oauth2.0机制，是由PJBlog5作者沈赟杰（evio）独立完成，在参阅了大量中外实例后，完成了这套服务端的体系。其中包括Oauth2.0官网，腾讯，新浪微博等等平台OAUTH2.0实例。</span></p><p><span style="font-size: 12px;">为什么我们要做这样一个用户圈，是因为以往的独立博客的弱势之处在于，虽然是同一套博客，但是博客与博客之间的互通几乎为0。在web现在的交互时代，如果一个博客几乎与外界没有关联，那么这套博客只能看，而没有更多的作用。我们抱着为用户解决这样的困惑的想法，建立了云平台来打造这个独立博客之间的信息化生态圈，让博客不死，让博主体验到更好的写作乐趣，这是我们的宗旨。</span></p></li><li><p><span style="font-size: 14px;"><strong>继承传统的PJBlog理念</strong></span></p><p><span style="font-size: 12px;">这里，我想提的是以往PJBlog的理念，那就是简单，简洁，易上手，易操作。在此，我们继续继承舜子的理念，为将PJBlog5打在成这样的程序而努力。</span></p></li><li><p><strong><span style="font-size: 14px;">在线云平台能为我们提供什么？</span></strong></p><p><span style="font-size: 12px;">在线云平台，可以给我们提供的又如下的功能：云插件、云主题、云分享、云组群、云登录、云威客……&nbsp;</span></p><p><span style="font-size: 12px;">云插件：在线插件安装，发布你自己的插件而收益。</span></p><p><span style="font-size: 12px;">云主题：在线主题安装，发布你自己的主题而收益。</span></p><p><span style="font-size: 12px;">云分享：你可以在你自己的后台获取到最新的信息，包括，自己的信息，好友的信息以及点赞的功能。</span></p><p><span style="font-size: 12px;">云组群：建立PJBlog5互动交流圈，你们将不再孤单，类似腾讯的组群功能。</span></p><p><span style="font-size: 12px;">云登录：Oauth2.0登录。</span></p><p><span style="font-size: 12px;">云威客：你可以在你的后台发布你想要的东西，产生竞标；或者你可以接受别人的付款制作。类似猪八戒。</span></p></li><li><p><span style="font-size: 14px;"><strong>招贤纳士</strong></span></p><p><span style="font-size: 12px;">在PJBlog5开发之际，只有一个人的开发，固然显得有些缓慢而没有动力。我希望有更多喜欢这套程序的朋友加入我们一起来完善这套程序。</span></p><p><span style="font-size: 12px;">EMAIL： evio@vip.qq.com</span></p></li></ol><p><br/></p><p><br/></p><p style="text-align: right;">沈赟杰（evio）</p><p style="text-align: right;">2014-7-10</p><p><br/></p>', N'', 0, CONVERT(TEXT, N''), CAST(0x0000A348011007D8 AS DateTime), CAST(0x0000A36400ECF748 AS DateTime), 0, N'', N'非常感谢您使用PJBlog5独立博客管理系统。本程序采用非复古式ASP语法，放弃VBscri&#112;t，选用Jscri&#112;t脚本，实现前后台一统。PJBlog5基于TRONASP框架而得以运行，解决了ASP中一些难以突破的限制。比如说，动态include，模块之间的require。但是可惜的是，我们还是无法解决sleep或者setTimeout这些问题。无法突破不代表我们的ASP程序不能实现对以往语言的超越。我相信，PJBlog5作为TRONASP的代表作，一定会厚积薄发，史无前例地为创造用户体验而努力！让时间证明一切吧。')
SET IDENTITY_INSERT [blog_articles] OFF


ALTER TABLE [blog_articles] ADD  CONSTRAINT [DF_blog_articles_art_draft]  DEFAULT ((0)) FOR [art_draft]

ALTER TABLE [blog_articles] ADD  CONSTRAINT [DF_blog_articles_art_comment_count]  DEFAULT ((0)) FOR [art_comment_count]

ALTER TABLE [blog_categorys] ADD  CONSTRAINT [DF_blog_categorys_cate_count]  DEFAULT ((0)) FOR [cate_count]

ALTER TABLE [blog_categorys] ADD  CONSTRAINT [DF_blog_categorys_cate_parent]  DEFAULT ((0)) FOR [cate_parent]

ALTER TABLE [blog_categorys] ADD  CONSTRAINT [DF_blog_categorys_cate_outlink]  DEFAULT ((0)) FOR [cate_outlink]

ALTER TABLE [blog_categorys] ADD  CONSTRAINT [DF_blog_categorys_cate_isroot]  DEFAULT ((0)) FOR [cate_isroot]

ALTER TABLE [blog_categorys] ADD  CONSTRAINT [DF_blog_categorys_cate_order]  DEFAULT ((99)) FOR [cate_order]

ALTER TABLE [blog_comments] ADD  CONSTRAINT [DF_blog_comments_com_article_id]  DEFAULT ((0)) FOR [com_article_id]

ALTER TABLE [blog_comments] ADD  CONSTRAINT [DF_blog_comments_com_member_id]  DEFAULT ((0)) FOR [com_member_id]

ALTER TABLE [blog_comments] ADD  CONSTRAINT [DF_blog_comments_com_parent]  DEFAULT ((0)) FOR [com_parent]

ALTER TABLE [blog_global] ADD  CONSTRAINT [DF_blog_global_blog_status]  DEFAULT ((0)) FOR [blog_status]

ALTER TABLE [blog_global] ADD  CONSTRAINT [DF_blog_global_blog_articlepage]  DEFAULT ((10)) FOR [blog_articlepage]

ALTER TABLE [blog_groups] ADD  CONSTRAINT [DF_blog_groups_group_isystem]  DEFAULT ((0)) FOR [group_isystem]

ALTER TABLE [blog_levels] ADD  CONSTRAINT [DF_blog_code_code_isystem]  DEFAULT ((0)) FOR [code_isystem]

ALTER TABLE [blog_links] ADD  CONSTRAINT [DF_blog_links_link_type]  DEFAULT ((0)) FOR [link_type]

ALTER TABLE [blog_links] ADD  CONSTRAINT [DF_blog_links_link_hide]  DEFAULT ((0)) FOR [link_hide]

ALTER TABLE [blog_members] ADD  CONSTRAINT [DF_blog_members_member_comments_1]  DEFAULT ((0)) FOR [member_comments]

ALTER TABLE [blog_members] ADD  CONSTRAINT [DF_blog_members_member_messages_1]  DEFAULT ((0)) FOR [member_messages]

ALTER TABLE [blog_members] ADD  CONSTRAINT [DF_blog_members_member_forbit_1]  DEFAULT ((0)) FOR [member_forbit]

ALTER TABLE [blog_members] ADD  CONSTRAINT [DF_blog_members_member_sex]  DEFAULT ((0)) FOR [member_sex]

ALTER TABLE [blog_params] ADD  CONSTRAINT [DF_blog_params_par_pid]  DEFAULT ((0)) FOR [par_pid]

ALTER TABLE [blog_plugins] ADD  CONSTRAINT [DF_blog_plugins_plu_stop]  DEFAULT ((0)) FOR [plu_stop]

ALTER TABLE [blog_tags] ADD  CONSTRAINT [DF_blog_tags_tag_count]  DEFAULT ((0)) FOR [tag_count]