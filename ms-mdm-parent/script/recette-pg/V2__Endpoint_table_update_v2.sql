-- Rename table ref_endpoint
ALTER TABLE ref_endpoint RENAME TO ref_endpoint_snap;

-- table ref_endpoint
CREATE TABLE IF NOT exists ref_endpoint (
  	id uuid PRIMARY KEY,
  	version integer NOT NULL,
  	path_endpoint varchar(200) NOT NULL,
  	module_id uuid NOT NULL,
  	is_active boolean NOT NULL DEFAULT TRUE,
  	creation_date  timestamp without time zone DEFAULT NULL,
    update_date timestamp without time zone DEFAULT NULL,
    created_by varchar(50) DEFAULT NULL,
    updated_by varchar(50) DEFAULT NULL,
    is_deleted boolean NOT NULL DEFAULT FALSE,
  CONSTRAINT fk_module_enpoint_id FOREIGN KEY (module_id) REFERENCES ref_module(id)
);

-- migrate data
insert into ref_endpoint (id, version, path_endpoint, module_id, creation_date, update_date, created_by, updated_by, is_deleted) 
select id, version, path_endpoint, module_id, creation_date, update_date, created_by, updated_by, is_deleted from ref_endpoint_snap;

-- drop ref_endpoint_snap
DROP TABLE IF EXISTS ref_endpoint_snap;

-- add unique constraint module code
ALTER TABLE ref_module ADD UNIQUE (code);