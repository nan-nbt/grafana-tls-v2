-- qmgt_query.cfg_gf_authority definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_authority;

CREATE TABLE qmgt_query.cfg_gf_authority (
	auth_id varchar(32) NOT NULL,
	user_id varchar(32) NOT NULL,
	entre_id varchar(32) NOT NULL,
	fact_id varchar(22) NOT NULL,
	"enable" varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	CONSTRAINT cfg_gf_authority_pk PRIMARY KEY (auth_id)
);


-- qmgt_query.cfg_gf_defect definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_defect;

CREATE TABLE qmgt_query.cfg_gf_defect (
	defect_id varchar(22) NOT NULL,
	defect_classification_id varchar(22) NOT NULL,
	defect_no varchar(30) NOT NULL,
	defect_desc varchar(255) NOT NULL,
	defect_category varchar(30) NOT NULL,
	"enable" varchar(2) NOT NULL DEFAULT 'Y'::character varying,
	defect_desc_vn varchar(255) NULL,
	defect_desc_id varchar(255) NULL,
	CONSTRAINT cfg_gf_defect_pk_1 PRIMARY KEY (defect_id)
);
CREATE INDEX cfg_gf_defect_defect_no_idx_1 ON qmgt_query.cfg_gf_defect USING btree (defect_no);


-- qmgt_query.cfg_gf_entrance definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_entrance;

CREATE TABLE qmgt_query.cfg_gf_entrance (
	entre_id varchar(32) NOT NULL,
	entre_name varchar(40) NULL,
	"enable" varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	url text NULL,
	img text NULL,
	CONSTRAINT cfg_gf_entrance_pk PRIMARY KEY (entre_id)
);


-- qmgt_query.cfg_gf_fact definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_fact;

CREATE TABLE qmgt_query.cfg_gf_fact (
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
	CONSTRAINT cfg_gf_fact_pk_1 PRIMARY KEY (fact_id)
);
CREATE INDEX cfg_gf_fact_fact_no_idx_1 ON qmgt_query.cfg_gf_fact USING btree (fact_no);
CREATE INDEX cfg_gf_fact_fact_no_merge_idx_1 ON qmgt_query.cfg_gf_fact USING btree (fact_no_merge);


-- qmgt_query.cfg_gf_fact_process definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_fact_process;

CREATE TABLE qmgt_query.cfg_gf_fact_process (
	fact_process_id varchar(22) NOT NULL,
	fact_id varchar(22) NOT NULL,
	line_type varchar(22) NOT NULL,
	process_id varchar(22) NOT NULL,
	process_group varchar(1) NOT NULL,
	"enable" varchar(2) NOT NULL DEFAULT 'Y'::character varying,
	fact_no varchar(10) NOT NULL,
	fact_no_merge varchar(10) NOT NULL,
	CONSTRAINT cfg_gf_fact_process_pk_1 PRIMARY KEY (fact_process_id)
);
CREATE INDEX cfg_gf_fact_process_fact_line_process_idx_1 ON qmgt_query.cfg_gf_fact_process USING btree (fact_id, line_type, process_id);
CREATE INDEX cfg_gf_fact_process_process_id_idx_1 ON qmgt_query.cfg_gf_fact_process USING btree (process_id);


-- qmgt_query.cfg_gf_inspec_period definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_inspec_period;

CREATE TABLE qmgt_query.cfg_gf_inspec_period (
	inspec_period_id varchar(22) NOT NULL,
	fact_no varchar(10) NULL,
	buildno varchar(100) NULL,
	inspec_period varchar(35) NULL,
	"enable" varchar(2) NOT NULL DEFAULT 'Y'::character varying,
	fact_no_merge varchar(10) NOT NULL,
	CONSTRAINT cfg_gf_inspec_period_pk_1 PRIMARY KEY (inspec_period_id)
);
CREATE INDEX cfg_gf_inspec_period_fact_build_period__idx_1 ON qmgt_query.cfg_gf_inspec_period USING btree (fact_no, buildno, inspec_period);
CREATE INDEX cfg_gf_inspec_period_factmerge_build_period_idx_1 ON qmgt_query.cfg_gf_inspec_period USING btree (fact_no_merge, buildno, inspec_period);


-- qmgt_query.cfg_gf_model definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_model;

CREATE TABLE qmgt_query.cfg_gf_model (
	model_id varchar(22) NOT NULL,
	model_name varchar(100) NULL,
	category varchar(35) NULL,
	"enable" varchar(2) NOT NULL DEFAULT 'Y'::character varying,
	CONSTRAINT cfg_model_pk_1 PRIMARY KEY (model_id)
);
CREATE INDEX cfg_model_category_idx_1 ON qmgt_query.cfg_gf_model USING btree (category);
CREATE INDEX cfg_model_model_name_idx_1 ON qmgt_query.cfg_gf_model USING btree (model_name);


-- qmgt_query.cfg_gf_model_article definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_model_article;

CREATE TABLE qmgt_query.cfg_gf_model_article (
	model_article_id varchar(22) NOT NULL,
	fact_id varchar(22) NOT NULL,
	model_id varchar(22) NOT NULL,
	article_no varchar(30) NOT NULL,
	"enable" varchar(2) NOT NULL DEFAULT 'Y'::character varying,
	fact_no varchar(10) NOT NULL,
	fact_no_merge varchar(10) NOT NULL,
	CONSTRAINT cfg_gf_model_article_pk_1 PRIMARY KEY (model_article_id)
);
CREATE INDEX cfg_gf_model_article_fact_no_art_idx_1 ON qmgt_query.cfg_gf_model_article USING btree (fact_no, article_no);
CREATE INDEX cfg_gf_model_article_merge_art_idx_1 ON qmgt_query.cfg_gf_model_article USING btree (fact_no_merge, article_no);


-- qmgt_query.cfg_gf_model_process definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_model_process;

CREATE TABLE qmgt_query.cfg_gf_model_process (
	model_process_id varchar(22) NOT NULL,
	fact_id varchar(22) NOT NULL,
	model_id varchar(22) NOT NULL,
	process_id varchar(22) NOT NULL,
	"enable" varchar(2) NOT NULL DEFAULT 'Y'::character varying,
	fact_no varchar(10) NOT NULL,
	fact_no_merge varchar(10) NOT NULL,
	CONSTRAINT cfg_gf_model_process_pk_1 PRIMARY KEY (model_process_id)
);
CREATE INDEX cfg_gf_model_process_factid_modelid_processid_idx_1 ON qmgt_query.cfg_gf_model_process USING btree (fact_id, model_id, process_id);
CREATE INDEX cfg_gf_model_process_merge_modelid_processid_idx_1 ON qmgt_query.cfg_gf_model_process USING btree (fact_no_merge, model_id, process_id);
CREATE INDEX cfg_gf_model_process_model_id_idx_1 ON qmgt_query.cfg_gf_model_process USING btree (model_id);
CREATE INDEX cfg_gf_model_process_process_id_idx_1 ON qmgt_query.cfg_gf_model_process USING btree (process_id);


-- qmgt_query.cfg_gf_process definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_process;

CREATE TABLE qmgt_query.cfg_gf_process (
	process_id varchar(22) NOT NULL,
	process_no varchar(35) NULL,
	process_desc varchar(255) NULL,
	"enable" varchar(2) NOT NULL DEFAULT 'Y'::character varying,
	CONSTRAINT cfg_process_pk_1 PRIMARY KEY (process_id)
);
CREATE INDEX cfg_process_process_id_idx_1 ON qmgt_query.cfg_gf_process USING btree (process_id);
CREATE INDEX cfg_process_process_no_idx_1 ON qmgt_query.cfg_gf_process USING btree (process_no);


-- qmgt_query.cfg_gf_process_defect definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_process_defect;

CREATE TABLE qmgt_query.cfg_gf_process_defect (
	process_defect_id varchar(22) NOT NULL,
	process_id varchar(22) NOT NULL,
	defect_id varchar(22) NOT NULL,
	"enable" varchar(2) NOT NULL DEFAULT 'Y'::character varying,
	CONSTRAINT cfg_gf_process_defect_pk_1 PRIMARY KEY (process_defect_id)
);
CREATE INDEX cfg_gf_process_defect_defect_id_idx_1 ON qmgt_query.cfg_gf_process_defect USING btree (defect_id);
CREATE INDEX cfg_gf_process_defect_process_id_idx_1 ON qmgt_query.cfg_gf_process_defect USING btree (process_id);


-- qmgt_query.cfg_gf_suggest definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_suggest;

CREATE TABLE qmgt_query.cfg_gf_suggest (
	suggest_id varchar(22) NOT NULL,
	suggest_no varchar(35) NULL,
	suggest_desc varchar(255) NULL,
	"enable" varchar(2) NOT NULL DEFAULT 'Y'::character varying,
	defect_id varchar(22) NOT NULL,
	CONSTRAINT cfg_gf_suggest_pk_1 PRIMARY KEY (suggest_id)
);
CREATE INDEX cfg_gf_suggest_defect_id_idx_1 ON qmgt_query.cfg_gf_suggest USING btree (defect_id);
CREATE INDEX cfg_gf_suggest_suggest_no_idx_1 ON qmgt_query.cfg_gf_suggest USING btree (suggest_no);


-- qmgt_query.cfg_gf_user_info definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_gf_user_info;

CREATE TABLE qmgt_query.cfg_gf_user_info (
	user_id varchar(32) NOT NULL,
	user_sso varchar(60) NULL,
	user_name varchar(40) NULL,
	user_email varchar(200) NOT NULL,
	"enable" varchar(1) NOT NULL DEFAULT 'Y'::character varying,
	CONSTRAINT cfg_gf_user_info_pk PRIMARY KEY (user_id)
);


-- qmgt_query.cfg_mes_gf_aopgroupctrl definition

-- Drop table

-- DROP TABLE qmgt_query.cfg_mes_gf_aopgroupctrl;

CREATE TABLE qmgt_query.cfg_mes_gf_aopgroupctrl (
	buildno varchar(100) NULL,
	arbpl varchar(100) NULL,
	stepname varchar(100) NULL,
	mainlineno varchar(100) NULL,
	sublineno varchar(100) NULL,
	opgroupno varchar(100) NULL,
	opgroupname varchar(255) NULL,
	opgroupdesc varchar(255) NULL,
	fact_id varchar(22) NULL,
	opgroup_id varchar(22) NOT NULL,
	"enable" varchar(2) NULL DEFAULT 'Y'::character varying,
	line_type varchar(22) NULL DEFAULT '1'::character varying,
	fact_no varchar(10) NOT NULL,
	fact_no_merge varchar(10) NOT NULL,
	CONSTRAINT cfg_mes_gf_aopgroupctrl_pk_1 PRIMARY KEY (opgroup_id)
);
CREATE INDEX cfg_mes_gf_aopgroupctrl_factno_opgroupno_idx_1 ON qmgt_query.cfg_mes_gf_aopgroupctrl USING btree (fact_no, opgroupno);
CREATE INDEX cfg_mes_gf_aopgroupctrl_merge_opgroupno_idx_1 ON qmgt_query.cfg_mes_gf_aopgroupctrl USING btree (fact_no_merge, opgroupno);


-- qmgt_query.new_user_id definition

-- Drop table

-- DROP TABLE qmgt_query.new_user_id;

CREATE TABLE qmgt_query.new_user_id (
	"?column?" text NULL
);


-- qmgt_query.tls_gf_inspection definition

-- Drop table

-- DROP TABLE qmgt_query.tls_gf_inspection;

CREATE TABLE qmgt_query.tls_gf_inspection (
	tls_inspection_id varchar(22) NOT NULL,
	inspection_no varchar(35) NULL,
	inspection_date varchar(8) NOT NULL,
	inspec_period varchar(35) NOT NULL,
	fact_id varchar(22) NOT NULL,
	buildno varchar(100) NULL,
	process_id varchar(22) NOT NULL,
	vbeln varchar(50) NULL,
	bstkd varchar(30) NULL,
	inspection_qty numeric NULL,
	pass_qty numeric NULL,
	defect_qty numeric NULL,
	insp_category varchar(30) NOT NULL,
	zzmdnam varchar(100) NULL,
	opgroup_id varchar(22) NULL,
	article_no varchar(30) NULL,
	category varchar(100) NULL DEFAULT '1'::character varying,
	fact_no varchar(10) NOT NULL,
	fact_no_merge varchar(10) NOT NULL,
	CONSTRAINT tls_gf_inspection_no_un_1 UNIQUE (inspection_no),
	CONSTRAINT tls_gf_inspection_pk_1 PRIMARY KEY (tls_inspection_id)
);
CREATE INDEX tls_gf_inspection_process_id_idx_1 ON qmgt_query.tls_gf_inspection USING btree (process_id);
CREATE INDEX tls_gf_inspection_tsl_inspection_id_idx ON qmgt_query.tls_gf_inspection USING btree (tls_inspection_id);
CREATE INDEX tls_gf_inspection_vbeln_idx_1 ON qmgt_query.tls_gf_inspection USING btree (vbeln);


-- qmgt_query.tls_gf_inspection_defect definition

-- Drop table

-- DROP TABLE qmgt_query.tls_gf_inspection_defect;

CREATE TABLE qmgt_query.tls_gf_inspection_defect (
	tls_inspection_defect_id varchar(22) NOT NULL,
	tls_inspection_id varchar(22) NOT NULL,
	defect_id varchar(22) NOT NULL,
	defect_num numeric NULL,
	defect_comment varchar(255) NULL,
	defect_rate numeric NULL DEFAULT 0,
	CONSTRAINT tls_gf_inspection_defect_pk_1 PRIMARY KEY (tls_inspection_defect_id)
);
CREATE INDEX tls_gf_inspection_defect_inspid_defectid_idx_1 ON qmgt_query.tls_gf_inspection_defect USING btree (tls_inspection_id, defect_id);
CREATE INDEX tls_gf_inspection_defect_tls_inspection_id_idx_1 ON qmgt_query.tls_gf_inspection_defect USING btree (tls_inspection_id);