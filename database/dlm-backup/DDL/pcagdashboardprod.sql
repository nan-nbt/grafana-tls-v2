-- pcagdashboardprod.cfg_app definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_app;

CREATE TABLE pcagdashboardprod.cfg_app (
	app_id varchar(22) NOT NULL,
	app_no varchar(10) NOT NULL,
	app_desc varchar(100) NULL,
	update_user numeric(14) NULL,
	update_time numeric NULL,
	CONSTRAINT cfg_app_pk PRIMARY KEY (app_id)
);


-- pcagdashboardprod.cfg_app_lang definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_app_lang;

CREATE TABLE pcagdashboardprod.cfg_app_lang (
	app_lang_id varchar(22) NOT NULL,
	app_id varchar(22) NOT NULL,
	lang_no varchar(5) NOT NULL,
	app_lang_order numeric NOT NULL DEFAULT 0,
	update_user numeric(14) NULL,
	update_time numeric NULL,
	CONSTRAINT cfg_app_lang_pk PRIMARY KEY (app_lang_id)
);


-- pcagdashboardprod.cfg_app_mgr definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_app_mgr;

CREATE TABLE pcagdashboardprod.cfg_app_mgr (
	app_mgr_id varchar(22) NOT NULL,
	app_id varchar(22) NOT NULL,
	user_pccuid numeric(14) NOT NULL,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_app_mgr_pk PRIMARY KEY (app_mgr_id)
);


-- pcagdashboardprod.cfg_auth_board definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_auth_board;

CREATE TABLE pcagdashboardprod.cfg_auth_board (
	auth_board_id varchar(22) NOT NULL,
	board_id varchar(22) NOT NULL,
	group_id varchar(22) NOT NULL,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_auth_board_pk PRIMARY KEY (auth_board_id)
);


-- pcagdashboardprod.cfg_auth_dp_fact definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_auth_dp_fact;

CREATE TABLE pcagdashboardprod.cfg_auth_dp_fact (
	auth_fact_id varchar(22) NOT NULL,
	auth_board_id varchar(22) NOT NULL,
	fact_id varchar(22) NOT NULL,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_auth_dp_fact_pk PRIMARY KEY (auth_fact_id)
);


-- pcagdashboardprod.cfg_board definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_board;

CREATE TABLE pcagdashboardprod.cfg_board (
	board_id varchar(22) NOT NULL,
	board_no varchar(20) NOT NULL,
	board_name varchar(20) NOT NULL,
	board_url varchar(200) NULL,
	board_icon_uri varchar(100) NULL,
	board_gf_id varchar(36) NULL,
	board_desc varchar(100) NULL,
	board_level numeric(2) NOT NULL DEFAULT 0,
	leaf_node varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	board_pid varchar(22) NULL,
	board_noa varchar(200) NULL,
	board_ida varchar(120) NULL,
	board_nma varchar(250) NULL,
	enabled varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_board_pk PRIMARY KEY (board_id)
);


-- pcagdashboardprod.cfg_board_dp_fact definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_board_dp_fact;

CREATE TABLE pcagdashboardprod.cfg_board_dp_fact (
	board_dp_fact_id varchar(22) NOT NULL,
	board_id varchar(22) NOT NULL,
	fact_id varchar(22) NOT NULL,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_board_dp_fact_pk PRIMARY KEY (board_dp_fact_id)
);


-- pcagdashboardprod.cfg_fact definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_fact;

CREATE TABLE pcagdashboardprod.cfg_fact (
	fact_id varchar(22) NOT NULL,
	fact_no varchar(6) NOT NULL,
	fact_name varchar(100) NULL,
	enabled varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_fact_pk PRIMARY KEY (fact_id)
);


-- pcagdashboardprod.cfg_gf_authority definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_gf_authority;

CREATE TABLE pcagdashboardprod.cfg_gf_authority (
	auth_id varchar(32) NOT NULL,
	user_id varchar(32) NOT NULL,
	entre_id varchar(32) NOT NULL,
	fact_id varchar(22) NOT NULL,
	"enable" varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	CONSTRAINT cfg_gf_authority_pk PRIMARY KEY (auth_id)
);


-- pcagdashboardprod.cfg_gf_entrance definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_gf_entrance;

CREATE TABLE pcagdashboardprod.cfg_gf_entrance (
	entre_id varchar(32) NOT NULL,
	entre_name varchar(40) NULL,
	"enable" varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	url text NULL,
	img text NULL,
	main varchar(1) NULL,
	CONSTRAINT cfg_gf_entrance_pk PRIMARY KEY (entre_id)
);


-- pcagdashboardprod.cfg_gf_fact definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_gf_fact;

CREATE TABLE pcagdashboardprod.cfg_gf_fact (
	fact_id varchar(22) NOT NULL,
	fact_no varchar(10) NOT NULL,
	fact_name varchar(50) NOT NULL,
	fact_name_en varchar(255) NULL,
	order_fact_no varchar(10) NOT NULL,
	fact_country_code varchar(30) NULL,
	fact_region_code varchar(30) NULL,
	"enable" varchar(2) NOT NULL DEFAULT 'Y'::character varying,
	fact_name_vn varchar(255) NULL,
	fact_name_id varchar(255) NULL,
	fact_timezone varchar(30) NOT NULL DEFAULT 'Asia/Taipei'::character varying,
	fact_no_merge varchar(10) NOT NULL,
	CONSTRAINT cfg_gf_fact_pk PRIMARY KEY (fact_id)
);
CREATE INDEX cfg_gf_fact_fact_no_idx ON pcagdashboardprod.cfg_gf_fact USING btree (fact_no);
CREATE INDEX cfg_gf_fact_fact_no_merge_idx ON pcagdashboardprod.cfg_gf_fact USING btree (fact_no_merge);


-- pcagdashboardprod.cfg_gf_user_info definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_gf_user_info;

CREATE TABLE pcagdashboardprod.cfg_gf_user_info (
	user_id varchar(32) NOT NULL,
	user_sso varchar(60) NULL,
	user_name varchar(40) NULL,
	user_email varchar(200) NOT NULL,
	"enable" varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	CONSTRAINT cfg_gf_user_info_pk PRIMARY KEY (user_id)
);


-- pcagdashboardprod.cfg_group definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_group;

CREATE TABLE pcagdashboardprod.cfg_group (
	group_id varchar(22) NOT NULL,
	group_pid varchar(22) NULL,
	group_no varchar(22) NOT NULL,
	group_name varchar(20) NULL,
	group_type varchar(1) NOT NULL DEFAULT 'G'::character varying,
	leaf_node varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	group_level numeric(2) NOT NULL DEFAULT 0,
	group_noa varchar(200) NULL,
	group_ida varchar(200) NULL,
	group_nma varchar(250) NULL,
	group_desc varchar(100) NULL,
	enabled varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_group_pk PRIMARY KEY (group_id)
);


-- pcagdashboardprod.cfg_group_member definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_group_member;

CREATE TABLE pcagdashboardprod.cfg_group_member (
	group_member_id varchar(22) NOT NULL,
	group_id varchar(22) NOT NULL,
	user_pccuid numeric(14) NOT NULL,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_group_member_pk PRIMARY KEY (group_member_id)
);


-- pcagdashboardprod.cfg_group_mgr definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_group_mgr;

CREATE TABLE pcagdashboardprod.cfg_group_mgr (
	group_mgr_id varchar(22) NOT NULL,
	group_id varchar(22) NOT NULL,
	user_pccuid numeric(14) NOT NULL,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_group_mgr_pk PRIMARY KEY (group_mgr_id)
);


-- pcagdashboardprod.cfg_kbn_sync definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_kbn_sync;

CREATE TABLE pcagdashboardprod.cfg_kbn_sync (
	sync_id varchar(22) NOT NULL,
	sync_desc varchar(100) NULL,
	dbcon_alias varchar(20) NOT NULL,
	sync_time_template numeric(19) NULL,
	sync_time_lang numeric(19) NULL,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_kbn_sync_pk PRIMARY KEY (sync_id)
);


-- pcagdashboardprod.cfg_kbn_template definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_kbn_template;

CREATE TABLE pcagdashboardprod.cfg_kbn_template (
	template_id varchar(22) NOT NULL,
	template_module varchar(20) NOT NULL,
	template_no varchar(20) NOT NULL,
	template_name varchar(100) NOT NULL,
	template_content text NOT NULL,
	enabled varchar NOT NULL DEFAULT 'Y'::character varying,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_kbn_template_pk PRIMARY KEY (template_id)
);


-- pcagdashboardprod.cfg_lang definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_lang;

CREATE TABLE pcagdashboardprod.cfg_lang (
	lang_id varchar(22) NOT NULL,
	lang_label varchar(20) NOT NULL,
	lang_no varchar(5) NOT NULL,
	enable_mk varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_lang_pk PRIMARY KEY (lang_id)
);


-- pcagdashboardprod.cfg_lang_data definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_lang_data;

CREATE TABLE pcagdashboardprod.cfg_lang_data (
	lang_data_id varchar(22) NOT NULL,
	app_no varchar(10) NOT NULL,
	lang_no varchar(5) NOT NULL,
	lang_key varchar(50) NOT NULL,
	lang_data varchar(100) NOT NULL,
	update_user numeric(14) NULL,
	update_time numeric NULL,
	CONSTRAINT cfg_lang_data_pk PRIMARY KEY (lang_data_id)
);


-- pcagdashboardprod.cfg_user definition

-- Drop table

-- DROP TABLE pcagdashboardprod.cfg_user;

CREATE TABLE pcagdashboardprod.cfg_user (
	user_id varchar(22) NOT NULL,
	user_pccuid numeric(14) NOT NULL,
	user_mail varchar(255) NOT NULL,
	enabled varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	update_user numeric(14) NULL,
	update_time numeric(19) NULL,
	CONSTRAINT cfg_user_pk PRIMARY KEY (user_id)
);