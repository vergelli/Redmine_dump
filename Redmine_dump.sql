--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4 (Debian 12.4-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO admin;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.attachments (
    id integer NOT NULL,
    container_id integer,
    container_type character varying(30),
    filename character varying DEFAULT ''::character varying NOT NULL,
    disk_filename character varying DEFAULT ''::character varying NOT NULL,
    filesize bigint DEFAULT 0 NOT NULL,
    content_type character varying DEFAULT ''::character varying,
    digest character varying(64) DEFAULT ''::character varying NOT NULL,
    downloads integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    description character varying,
    disk_directory character varying
);


ALTER TABLE public.attachments OWNER TO admin;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO admin;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_sources (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    host character varying(60),
    port integer,
    account character varying,
    account_password character varying DEFAULT ''::character varying,
    base_dn character varying(255),
    attr_login character varying(30),
    attr_firstname character varying(30),
    attr_lastname character varying(30),
    attr_mail character varying(30),
    onthefly_register boolean DEFAULT false NOT NULL,
    tls boolean DEFAULT false NOT NULL,
    filter text,
    timeout integer,
    verify_peer boolean DEFAULT true NOT NULL
);


ALTER TABLE public.auth_sources OWNER TO admin;

--
-- Name: auth_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_sources_id_seq OWNER TO admin;

--
-- Name: auth_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_sources_id_seq OWNED BY public.auth_sources.id;


--
-- Name: boards; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.boards (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying,
    "position" integer,
    topics_count integer DEFAULT 0 NOT NULL,
    messages_count integer DEFAULT 0 NOT NULL,
    last_message_id integer,
    parent_id integer
);


ALTER TABLE public.boards OWNER TO admin;

--
-- Name: boards_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.boards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_id_seq OWNER TO admin;

--
-- Name: boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.boards_id_seq OWNED BY public.boards.id;


--
-- Name: changes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.changes (
    id integer NOT NULL,
    changeset_id integer NOT NULL,
    action character varying(1) DEFAULT ''::character varying NOT NULL,
    path text NOT NULL,
    from_path text,
    from_revision character varying,
    revision character varying,
    branch character varying
);


ALTER TABLE public.changes OWNER TO admin;

--
-- Name: changes_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.changes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changes_id_seq OWNER TO admin;

--
-- Name: changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.changes_id_seq OWNED BY public.changes.id;


--
-- Name: changeset_parents; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.changeset_parents (
    changeset_id integer NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE public.changeset_parents OWNER TO admin;

--
-- Name: changesets; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.changesets (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    revision character varying NOT NULL,
    committer character varying,
    committed_on timestamp without time zone NOT NULL,
    comments text,
    commit_date date,
    scmid character varying,
    user_id integer
);


ALTER TABLE public.changesets OWNER TO admin;

--
-- Name: changesets_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.changesets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changesets_id_seq OWNER TO admin;

--
-- Name: changesets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.changesets_id_seq OWNED BY public.changesets.id;


--
-- Name: changesets_issues; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.changesets_issues (
    changeset_id integer NOT NULL,
    issue_id integer NOT NULL
);


ALTER TABLE public.changesets_issues OWNER TO admin;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    commented_type character varying(30) DEFAULT ''::character varying NOT NULL,
    commented_id integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    content text,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO admin;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO admin;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: custom_field_enumerations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.custom_field_enumerations (
    id integer NOT NULL,
    custom_field_id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "position" integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.custom_field_enumerations OWNER TO admin;

--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.custom_field_enumerations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_field_enumerations_id_seq OWNER TO admin;

--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.custom_field_enumerations_id_seq OWNED BY public.custom_field_enumerations.id;


--
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.custom_fields (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    field_format character varying(30) DEFAULT ''::character varying NOT NULL,
    possible_values text,
    regexp character varying DEFAULT ''::character varying,
    min_length integer,
    max_length integer,
    is_required boolean DEFAULT false NOT NULL,
    is_for_all boolean DEFAULT false NOT NULL,
    is_filter boolean DEFAULT false NOT NULL,
    "position" integer,
    searchable boolean DEFAULT false,
    default_value text,
    editable boolean DEFAULT true,
    visible boolean DEFAULT true NOT NULL,
    multiple boolean DEFAULT false,
    format_store text,
    description text,
    dmsf_not_inheritable boolean
);


ALTER TABLE public.custom_fields OWNER TO admin;

--
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.custom_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_fields_id_seq OWNER TO admin;

--
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.custom_fields_id_seq OWNED BY public.custom_fields.id;


--
-- Name: custom_fields_projects; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.custom_fields_projects (
    custom_field_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_projects OWNER TO admin;

--
-- Name: custom_fields_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.custom_fields_roles (
    custom_field_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.custom_fields_roles OWNER TO admin;

--
-- Name: custom_fields_trackers; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.custom_fields_trackers (
    custom_field_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_trackers OWNER TO admin;

--
-- Name: custom_values; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.custom_values (
    id integer NOT NULL,
    customized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    customized_id integer DEFAULT 0 NOT NULL,
    custom_field_id integer DEFAULT 0 NOT NULL,
    value text
);


ALTER TABLE public.custom_values OWNER TO admin;

--
-- Name: custom_values_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.custom_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_values_id_seq OWNER TO admin;

--
-- Name: custom_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.custom_values_id_seq OWNED BY public.custom_values.id;


--
-- Name: dmsf_file_revision_accesses; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_file_revision_accesses (
    id integer NOT NULL,
    dmsf_file_revision_id integer NOT NULL,
    action integer DEFAULT 0 NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.dmsf_file_revision_accesses OWNER TO admin;

--
-- Name: dmsf_file_revision_accesses_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_file_revision_accesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_file_revision_accesses_id_seq OWNER TO admin;

--
-- Name: dmsf_file_revision_accesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_file_revision_accesses_id_seq OWNED BY public.dmsf_file_revision_accesses.id;


--
-- Name: dmsf_file_revisions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_file_revisions (
    id integer NOT NULL,
    dmsf_file_id integer NOT NULL,
    source_dmsf_file_revision_id integer,
    name character varying NOT NULL,
    disk_filename character varying NOT NULL,
    size bigint,
    mime_type character varying,
    title character varying NOT NULL,
    description text,
    workflow integer,
    major_version integer NOT NULL,
    minor_version integer NOT NULL,
    comment text,
    deleted integer DEFAULT 0 NOT NULL,
    deleted_by_user_id integer,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    dmsf_workflow_id integer,
    dmsf_workflow_assigned_by_user_id integer,
    dmsf_workflow_assigned_at timestamp without time zone,
    dmsf_workflow_started_by_user_id integer,
    dmsf_workflow_started_at timestamp without time zone,
    digest character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.dmsf_file_revisions OWNER TO admin;

--
-- Name: dmsf_file_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_file_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_file_revisions_id_seq OWNER TO admin;

--
-- Name: dmsf_file_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_file_revisions_id_seq OWNED BY public.dmsf_file_revisions.id;


--
-- Name: dmsf_files; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_files (
    id integer NOT NULL,
    project_id integer NOT NULL,
    dmsf_folder_id integer,
    name character varying NOT NULL,
    notification boolean DEFAULT false,
    deleted integer DEFAULT 0 NOT NULL,
    deleted_by_user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.dmsf_files OWNER TO admin;

--
-- Name: dmsf_files_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_files_id_seq OWNER TO admin;

--
-- Name: dmsf_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_files_id_seq OWNED BY public.dmsf_files.id;


--
-- Name: dmsf_folder_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_folder_permissions (
    id integer NOT NULL,
    dmsf_folder_id integer,
    object_id integer NOT NULL,
    object_type character varying(30) NOT NULL
);


ALTER TABLE public.dmsf_folder_permissions OWNER TO admin;

--
-- Name: dmsf_folder_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_folder_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_folder_permissions_id_seq OWNER TO admin;

--
-- Name: dmsf_folder_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_folder_permissions_id_seq OWNED BY public.dmsf_folder_permissions.id;


--
-- Name: dmsf_folders; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_folders (
    id integer NOT NULL,
    project_id integer NOT NULL,
    dmsf_folder_id integer,
    title character varying NOT NULL,
    description text,
    notification boolean DEFAULT false,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted integer DEFAULT 0 NOT NULL,
    deleted_by_user_id integer,
    system boolean DEFAULT false NOT NULL
);


ALTER TABLE public.dmsf_folders OWNER TO admin;

--
-- Name: dmsf_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_folders_id_seq OWNER TO admin;

--
-- Name: dmsf_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_folders_id_seq OWNED BY public.dmsf_folders.id;


--
-- Name: dmsf_links; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_links (
    id integer NOT NULL,
    target_project_id integer NOT NULL,
    target_id integer,
    target_type character varying(10) NOT NULL,
    name character varying NOT NULL,
    project_id integer NOT NULL,
    dmsf_folder_id integer,
    deleted integer DEFAULT 0 NOT NULL,
    deleted_by_user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_url character varying,
    user_id integer
);


ALTER TABLE public.dmsf_links OWNER TO admin;

--
-- Name: dmsf_links_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_links_id_seq OWNER TO admin;

--
-- Name: dmsf_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_links_id_seq OWNED BY public.dmsf_links.id;


--
-- Name: dmsf_locks; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_locks (
    id integer NOT NULL,
    entity_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    entity_type integer NOT NULL,
    lock_type_cd integer NOT NULL,
    lock_scope_cd integer NOT NULL,
    uuid character varying(36),
    expires_at timestamp without time zone,
    dmsf_file_last_revision_id integer,
    owner character varying
);


ALTER TABLE public.dmsf_locks OWNER TO admin;

--
-- Name: dmsf_locks_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_locks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_locks_id_seq OWNER TO admin;

--
-- Name: dmsf_locks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_locks_id_seq OWNED BY public.dmsf_locks.id;


--
-- Name: dmsf_public_urls; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_public_urls (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    dmsf_file_id integer NOT NULL,
    user_id integer NOT NULL,
    expire_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.dmsf_public_urls OWNER TO admin;

--
-- Name: dmsf_public_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_public_urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_public_urls_id_seq OWNER TO admin;

--
-- Name: dmsf_public_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_public_urls_id_seq OWNED BY public.dmsf_public_urls.id;


--
-- Name: dmsf_workflow_step_actions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_workflow_step_actions (
    id integer NOT NULL,
    dmsf_workflow_step_assignment_id integer NOT NULL,
    action integer NOT NULL,
    note text,
    created_at timestamp without time zone NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.dmsf_workflow_step_actions OWNER TO admin;

--
-- Name: dmsf_workflow_step_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_workflow_step_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_workflow_step_actions_id_seq OWNER TO admin;

--
-- Name: dmsf_workflow_step_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_workflow_step_actions_id_seq OWNED BY public.dmsf_workflow_step_actions.id;


--
-- Name: dmsf_workflow_step_assignments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_workflow_step_assignments (
    id integer NOT NULL,
    dmsf_workflow_step_id integer NOT NULL,
    user_id integer NOT NULL,
    dmsf_file_revision_id integer NOT NULL
);


ALTER TABLE public.dmsf_workflow_step_assignments OWNER TO admin;

--
-- Name: dmsf_workflow_step_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_workflow_step_assignments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_workflow_step_assignments_id_seq OWNER TO admin;

--
-- Name: dmsf_workflow_step_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_workflow_step_assignments_id_seq OWNED BY public.dmsf_workflow_step_assignments.id;


--
-- Name: dmsf_workflow_steps; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_workflow_steps (
    id integer NOT NULL,
    dmsf_workflow_id integer NOT NULL,
    step integer NOT NULL,
    user_id integer NOT NULL,
    operator integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.dmsf_workflow_steps OWNER TO admin;

--
-- Name: dmsf_workflow_steps_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_workflow_steps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_workflow_steps_id_seq OWNER TO admin;

--
-- Name: dmsf_workflow_steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_workflow_steps_id_seq OWNED BY public.dmsf_workflow_steps.id;


--
-- Name: dmsf_workflows; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dmsf_workflows (
    id integer NOT NULL,
    name character varying NOT NULL,
    project_id integer,
    status integer DEFAULT 1 NOT NULL,
    updated_on timestamp without time zone,
    created_on timestamp without time zone,
    author_id integer
);


ALTER TABLE public.dmsf_workflows OWNER TO admin;

--
-- Name: dmsf_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dmsf_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dmsf_workflows_id_seq OWNER TO admin;

--
-- Name: dmsf_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dmsf_workflows_id_seq OWNED BY public.dmsf_workflows.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    description text,
    created_on timestamp without time zone
);


ALTER TABLE public.documents OWNER TO admin;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO admin;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: easy_entity_assignments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.easy_entity_assignments (
    id integer NOT NULL,
    entity_from_type character varying,
    entity_from_id integer,
    entity_to_type character varying,
    entity_to_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.easy_entity_assignments OWNER TO admin;

--
-- Name: easy_entity_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.easy_entity_assignments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_entity_assignments_id_seq OWNER TO admin;

--
-- Name: easy_entity_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.easy_entity_assignments_id_seq OWNED BY public.easy_entity_assignments.id;


--
-- Name: easy_settings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.easy_settings (
    id integer NOT NULL,
    type character varying,
    name character varying,
    value text,
    project_id integer
);


ALTER TABLE public.easy_settings OWNER TO admin;

--
-- Name: easy_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.easy_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_settings_id_seq OWNER TO admin;

--
-- Name: easy_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.easy_settings_id_seq OWNED BY public.easy_settings.id;


--
-- Name: email_addresses; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.email_addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address character varying NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    notify boolean DEFAULT true NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.email_addresses OWNER TO admin;

--
-- Name: email_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.email_addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_addresses_id_seq OWNER TO admin;

--
-- Name: email_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.email_addresses_id_seq OWNED BY public.email_addresses.id;


--
-- Name: enabled_modules; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.enabled_modules (
    id integer NOT NULL,
    project_id integer,
    name character varying NOT NULL
);


ALTER TABLE public.enabled_modules OWNER TO admin;

--
-- Name: enabled_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.enabled_modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enabled_modules_id_seq OWNER TO admin;

--
-- Name: enabled_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.enabled_modules_id_seq OWNED BY public.enabled_modules.id;


--
-- Name: enumerations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.enumerations (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    is_default boolean DEFAULT false NOT NULL,
    type character varying,
    active boolean DEFAULT true NOT NULL,
    project_id integer,
    parent_id integer,
    position_name character varying(30)
);


ALTER TABLE public.enumerations OWNER TO admin;

--
-- Name: enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.enumerations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enumerations_id_seq OWNER TO admin;

--
-- Name: enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.enumerations_id_seq OWNED BY public.enumerations.id;


--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.groups_users (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.groups_users OWNER TO admin;

--
-- Name: import_items; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.import_items (
    id integer NOT NULL,
    import_id integer NOT NULL,
    "position" integer NOT NULL,
    obj_id integer,
    message text,
    unique_id character varying
);


ALTER TABLE public.import_items OWNER TO admin;

--
-- Name: import_items_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.import_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.import_items_id_seq OWNER TO admin;

--
-- Name: import_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.import_items_id_seq OWNED BY public.import_items.id;


--
-- Name: imports; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.imports (
    id integer NOT NULL,
    type character varying,
    user_id integer NOT NULL,
    filename character varying,
    settings text,
    total_items integer,
    finished boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.imports OWNER TO admin;

--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.imports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imports_id_seq OWNER TO admin;

--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- Name: issue_categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.issue_categories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    assigned_to_id integer
);


ALTER TABLE public.issue_categories OWNER TO admin;

--
-- Name: issue_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.issue_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_categories_id_seq OWNER TO admin;

--
-- Name: issue_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.issue_categories_id_seq OWNED BY public.issue_categories.id;


--
-- Name: issue_relations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.issue_relations (
    id integer NOT NULL,
    issue_from_id integer NOT NULL,
    issue_to_id integer NOT NULL,
    relation_type character varying DEFAULT ''::character varying NOT NULL,
    delay integer
);


ALTER TABLE public.issue_relations OWNER TO admin;

--
-- Name: issue_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.issue_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_relations_id_seq OWNER TO admin;

--
-- Name: issue_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.issue_relations_id_seq OWNED BY public.issue_relations.id;


--
-- Name: issue_statuses; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.issue_statuses (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    "position" integer,
    default_done_ratio integer
);


ALTER TABLE public.issue_statuses OWNER TO admin;

--
-- Name: issue_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.issue_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_statuses_id_seq OWNER TO admin;

--
-- Name: issue_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.issue_statuses_id_seq OWNED BY public.issue_statuses.id;


--
-- Name: issues; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.issues (
    id integer NOT NULL,
    tracker_id integer NOT NULL,
    project_id integer NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    description text,
    due_date date,
    category_id integer,
    status_id integer NOT NULL,
    assigned_to_id integer,
    priority_id integer NOT NULL,
    fixed_version_id integer,
    author_id integer NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    start_date date,
    done_ratio integer DEFAULT 0 NOT NULL,
    estimated_hours double precision,
    parent_id integer,
    root_id integer,
    lft integer,
    rgt integer,
    is_private boolean DEFAULT false NOT NULL,
    closed_on timestamp without time zone,
    project_key character varying(10),
    issue_number integer
);


ALTER TABLE public.issues OWNER TO admin;

--
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.issues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issues_id_seq OWNER TO admin;

--
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.issues_id_seq OWNED BY public.issues.id;


--
-- Name: journal_details; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.journal_details (
    id integer NOT NULL,
    journal_id integer DEFAULT 0 NOT NULL,
    property character varying(30) DEFAULT ''::character varying NOT NULL,
    prop_key character varying(30) DEFAULT ''::character varying NOT NULL,
    old_value text,
    value text
);


ALTER TABLE public.journal_details OWNER TO admin;

--
-- Name: journal_details_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.journal_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_details_id_seq OWNER TO admin;

--
-- Name: journal_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.journal_details_id_seq OWNED BY public.journal_details.id;


--
-- Name: journals; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.journals (
    id integer NOT NULL,
    journalized_id integer DEFAULT 0 NOT NULL,
    journalized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    notes text,
    created_on timestamp without time zone NOT NULL,
    private_notes boolean DEFAULT false NOT NULL
);


ALTER TABLE public.journals OWNER TO admin;

--
-- Name: journals_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journals_id_seq OWNER TO admin;

--
-- Name: journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.journals_id_seq OWNED BY public.journals.id;


--
-- Name: member_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.member_roles (
    id integer NOT NULL,
    member_id integer NOT NULL,
    role_id integer NOT NULL,
    inherited_from integer
);


ALTER TABLE public.member_roles OWNER TO admin;

--
-- Name: member_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.member_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_roles_id_seq OWNER TO admin;

--
-- Name: member_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.member_roles_id_seq OWNED BY public.member_roles.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.members (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    mail_notification boolean DEFAULT false NOT NULL,
    dmsf_mail_notification boolean,
    dmsf_title_format text,
    dmsf_fast_links boolean DEFAULT false NOT NULL
);


ALTER TABLE public.members OWNER TO admin;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO admin;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    board_id integer NOT NULL,
    parent_id integer,
    subject character varying DEFAULT ''::character varying NOT NULL,
    content text,
    author_id integer,
    replies_count integer DEFAULT 0 NOT NULL,
    last_reply_id integer,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    locked boolean DEFAULT false,
    sticky integer DEFAULT 0
);


ALTER TABLE public.messages OWNER TO admin;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO admin;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: moved_issues; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.moved_issues (
    id integer NOT NULL,
    issue_id integer,
    old_key character varying(10),
    old_number integer
);


ALTER TABLE public.moved_issues OWNER TO admin;

--
-- Name: moved_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.moved_issues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moved_issues_id_seq OWNER TO admin;

--
-- Name: moved_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.moved_issues_id_seq OWNED BY public.moved_issues.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.news (
    id integer NOT NULL,
    project_id integer,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    summary character varying(255) DEFAULT ''::character varying,
    description text,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    comments_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.news OWNER TO admin;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO admin;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: open_id_authentication_associations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.open_id_authentication_associations (
    id integer NOT NULL,
    issued integer,
    lifetime integer,
    handle character varying,
    assoc_type character varying,
    server_url bytea,
    secret bytea
);


ALTER TABLE public.open_id_authentication_associations OWNER TO admin;

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.open_id_authentication_associations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_associations_id_seq OWNER TO admin;

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.open_id_authentication_associations_id_seq OWNED BY public.open_id_authentication_associations.id;


--
-- Name: open_id_authentication_nonces; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.open_id_authentication_nonces (
    id integer NOT NULL,
    "timestamp" integer NOT NULL,
    server_url character varying,
    salt character varying NOT NULL
);


ALTER TABLE public.open_id_authentication_nonces OWNER TO admin;

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.open_id_authentication_nonces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_nonces_id_seq OWNER TO admin;

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.open_id_authentication_nonces_id_seq OWNED BY public.open_id_authentication_nonces.id;


--
-- Name: project_issue_keys; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.project_issue_keys (
    id integer NOT NULL,
    project_key character varying(10) NOT NULL,
    last_issue_number integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.project_issue_keys OWNER TO admin;

--
-- Name: project_issue_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.project_issue_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_issue_keys_id_seq OWNER TO admin;

--
-- Name: project_issue_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.project_issue_keys_id_seq OWNED BY public.project_issue_keys.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    homepage character varying DEFAULT ''::character varying,
    is_public boolean DEFAULT true NOT NULL,
    parent_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    identifier character varying,
    status integer DEFAULT 1 NOT NULL,
    lft integer,
    rgt integer,
    inherit_members boolean DEFAULT false NOT NULL,
    default_version_id integer,
    default_assigned_to_id integer,
    dmsf_description text,
    dmsf_notification boolean DEFAULT false,
    dmsf_act_as_attachable integer DEFAULT 1 NOT NULL,
    issue_key character varying(10)
);


ALTER TABLE public.projects OWNER TO admin;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO admin;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: projects_trackers; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.projects_trackers (
    project_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.projects_trackers OWNER TO admin;

--
-- Name: queries; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.queries (
    id integer NOT NULL,
    project_id integer,
    name character varying DEFAULT ''::character varying NOT NULL,
    filters text,
    user_id integer DEFAULT 0 NOT NULL,
    column_names text,
    sort_criteria text,
    group_by character varying,
    type character varying,
    visibility integer DEFAULT 0,
    options text
);


ALTER TABLE public.queries OWNER TO admin;

--
-- Name: queries_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.queries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queries_id_seq OWNER TO admin;

--
-- Name: queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.queries_id_seq OWNED BY public.queries.id;


--
-- Name: queries_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.queries_roles (
    query_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.queries_roles OWNER TO admin;

--
-- Name: repositories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.repositories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    url character varying DEFAULT ''::character varying NOT NULL,
    login character varying(60) DEFAULT ''::character varying,
    password character varying DEFAULT ''::character varying,
    root_url character varying(255) DEFAULT ''::character varying,
    type character varying,
    path_encoding character varying(64) DEFAULT NULL::character varying,
    log_encoding character varying(64) DEFAULT NULL::character varying,
    extra_info text,
    identifier character varying,
    is_default boolean DEFAULT false,
    created_on timestamp without time zone
);


ALTER TABLE public.repositories OWNER TO admin;

--
-- Name: repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.repositories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repositories_id_seq OWNER TO admin;

--
-- Name: repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.repositories_id_seq OWNED BY public.repositories.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    assignable boolean DEFAULT true,
    builtin integer DEFAULT 0 NOT NULL,
    permissions text,
    issues_visibility character varying(30) DEFAULT 'default'::character varying NOT NULL,
    users_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    time_entries_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    all_roles_managed boolean DEFAULT true NOT NULL,
    settings text
);


ALTER TABLE public.roles OWNER TO admin;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO admin;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roles_managed_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.roles_managed_roles (
    role_id integer NOT NULL,
    managed_role_id integer NOT NULL
);


ALTER TABLE public.roles_managed_roles OWNER TO admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO admin;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value text,
    updated_on timestamp without time zone
);


ALTER TABLE public.settings OWNER TO admin;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO admin;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: time_entries; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.time_entries (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    issue_id integer,
    hours double precision NOT NULL,
    comments character varying(1024),
    activity_id integer NOT NULL,
    spent_on date NOT NULL,
    tyear integer NOT NULL,
    tmonth integer NOT NULL,
    tweek integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    author_id integer
);


ALTER TABLE public.time_entries OWNER TO admin;

--
-- Name: time_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.time_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_entries_id_seq OWNER TO admin;

--
-- Name: time_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.time_entries_id_seq OWNED BY public.time_entries.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    action character varying(30) DEFAULT ''::character varying NOT NULL,
    value character varying(40) DEFAULT ''::character varying NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone
);


ALTER TABLE public.tokens OWNER TO admin;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO admin;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: trackers; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.trackers (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_in_chlog boolean DEFAULT false NOT NULL,
    "position" integer,
    is_in_roadmap boolean DEFAULT true NOT NULL,
    fields_bits integer DEFAULT 0,
    default_status_id integer,
    description character varying
);


ALTER TABLE public.trackers OWNER TO admin;

--
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.trackers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trackers_id_seq OWNER TO admin;

--
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.trackers_id_seq OWNED BY public.trackers.id;


--
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_preferences (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    others text,
    hide_mail boolean DEFAULT true,
    time_zone character varying
);


ALTER TABLE public.user_preferences OWNER TO admin;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_preferences_id_seq OWNER TO admin;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_preferences_id_seq OWNED BY public.user_preferences.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying DEFAULT ''::character varying NOT NULL,
    hashed_password character varying(40) DEFAULT ''::character varying NOT NULL,
    firstname character varying(30) DEFAULT ''::character varying NOT NULL,
    lastname character varying(255) DEFAULT ''::character varying NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    last_login_on timestamp without time zone,
    language character varying(5) DEFAULT ''::character varying,
    auth_source_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    type character varying,
    identity_url character varying,
    mail_notification character varying DEFAULT ''::character varying NOT NULL,
    salt character varying(64),
    must_change_passwd boolean DEFAULT false NOT NULL,
    passwd_changed_on timestamp without time zone,
    twofa_scheme character varying,
    twofa_totp_key character varying,
    twofa_totp_last_used_at integer
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.versions (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying,
    effective_date date,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    wiki_page_title character varying,
    status character varying DEFAULT 'open'::character varying,
    sharing character varying DEFAULT 'none'::character varying NOT NULL
);


ALTER TABLE public.versions OWNER TO admin;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_id_seq OWNER TO admin;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: watchers; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.watchers (
    id integer NOT NULL,
    watchable_type character varying DEFAULT ''::character varying NOT NULL,
    watchable_id integer DEFAULT 0 NOT NULL,
    user_id integer
);


ALTER TABLE public.watchers OWNER TO admin;

--
-- Name: watchers_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.watchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watchers_id_seq OWNER TO admin;

--
-- Name: watchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.watchers_id_seq OWNED BY public.watchers.id;


--
-- Name: wiki_content_versions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.wiki_content_versions (
    id integer NOT NULL,
    wiki_content_id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    data bytea,
    compression character varying(6) DEFAULT ''::character varying,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_content_versions OWNER TO admin;

--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.wiki_content_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_content_versions_id_seq OWNER TO admin;

--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.wiki_content_versions_id_seq OWNED BY public.wiki_content_versions.id;


--
-- Name: wiki_contents; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.wiki_contents (
    id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    text text,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_contents OWNER TO admin;

--
-- Name: wiki_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.wiki_contents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_contents_id_seq OWNER TO admin;

--
-- Name: wiki_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.wiki_contents_id_seq OWNED BY public.wiki_contents.id;


--
-- Name: wiki_pages; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.wiki_pages (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying(255) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    parent_id integer
);


ALTER TABLE public.wiki_pages OWNER TO admin;

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.wiki_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_pages_id_seq OWNER TO admin;

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.wiki_pages_id_seq OWNED BY public.wiki_pages.id;


--
-- Name: wiki_redirects; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.wiki_redirects (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying,
    redirects_to character varying,
    created_on timestamp without time zone NOT NULL,
    redirects_to_wiki_id integer NOT NULL
);


ALTER TABLE public.wiki_redirects OWNER TO admin;

--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.wiki_redirects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_redirects_id_seq OWNER TO admin;

--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.wiki_redirects_id_seq OWNED BY public.wiki_redirects.id;


--
-- Name: wikis; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.wikis (
    id integer NOT NULL,
    project_id integer NOT NULL,
    start_page character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.wikis OWNER TO admin;

--
-- Name: wikis_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.wikis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wikis_id_seq OWNER TO admin;

--
-- Name: wikis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.wikis_id_seq OWNED BY public.wikis.id;


--
-- Name: workflows; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.workflows (
    id integer NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL,
    old_status_id integer DEFAULT 0 NOT NULL,
    new_status_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    assignee boolean DEFAULT false NOT NULL,
    author boolean DEFAULT false NOT NULL,
    type character varying(30),
    field_name character varying(30),
    rule character varying(30)
);


ALTER TABLE public.workflows OWNER TO admin;

--
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflows_id_seq OWNER TO admin;

--
-- Name: workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.workflows_id_seq OWNED BY public.workflows.id;


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: auth_sources id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN id SET DEFAULT nextval('public.auth_sources_id_seq'::regclass);


--
-- Name: boards id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.boards ALTER COLUMN id SET DEFAULT nextval('public.boards_id_seq'::regclass);


--
-- Name: changes id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.changes ALTER COLUMN id SET DEFAULT nextval('public.changes_id_seq'::regclass);


--
-- Name: changesets id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.changesets ALTER COLUMN id SET DEFAULT nextval('public.changesets_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: custom_field_enumerations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.custom_field_enumerations ALTER COLUMN id SET DEFAULT nextval('public.custom_field_enumerations_id_seq'::regclass);


--
-- Name: custom_fields id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.custom_fields ALTER COLUMN id SET DEFAULT nextval('public.custom_fields_id_seq'::regclass);


--
-- Name: custom_values id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.custom_values ALTER COLUMN id SET DEFAULT nextval('public.custom_values_id_seq'::regclass);


--
-- Name: dmsf_file_revision_accesses id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_file_revision_accesses ALTER COLUMN id SET DEFAULT nextval('public.dmsf_file_revision_accesses_id_seq'::regclass);


--
-- Name: dmsf_file_revisions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_file_revisions ALTER COLUMN id SET DEFAULT nextval('public.dmsf_file_revisions_id_seq'::regclass);


--
-- Name: dmsf_files id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_files ALTER COLUMN id SET DEFAULT nextval('public.dmsf_files_id_seq'::regclass);


--
-- Name: dmsf_folder_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_folder_permissions ALTER COLUMN id SET DEFAULT nextval('public.dmsf_folder_permissions_id_seq'::regclass);


--
-- Name: dmsf_folders id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_folders ALTER COLUMN id SET DEFAULT nextval('public.dmsf_folders_id_seq'::regclass);


--
-- Name: dmsf_links id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_links ALTER COLUMN id SET DEFAULT nextval('public.dmsf_links_id_seq'::regclass);


--
-- Name: dmsf_locks id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_locks ALTER COLUMN id SET DEFAULT nextval('public.dmsf_locks_id_seq'::regclass);


--
-- Name: dmsf_public_urls id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_public_urls ALTER COLUMN id SET DEFAULT nextval('public.dmsf_public_urls_id_seq'::regclass);


--
-- Name: dmsf_workflow_step_actions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_workflow_step_actions ALTER COLUMN id SET DEFAULT nextval('public.dmsf_workflow_step_actions_id_seq'::regclass);


--
-- Name: dmsf_workflow_step_assignments id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_workflow_step_assignments ALTER COLUMN id SET DEFAULT nextval('public.dmsf_workflow_step_assignments_id_seq'::regclass);


--
-- Name: dmsf_workflow_steps id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_workflow_steps ALTER COLUMN id SET DEFAULT nextval('public.dmsf_workflow_steps_id_seq'::regclass);


--
-- Name: dmsf_workflows id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_workflows ALTER COLUMN id SET DEFAULT nextval('public.dmsf_workflows_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: easy_entity_assignments id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.easy_entity_assignments ALTER COLUMN id SET DEFAULT nextval('public.easy_entity_assignments_id_seq'::regclass);


--
-- Name: easy_settings id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.easy_settings ALTER COLUMN id SET DEFAULT nextval('public.easy_settings_id_seq'::regclass);


--
-- Name: email_addresses id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.email_addresses ALTER COLUMN id SET DEFAULT nextval('public.email_addresses_id_seq'::regclass);


--
-- Name: enabled_modules id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enabled_modules ALTER COLUMN id SET DEFAULT nextval('public.enabled_modules_id_seq'::regclass);


--
-- Name: enumerations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enumerations ALTER COLUMN id SET DEFAULT nextval('public.enumerations_id_seq'::regclass);


--
-- Name: import_items id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.import_items ALTER COLUMN id SET DEFAULT nextval('public.import_items_id_seq'::regclass);


--
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- Name: issue_categories id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.issue_categories ALTER COLUMN id SET DEFAULT nextval('public.issue_categories_id_seq'::regclass);


--
-- Name: issue_relations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.issue_relations ALTER COLUMN id SET DEFAULT nextval('public.issue_relations_id_seq'::regclass);


--
-- Name: issue_statuses id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.issue_statuses ALTER COLUMN id SET DEFAULT nextval('public.issue_statuses_id_seq'::regclass);


--
-- Name: issues id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.issues ALTER COLUMN id SET DEFAULT nextval('public.issues_id_seq'::regclass);


--
-- Name: journal_details id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.journal_details ALTER COLUMN id SET DEFAULT nextval('public.journal_details_id_seq'::regclass);


--
-- Name: journals id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.journals ALTER COLUMN id SET DEFAULT nextval('public.journals_id_seq'::regclass);


--
-- Name: member_roles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.member_roles ALTER COLUMN id SET DEFAULT nextval('public.member_roles_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: moved_issues id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.moved_issues ALTER COLUMN id SET DEFAULT nextval('public.moved_issues_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: open_id_authentication_associations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.open_id_authentication_associations ALTER COLUMN id SET DEFAULT nextval('public.open_id_authentication_associations_id_seq'::regclass);


--
-- Name: open_id_authentication_nonces id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.open_id_authentication_nonces ALTER COLUMN id SET DEFAULT nextval('public.open_id_authentication_nonces_id_seq'::regclass);


--
-- Name: project_issue_keys id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.project_issue_keys ALTER COLUMN id SET DEFAULT nextval('public.project_issue_keys_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: queries id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.queries ALTER COLUMN id SET DEFAULT nextval('public.queries_id_seq'::regclass);


--
-- Name: repositories id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.repositories ALTER COLUMN id SET DEFAULT nextval('public.repositories_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: time_entries id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.time_entries ALTER COLUMN id SET DEFAULT nextval('public.time_entries_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: trackers id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.trackers ALTER COLUMN id SET DEFAULT nextval('public.trackers_id_seq'::regclass);


--
-- Name: user_preferences id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_preferences ALTER COLUMN id SET DEFAULT nextval('public.user_preferences_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: watchers id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.watchers ALTER COLUMN id SET DEFAULT nextval('public.watchers_id_seq'::regclass);


--
-- Name: wiki_content_versions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.wiki_content_versions ALTER COLUMN id SET DEFAULT nextval('public.wiki_content_versions_id_seq'::regclass);


--
-- Name: wiki_contents id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.wiki_contents ALTER COLUMN id SET DEFAULT nextval('public.wiki_contents_id_seq'::regclass);


--
-- Name: wiki_pages id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.wiki_pages ALTER COLUMN id SET DEFAULT nextval('public.wiki_pages_id_seq'::regclass);


--
-- Name: wiki_redirects id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.wiki_redirects ALTER COLUMN id SET DEFAULT nextval('public.wiki_redirects_id_seq'::regclass);


--
-- Name: wikis id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.wikis ALTER COLUMN id SET DEFAULT nextval('public.wikis_id_seq'::regclass);


--
-- Name: workflows id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.workflows ALTER COLUMN id SET DEFAULT nextval('public.workflows_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2021-08-25 12:31:49.58528	2021-08-25 12:31:49.58528
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) FROM stdin;
2	\N	\N	SBM-OBC-NC-00004 SBC_EM_Listado_Seguimiento_No_Conformidad_Perdida_trazabilidad_Proyecto_PCB.xlsx	210924132403_f2cb456a567b7c85fa8a490fb2c588b1.xlsx	14964	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	9fa4208bd22aa2f4e8e4d39556a5ca94082f7afa6e8656176f9329a2d93f106c	0	1	2021-09-24 13:24:03.529678	\N	2021/09
3	\N	\N	SBM-OBC-NC-00004 SBC EM Non_Conformance_Perdida_trazabilidad_Proyecto_PCB.docx	210924132403_b5e36f85a7fbf1514f04afe03d8820ce.docx	52845	application/vnd.openxmlformats-officedocument.wordprocessingml.document	d0cd670b08ce55ca8fc6816a0f6bdc2fd5006057af3a015f0db16c62f322e605	0	1	2021-09-24 13:24:03.753228	\N	2021/09
4	448	Issue	NCR PM-OBC EM 3 Backplane EM Workmanship PCB design Problems 19-07-18 (1).doc	210924132804_0f9a9d58547b246780b3c4b50ea941db.doc	1808896	application/msword	43d81084e81b1eb944d8d6bc7aff00c4d919acb6a2213205e4337b524ca75a49	0	1	2021-09-24 13:28:04.031504		2021/09
5	448	Issue	RE  NRB NCs de PCB 20-4-21.msg	210924132804_4b7747efcc119223965f1dd7e168d7a0.msg	829440	application/vnd.ms-outlook	73d581533b3739e220edd1cb528f777b0083026911c5363134ff2c540b1ffb14	0	1	2021-09-24 13:28:04.496906		2021/09
6	447	Issue	RE  NRB NCs de PCB 20-4-21.msg	210924132804_4b7747efcc119223965f1dd7e168d7a0.msg	829440	application/vnd.ms-outlook	73d581533b3739e220edd1cb528f777b0083026911c5363134ff2c540b1ffb14	0	1	2021-09-24 13:29:30.983624		2021/09
8	446	Issue	LIE-10K-IT-00002-A_Informe Tecnico_SBC.pdf	210924133325_c9d4d5bab856e110c68437051b5fd1d7.pdf	1574190	application/pdf	43cf0cf04683a8d82c60f95d51cdb77f24fe95511f3e471596f529fa7b0a3305	0	1	2021-09-24 13:33:25.978846		2021/09
7	446	Issue	RE  NRB NCs de PCB 20-4-21.msg	210924132804_4b7747efcc119223965f1dd7e168d7a0.msg	829440	application/vnd.ms-outlook	73d581533b3739e220edd1cb528f777b0083026911c5363134ff2c540b1ffb14	0	1	2021-09-24 13:33:25.137701		2021/09
9	445	Issue	Picture1.jpg	210924133457_Picture1.jpg	214848	image/jpeg	f2340e34ad6252d5c83edfe49898b3e92909c97d4a320aa4458955c44d26e230	0	1	2021-09-24 13:34:57.408625		2021/09
10	445	Issue	RE  NRB NCs de PCB 20-4-21.msg	210924132804_4b7747efcc119223965f1dd7e168d7a0.msg	829440	application/vnd.ms-outlook	73d581533b3739e220edd1cb528f777b0083026911c5363134ff2c540b1ffb14	0	1	2021-09-24 13:34:57.93093		2021/09
12	444	Issue	1553.jpg	210924133736_1553.jpg	275754	image/jpeg	2ed813eb7a55abcaa0d4a5e795f8a8e5b45dbd69aae143884ac5caf5b6e008f9	0	1	2021-09-24 13:37:36.471606		2021/09
11	444	Issue	SBM-AHS-SP-00003-D (2).xlsm	210924133736_8988150046c5f760df8201a78ff4c494.xlsm	46586	application/vnd.ms-excel.sheet.macroEnabled.12	49600f6b4d1bf302199f959d9c2e97d8ca9fcd21ef4c266c01dcbfffbf1bdfd4	0	1	2021-09-24 13:37:36.014556		2021/09
13	444	Issue	SBM-AHS-SP-00007-B (3).xlsm	210924133736_ded1faae8c9e621ccc71e9f63f05d0cb.xlsm	38130	application/vnd.ms-excel.sheet.macroEnabled.12	c23f3468adb01d8f1d3692174e45ecec0f7dd2a6447345755ff308270919dd33	0	1	2021-09-24 13:37:36.54677		2021/09
14	444	Issue	SBM-AHS-SP-05007-A (4).xlsm	210924133736_b94dcf95deb7176863c735ed96f59298.xlsm	35791	application/vnd.ms-excel.sheet.macroEnabled.12	46cc97da01ea1f6a070196c2e7f0d3f5b6632a2f96ac9c918f02956251793c3c	0	1	2021-09-24 13:37:36.988369		2021/09
15	444	Issue	SBM-AHS-SP-05008-A (3).xlsm	210924133737_0d3cc81000cad5d1303e08e4fc898c3d.xlsm	35375	application/vnd.ms-excel.sheet.macroEnabled.12	f27e39eafb3454e214875c76312fc7931db64f72a2360acc18720682109b51b0	0	1	2021-09-24 13:37:37.037993		2021/09
16	444	Issue	SBM-AHS-SP-05008-A (4).xlsm	210924133737_0d3cc81000cad5d1303e08e4fc898c3d.xlsm	35375	application/vnd.ms-excel.sheet.macroEnabled.12	f27e39eafb3454e214875c76312fc7931db64f72a2360acc18720682109b51b0	0	1	2021-09-24 13:37:37.526634		2021/09
17	444	Issue	SBM-AHS-SP-05009-A (2).xlsm	210924133737_637ea289b5d3e41224ab654f49144102.xlsm	37102	application/vnd.ms-excel.sheet.macroEnabled.12	57efa62bb302b8e0d66bfb7e90f0770a0c3840edec82f45c0aff8e7f273fa926	0	1	2021-09-24 13:37:37.537731		2021/09
18	444	Issue	SBM-AHS-SP-05011-A (3).xlsm	210924133738_9cad40377d996e0367d9d86a57f00a40.xlsm	43564	application/vnd.ms-excel.sheet.macroEnabled.12	53ccd14fef2ec465fe39d89bf9f236ce1038e7f01d7edee173dc61dc10950f89	0	1	2021-09-24 13:37:38.054853		2021/09
19	443	Issue	RE  NRB NCs de PCB 20-4-21.msg	210924132804_4b7747efcc119223965f1dd7e168d7a0.msg	829440	application/vnd.ms-outlook	73d581533b3739e220edd1cb528f777b0083026911c5363134ff2c540b1ffb14	0	1	2021-09-24 13:40:01.024879		2021/09
20	441	Issue	SBM-VENG-OBC-PR-00039-B - Procedimiento de Reparación para IAB EM_r77.pdf	210924134147_af67c9fee01619e4e9b7574ffc9706f3.pdf	476653	application/pdf	e55982a183a221f22de326a55e80fb5bd9cbe991c33f549c7773047753fdd560	0	1	2021-09-24 13:41:47.276102		2021/09
21	441	Issue	RE  NRB NCs de PCB 20-4-21.msg	210924132804_4b7747efcc119223965f1dd7e168d7a0.msg	829440	application/vnd.ms-outlook	73d581533b3739e220edd1cb528f777b0083026911c5363134ff2c540b1ffb14	0	1	2021-09-24 13:41:47.481218	Memo Reporte de Estado de correcciones de PCB	2021/09
22	\N	\N	LIE-10K_NC 1791.pdf	210924134400_6f55942cf308380c982483d1b6dc9f41.pdf	417285	application/pdf	6f21bb3bfcd78e231b00bd679bba7d218417cdc7272209c8581d562a7c21db59	0	1	2021-09-24 13:44:00.885271	\N	2021/09
23	439	Issue	NC_1794.pdf	210924134532_NC_1794.pdf	215565	application/pdf	e04715f6f94b8b80f321d479dd6ae69922c7eccc37c9ad023fb4cc57dbd03ede	0	1	2021-09-24 13:45:32.769672		2021/09
24	439	Issue	RE  NRB NCs de PCB 20-4-21.msg	210924132804_4b7747efcc119223965f1dd7e168d7a0.msg	829440	application/vnd.ms-outlook	73d581533b3739e220edd1cb528f777b0083026911c5363134ff2c540b1ffb14	0	1	2021-09-24 13:45:33.243824		2021/09
25	438	Issue	AC6 Manual VPUMP.jpg	210924135042_30c8b6338e187108f0016e161f7aca61.jpg	161001	image/jpeg	b7924262a31396a2db4df2263462a8d49440455495c9e6227693a19d4c039793	0	1	2021-09-24 13:50:42.295619		2021/09
26	438	Issue	AC6 SBM-OBC-PR-00008-A-Procedimiento_de_programación_FPGA_SBC_EM.xlsx	210924135042_2207e5393cc398026f1d0609a440a789.xlsx	731752	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	8bb00b07c9b9997027dd4568303770e326a1c443cc87ecab6172ad59af6df2fe	0	1	2021-09-24 13:50:42.877001		2021/09
41	428	Issue	SBM-OBC-NC-00026 Listado_Seguimiento_No_Conformidad_Desconexion_GRMON_Ensayo_Flash_completo20201022.xlsx	210924135310_728edda539d901aa119b1de2a70a015d.xlsx	14027	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	0ac6d0b2d94fc1ebd9ca111e24ad11e988b447058441a78f024293579f0c2769	0	1	2021-09-24 13:53:10.244695		2021/09
52	426	Issue	NC_1799.pdf	210924140452_NC_1799.pdf	185981	application/pdf	b2b561a742b1d448304ba9cdf30cdb8ae4ff8414051225a72780b807dada8121	0	1	2021-09-24 14:04:52.664975		2021/09
28	438	Issue	AC7 Manual JTAG.jpg	210924135045_e299ab9f54b35994846e81c8067fe829.jpg	757407	image/jpeg	f6a2731f50eef2b18a8cc918d7483c3299de30d2228ace0c8b83748e587730f3	0	1	2021-09-24 13:50:45.876076		2021/09
27	438	Issue	AC7 P1040834.jpg	210924135045_58aeb057ca7e08b2491caf86081ac279.jpg	576147	image/jpeg	d194553b1f1bb96ed16fd52602ee4211caa3853d9ca860837a6fe8ecf2ae66f7	0	1	2021-09-24 13:50:45.826374		2021/09
30	438	Issue	AC7 SBM-OBC-PR-00008-A-Procedimiento_de_programación_FPGA_SBC_EM.xlsx	210924135042_2207e5393cc398026f1d0609a440a789.xlsx	731752	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	8bb00b07c9b9997027dd4568303770e326a1c443cc87ecab6172ad59af6df2fe	0	1	2021-09-24 13:50:47.867833		2021/09
29	438	Issue	DSU_EN.jpg	210924135047_DSU_EN.jpg	197111	image/jpeg	c1a5726d867396546e5399f00202853ddff82084e2bcdced52e881c0dec8f575	0	1	2021-09-24 13:50:47.167727		2021/09
31	438	Issue	LIE-10K_NC 1803.pdf	210924135049_afe3986e06740ac8a8c58cefa00869c7.pdf	731518	application/pdf	03443dbc54676df02d1619502cf2db71d5225e785c1931ce82e11670c8d723e6	0	1	2021-09-24 13:50:49.000628		2021/09
33	438	Issue	Modificacion Interface JTAG FPGA a TODOS los PCBs.jpg	210924135052_a3f1b439967ee0dedee5f901572adf32.jpg	310532	image/jpeg	4e3681d7da19e49b904a2b4444e1bc605e9492211ccd102c94d4a6ad0f1a278d	0	1	2021-09-24 13:50:52.200134		2021/09
32	438	Issue	NC GRMON.png	210924135051_7a1e578ec1375c66dfb64063fd6bf96b.png	1561718	image/png	0118e17b707c530682f57383a5cd61624920752b3d2875c179f5541b429cfe96	0	1	2021-09-24 13:50:51.525436		2021/09
34	438	Issue	NC JTAG 2.jpg	210924135052_18db75172023df9bd804a6fa72225d62.jpg	864743	image/jpeg	30f28e0e211ee7383e1ff3f8a295c5ceabf98537161ce2c5b774c9b1f6d69ac8	0	1	2021-09-24 13:50:52.941645		2021/09
53	426	Issue	NC_1799-1.pdf	210924140452_NC_1799.pdf	185981	application/pdf	b2b561a742b1d448304ba9cdf30cdb8ae4ff8414051225a72780b807dada8121	0	1	2021-09-24 14:04:52.673339		2021/09
57	426	Issue	SBM-VNG-OBC-DS-00005-A-Soporte_Mecánico_PCBs_rev64.pdf	210924140502_acf5a67c6c87f3794e1cc6c2441ff630.pdf	2969887	application/pdf	d5be14998d0ebe70824577ae5a2270ca3fd720d95eb7eaafe9e67997aa4ba9ef	0	1	2021-09-24 14:05:02.417574		2021/09
54	426	Issue	trans.png	210924140454_trans.png	1047680	image/png	35855471f7ac5d08435916ddabe4478c729dd2d5824ea00d0eaf28f146d7de92	0	1	2021-09-24 14:04:54.143912		2021/09
55	426	Issue	VIS-GRAL.jpg	210924140455_VIS-GRAL.jpg	606315	image/jpeg	05edf4a8edee510dc24cc1029ca41272014cc9836862453b3d862cbc569ccbcc	0	1	2021-09-24 14:04:55.401872		2021/09
56	426	Issue	VIS-SUP.jpg	210924140456_VIS-SUP.jpg	886023	image/jpeg	63cfccaf8943ce68766dc0e2ab3032b788e411ae4d990358bb0a85169ca73501	0	1	2021-09-24 14:04:56.601811		2021/09
220	378	Issue	IMG_20210407_161704651.jpg	210927180828_IMG_20210407_161704651.jpg	788874	image/jpeg	56fa515be1d44bc90713eab9cef91b85ee4cdd04f345e427aa2d4b17bed96462	0	1	2021-09-27 18:08:28.831577	AVAB	2021/09
35	438	Issue	NC JTAG 3.jpg	210924135202_83b29fe0d952dc47c70ed1108c6bc6d8.jpg	271930	image/jpeg	fdc1712c71557b112984f7cc678f22973d9bc533897c3f765e031a19e22b68b1	0	1	2021-09-24 13:52:02.464603		2021/09
36	438	Issue	NC JTAG 4.jpg	210924135203_4b8953ed06a04d84d012f669fd617b81.jpg	1018134	image/jpeg	3b44bd036233e4fe51de55d47b1da49149e52686fcf3db7626a6b74c4c8c7434	0	1	2021-09-24 13:52:03.130632		2021/09
37	438	Issue	NC JTAG.jpg	210924135203_a7bb992517f9b395e02fdda1a8287536.jpg	1208922	image/jpeg	e95af1e1745633b4bef2183c3535fd5f2fc7861b54a4254e90eb13fbeb10fc43	0	1	2021-09-24 13:52:03.530434		2021/09
38	438	Issue	RE  NRB NCs de PCB 20-4-21.msg	210924132804_4b7747efcc119223965f1dd7e168d7a0.msg	829440	application/vnd.ms-outlook	73d581533b3739e220edd1cb528f777b0083026911c5363134ff2c540b1ffb14	0	1	2021-09-24 13:52:05.188357	Memo Reporte de Estado de correcciones de PCB	2021/09
40	438	Issue	reset circuit NC.jpg	210924135207_4dd86d23a954e4d3f620d4d62711e138.jpg	1598753	image/jpeg	84911b308a52deb2188eeb84a91e3d2ded01268d3659f3a2efed6e382efaa072	0	1	2021-09-24 13:52:07.247157		2021/09
39	438	Issue	Retrabajo Switch SBC EM.pdf	210924135205_aa87e5bd45061687baf68be3d9102b27.pdf	188250	application/pdf	e687d001b13a9c632eefb3b68e3f94dc574be95eca303713c68517cdee0adc7c	0	1	2021-09-24 13:52:05.946639		2021/09
58	425	Issue	NC_1800.pdf	210924140658_NC_1800.pdf	195982	application/pdf	cf7b16321f5ce5fd686482e9d6455a4fd840fcdbf556d2de0c923255f713b41f	0	1	2021-09-24 14:06:58.241249		2021/09
59	425	Issue	pin.png	210924140659_pin.png	1262848	image/png	3e742e4ffe53eb4f3be801663fd9d0db1cdf53741f11f1ee2f82cc7ac3a19621	0	1	2021-09-24 14:06:59.190424		2021/09
42	427	Issue	image001.jpg	210924135504_image001.jpg	394288	image/jpeg	3ae87f83460d20d68b4322ed2c8cbdd7b7e3f6ad768f3a8a7523f319ef7fda31	0	1	2021-09-24 13:55:04.733989		2021/09
43	427	Issue	image002.jpg	210924135504_image002.jpg	719019	image/jpeg	c89052e9fa5036bc9c276464f6eeb00b85b852b8cd6cc251ae8a69706afe58af	0	1	2021-09-24 13:55:04.791322		2021/09
44	427	Issue	image003.jpg	210924135505_image003.jpg	471165	image/jpeg	47d9151a2cddb7946ee575fca95768e8a777f826761c8e7bc9ea7623e1608beb	0	1	2021-09-24 13:55:05.483412		2021/09
48	427	Issue	image004.jpg	210924135510_image004.jpg	1236585	image/jpeg	2cf6730eaebc949001da8ba5597b37b5d5be5ae1b9a144dabbc5691a7a69e538	0	1	2021-09-24 13:55:10.70117		2021/09
45	427	Issue	image005.jpg	210924135506_image005.jpg	696977	image/jpeg	a44b03dd032f6924dd5824835f82f20316cab61f5132e1d9c4f2e93566fbea5c	0	1	2021-09-24 13:55:06.532813		2021/09
46	427	Issue	image006.jpg	210924135509_image006.jpg	2973683	image/jpeg	9c487fbd1ec1efa846dd9d3ce43abd2962822fc9b8a971162d207354ac58be4a	0	1	2021-09-24 13:55:09.125038		2021/09
47	427	Issue	image007.jpg	210924135510_image007.jpg	744946	image/jpeg	cb2032171a9addb5ecd8fb0e6515cf020b5b917b1a9d952bff7721e3d74f0bf3	0	1	2021-09-24 13:55:10.133244		2021/09
49	427	Issue	image008.jpg	210924135510_image008.jpg	556080	image/jpeg	34a41aabf629e996544c98756d206f55d6ce9b9c4682daf44b480ca8d5d48d37	0	1	2021-09-24 13:55:10.915436		2021/09
50	427	Issue	SABIAMAR_Template_Reporte_NCR.docx	210924135511_SABIAMAR_Template_Reporte_NCR.docx	108783	application/vnd.openxmlformats-officedocument.wordprocessingml.document	c81161d589fbf2f6077a189f31f127650d94edd1e77661f384d379ac58f3000a	0	1	2021-09-24 13:55:11.699379		2021/09
60	424	Issue	20190626 0965E&M0011 Mail Federico Larco Actualización Status.pdf	210924140852_4e28bb462009beacb3b173a6d18f04cd.pdf	77499	application/pdf	9e5e88bb47cb8c9b24e1e3f7ae5a24b97cd719a850460f52ead1ef23e6d3f325	0	1	2021-09-24 14:08:52.297628		2021/09
62	424	Issue	20190627 Envío de Probetas_1.jpg	210924140853_a9255aba07a5c7e5f4555dfb7243aadc.jpg	1384607	image/jpeg	f90bf9051bafafedd69c3c8fc6e6a522244b166563a8b7d277ac749dec5bc22c	0	1	2021-09-24 14:08:53.521635		2021/09
61	424	Issue	ME-TRIB-2019-001 NC probetas NCr (1).doc	210924140853_638c4bdaee9b571215dd62e0bf7882c2.doc	79360	application/msword	6fedf80290681ff9e99b4b2ccd8c15cc884cc8280048ec9b5bcc0b1d10dd2fb8	0	1	2021-09-24 14:08:53.046692		2021/09
63	424	Issue	NC Coatings - Photos.pdf	210924140901_7cfb046873a093dbe6cde761bde67c14.pdf	3299582	application/pdf	7eb9d4fbfeab3feabf23e92e096e4842b9e4de70ac13679f5356c62ce20c7d2f	0	1	2021-09-24 14:09:01.878358		2021/09
213	454	Issue	SBM-OBC-NC-00004 SBC EM Non_Conformance_Perdida_trazabilidad_Proyecto_PCB.docx	210924161137_b5e36f85a7fbf1514f04afe03d8820ce.docx	52845	application/vnd.openxmlformats-officedocument.wordprocessingml.document	d0cd670b08ce55ca8fc6816a0f6bdc2fd5006057af3a015f0db16c62f322e605	0	1	2021-09-24 16:11:37.666705		2021/09
68	423	Issue	0- INCIDENTE TAM canal R abierto.pdf	210924141801_e3f02def03dec2cf8afa26d8ba44142f.pdf	102455	application/pdf	b166ae04a8ea216c0d4ff612d58671b9c49808bffceff06c6cc6597e4a98b303	0	1	2021-09-24 14:18:01.507186		2021/09
214	454	Issue	SBM-OBC-NC-00004 SBC_EM_Listado_Seguimiento_No_Conformidad_Perdida_trazabilidad_Proyecto_PCB.xlsx	210924161137_f2cb456a567b7c85fa8a490fb2c588b1.xlsx	14964	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	9fa4208bd22aa2f4e8e4d39556a5ca94082f7afa6e8656176f9329a2d93f106c	0	1	2021-09-24 16:11:37.70063		2021/09
75	418	Issue	NCR 0965CT0001.pdf	210924142113_ac9e68740d5ad20af995bd5bb8e7cb2d.pdf	809106	application/pdf	ca027a28a73c9b73f3fd1f3bb55aa5ab9112ca154c3cfdc0d6c24c282080ae36	0	1	2021-09-24 14:21:13.166693		2021/09
216	440	Issue	LIE-10K_NC 1791.pdf	210924134400_6f55942cf308380c982483d1b6dc9f41.pdf	417285	application/pdf	6f21bb3bfcd78e231b00bd679bba7d218417cdc7272209c8581d562a7c21db59	0	1	2021-09-24 16:18:30.266646		2021/09
221	378	Issue	IMG_20210407_161710250.jpg	210927180829_IMG_20210407_161710250.jpg	795330	image/jpeg	81e4fd8df67bab431652198d342608213f2280f995392682c5257a4a556143db	0	1	2021-09-27 18:08:29.2032	AVAB	2021/09
109	378	Issue	IMG_20210407_151330506.jpg	210924145558_IMG_20210407_151330506.jpg	598176	image/jpeg	2308bd2dc6ded7c36c6bea66ec3100577e7886eecf977ef6e631ee1ea57876fe	0	1	2021-09-24 14:55:58.928481	GPIO pines conectores d-sub	2021/09
110	378	Issue	IMG_20210407_151352936.jpg	210924145558_IMG_20210407_151352936.jpg	641911	image/jpeg	c963ffb202198a7db6a4faeef4b671a889222c1dbae7010b68a1a93673350373	0	1	2021-09-24 14:55:58.941451	GPIO pines conectores d-sub	2021/09
112	378	Issue	IMG_20210407_151335048.jpg	210924145602_IMG_20210407_151335048.jpg	782725	image/jpeg	63be2c35ed987b96b8a0dea8e68fb8f36060ffb7cef2e059bc70a9ff32bec9ea	0	1	2021-09-24 14:56:02.469082	GPIO pines conectores d-sub	2021/09
111	378	Issue	IMG_20210408_155305270.jpg	210924145602_IMG_20210408_155305270.jpg	846299	image/jpeg	adb0ec5e7b5a1caa21d728f172cf3ef9b1ad7fe14400b484c142c222ff778222	0	1	2021-09-24 14:56:02.352627	GPIO pines conectores d-sub	2021/09
114	378	Issue	IMG_20210408_155312605.jpg	210924145607_IMG_20210408_155312605.jpg	941524	image/jpeg	d367276c76f6388467221fdfcf866d57c0bc686c8ddadef35a4be9558617bf53	0	1	2021-09-24 14:56:07.976523	GPIO pines conectores d-sub	2021/09
113	378	Issue	IMG_20210408_155322289.jpg	210924145607_IMG_20210408_155322289.jpg	755908	image/jpeg	9ca370ceb4e9e7fbfb77b2a8aa305634855c774fb48db82a56a45c74b82c7eba	0	1	2021-09-24 14:56:07.28727	GPIO pines conectores d-sub	2021/09
115	378	Issue	IMG_20210408_155444656.jpg	210924145609_IMG_20210408_155444656.jpg	893126	image/jpeg	09134c0f40972e913455abfa6f16664d3e48ffd191094189c0781264f3cd8d96	0	1	2021-09-24 14:56:09.642997	GPIO pines conectores d-sub	2021/09
116	378	Issue	IMG_20210408_155427143_HDR.jpg	210924145610_IMG_20210408_155427143_HDR.jpg	962904	image/jpeg	8fcb15c3391f6079089435ec72d3ed4b6c6cd0afa8a3a8860d0f04f3085262d4	0	1	2021-09-24 14:56:10.509563	GPIO pines conectores d-sub	2021/09
117	378	Issue	IMG_20210407_151410119_HDR.jpg	210924145610_IMG_20210407_151410119_HDR.jpg	578014	image/jpeg	3d6800ec76fe3dfb5ee0410c93d3947368e27efe8cb2dc05e87405302d1f6a20	0	1	2021-09-24 14:56:10.876187	GPIO pines conectores d-sub	2021/09
118	378	Issue	IMG_20210407_151355810.jpg	210924145612_IMG_20210407_151355810.jpg	596609	image/jpeg	3accc7cac5d52428fa81ed6ee3e78d62ad937a4d0b9304864c27f95393ab3731	0	1	2021-09-24 14:56:12.143022	GPIO pines conectores d-sub	2021/09
222	378	Issue	IMG_20210407_161730452.jpg	210927180831_IMG_20210407_161730452.jpg	814288	image/jpeg	e2edfc63b0078e3061eb4161f8c7036d56b7886f456077cc78e23b550977610a	0	1	2021-09-27 18:08:31.020287	AVAB	2021/09
119	378	Issue	IMG_20210408_155453379.jpg	210924145752_IMG_20210408_155453379.jpg	934576	image/jpeg	f1a474347036e18f615588bf426f494fc9ac4adc621a739417f4fa786c1e30a5	0	1	2021-09-24 14:57:52.35232	GPIO pines conectores d-sub	2021/09
120	378	Issue	IMG_20210408_155510334.jpg	210924145752_IMG_20210408_155510334.jpg	1052970	image/jpeg	861cd0944ad47c94fd704d5f81cd93ba52df39cf2aa9853242f72c174ccf26d2	0	1	2021-09-24 14:57:52.609533	GPIO pines conectores d-sub	2021/09
121	378	Issue	IMG_20210408_155514864.jpg	210924145753_IMG_20210408_155514864.jpg	1229320	image/jpeg	2008c85a6ce6965e675ddd3aec30e6747b3399f3502683e4115dbf18041e3010	0	1	2021-09-24 14:57:53.680104	GPIO pines conectores d-sub	2021/09
122	378	Issue	IMG_20210408_155523900.jpg	210924145753_IMG_20210408_155523900.jpg	869970	image/jpeg	3db8ac8b243ff66a1b47e990c231530f45c861069c3b51a0fecd5bf38a2b2d60	0	1	2021-09-24 14:57:53.699931	GPIO pines conectores d-sub	2021/09
123	378	Issue	IMG_20210408_155532304.jpg	210924145755_IMG_20210408_155532304.jpg	907258	image/jpeg	d7da7f9b6903156da013ec283df0fb9d3e09a662d6488d5473b98d0bfdb4150e	0	1	2021-09-24 14:57:55.96748	GPIO pines conectores d-sub	2021/09
127	378	Issue	IMG_20210408_155537953.jpg	210924145804_IMG_20210408_155537953.jpg	847005	image/jpeg	2366b6428db9156856c6264b2f942d7c84bcd810fcb69c09f7506b285538c8a3	0	1	2021-09-24 14:58:04.315814	GPIO pines conectores d-sub	2021/09
128	378	Issue	IMG_20210408_155613537.jpg	210924145805_IMG_20210408_155613537.jpg	842181	image/jpeg	e8b07d1a6a1146c19646053bec9a65ab7a33ba085aa9195d857a04881c8f0bf9	0	1	2021-09-24 14:58:05.482693	GPIO pines conectores d-sub	2021/09
226	378	Issue	IMG_20210408_122855052.jpg	210927180833_IMG_20210408_122855052.jpg	1078328	image/jpeg	e5bf22881fdc038fe5c843d6f00574399a3ab2921c4003deb9a94ca7a3b85ce9	0	1	2021-09-27 18:08:33.940151	AVAB	2021/09
129	378	Issue	SBM-OBC-NC-00053 Pines de conectores d-SUB no pasan al lado Bottom (1).docx	210924145914_0b1f44af087e34d376615292d0649773.docx	440114	application/vnd.openxmlformats-officedocument.wordprocessingml.document	0aa552f7c4e6daac3b265590404575f8a32085f0173d914074c96815c36684e5	0	1	2021-09-24 14:59:14.455965		2021/09
215	411	Issue	SBM-OBC-NC-00028 diodo caliente SBC.docx	210924161542_9acb2797565c19292a7c0750d6c4ed5b.docx	63088	application/vnd.openxmlformats-officedocument.wordprocessingml.document	a9890864c48df4f8905116ed36ce2f7b4e2cf76405b4f27339a72c9f63c4f9fe	0	1	2021-09-24 16:15:42.193403		2021/09
227	378	Issue	IMG_20210408_122857764.jpg	210927180835_IMG_20210408_122857764.jpg	1096211	image/jpeg	04d5f06d7343a24819e3e45f501d3f3c9d684fcb92b155ea8fb544ad89e55beb	0	1	2021-09-27 18:08:35.128942	AVAB	2021/09
228	378	Issue	IMG_20210408_122931872_BURST000_COVER.jpg	210927180836_IMG_20210408_122931872_BURST000_COVER.jpg	1392325	image/jpeg	651befaf4caf193ce7a29fcef684aeab4057d60bb6069bdda605601133a270cb	0	1	2021-09-27 18:08:36.570571	AVAB	2021/09
241	\N	\N	conae_logo.png	210929195939_conae_logo.png	8612	image/png	9dff11a23e9a7306bd05e5410dc3570dec18dc4efe160168374e019665a5d07c	0	1	2021-09-29 19:59:39.840327	\N	2021/09
244	\N	\N	L1.csv	211209190039_L1.csv	252	application/vnd.ms-excel	230d0e59c10d05b46a6a9e8bbcb9b7f60ccedbe402cb5aed57cde423a3ab112b	0	1	2021-12-09 19:00:39.456838	\N	2021/12
250	\N	\N	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	211213123928_7668578567693358306b914f3e454b8d.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-13 12:39:28.706735	\N	2021/12
69	423	Issue	4- Mail.pdf	210924141801_bb7589cfdeeffdf61361ebc813284c2a.pdf	107434	application/pdf	05c6e509995a62ffcaea42226445abb389bd80dd546abbe8287a14b4dcc83616	0	1	2021-09-24 14:18:01.516224		2021/09
71	423	Issue	5- TAM 002 Rx.pdf	210924141802_b4f207ee77993b6506a4971a9357264d.pdf	583415	application/pdf	2e55c6ea88c6afa06e718c8baf6cb38a8861a3b3c185860f6622bae45479e8d1	0	1	2021-09-24 14:18:02.555404		2021/09
70	423	Issue	6- TAM 003 Rx.pdf	210924141802_04d040d2796df10b4f7e78dcd7cb5154.pdf	301451	application/pdf	04899774266147ed75ce99e751153a79cdf4ab06e0ddbdaf1f91aa5ca538e499	0	1	2021-09-24 14:18:02.363836		2021/09
72	423	Issue	7- Mail.pdf	210924141802_c8080e5aac2139f14349717709a7ad99.pdf	106779	application/pdf	13f45b23d1d9d4b5569c840ac05915d4f13eed74a7505ade244406af421da6b0	0	1	2021-09-24 14:18:02.881442		2021/09
73	423	Issue	8- NC0965SIE0424.pdf	210924141803_63503cf02863fe2228fafdf7b4dfc7ab.pdf	30839	application/pdf	696c2928849a42c3cf005beca9f83fe6ca112787063cfbb5cec73fa6dc716e93	0	1	2021-09-24 14:18:03.097071		2021/09
74	423	Issue	8- NC0965SIE0424.pdf	210924141803_63503cf02863fe2228fafdf7b4dfc7ab.pdf	30839	application/pdf	696c2928849a42c3cf005beca9f83fe6ca112787063cfbb5cec73fa6dc716e93	0	1	2021-09-24 14:19:02.297515		2021/09
77	415	Issue	S3316-19_Sabia-Mar_Retention test_NCR.pdf	210924142213_e3c95ed8416df48de9e8f1b0f9bb858a.pdf	466683	application/pdf	3c565a1f0766e3345e2476e8f498cf97b8da8f2ee1dd24be1105367a8f32ad6a	0	1	2021-09-24 14:22:13.831436		2021/09
76	415	Issue	S3316a19_Sabia-Mar_Retention test_NCR - for CONAE sign.pdf	210924142213_7b04e0e614fefb43124b990f4c9b5973.pdf	254610	application/pdf	dd42fc204b818fc327ff209969c92f1d8cb71ce51e11584a574aae0020ec3b64	0	1	2021-09-24 14:22:13.624491		2021/09
78	413	Issue	SBM-OBC-NC-00032 Faltante de componentes para poblado de placa COMM EM.docx	210924142315_64c098f607d4a11fbde1faf9b44391c1.docx	63730	application/vnd.openxmlformats-officedocument.wordprocessingml.document	d8e3386011f128e77c0f80e169ac228ab50de36a7a1dd4d3e7d0d436f7871def	0	1	2021-09-24 14:23:15.438858		2021/09
79	412	Issue	SBM-OBC-NC-00033 Faltante de componentes para poblado de placa PWR EM.docx	210924142418_4b97e5ac09adef4af37a5142a4d62ea7.docx	61562	application/vnd.openxmlformats-officedocument.wordprocessingml.document	c7dba85176f210b6f1e49de392989f4039e194a1eba6deb869a476c257a486b7	0	1	2021-09-24 14:24:18.928028		2021/09
80	410	Issue	ncr SAB-5340.pdf	210924142524_12ad241f311194047e72290fadbd7d34.pdf	213809	application/pdf	9d6a31827a45e47689997d2cf800bb7bf35b11181c3340aed0de1857bfe5dd67	0	1	2021-09-24 14:25:24.384167		2021/09
81	409	Issue	ncr SAB-5339.pdf	210924142659_3ca91ae97c00acbb78c06b5e8466de21.pdf	157569	application/pdf	c8217f090f88a4bc10c15241aa8711850463ebe4c584b85a4c339a599654a65a	0	1	2021-09-24 14:26:59.421053		2021/09
82	409	Issue	Re  Reunion semanal de aseguramiento con GS.msg	210924142659_63e2658ff1612a7990d0d6d56c4c10c2.msg	225280	application/vnd.ms-outlook	2b567ddc29cbb99baf357cb16b22ada41b9f4b40b6c20704ed2c50775055111e	0	1	2021-09-24 14:26:59.643383		2021/09
83	398	Issue	SBM-OBC-NC-00037 No cumplimiento de standars de workmanship, Pin de componente no sobrepasa PCB lado Bottom placa COMM EM.docx	210924142830_ecb6bc8d5ab97b02112b1fef98142db5.docx	1396443	application/vnd.openxmlformats-officedocument.wordprocessingml.document	4c74badb08967bf10fb2d16f31b2e6f405ebc5467eed373fb570431acc6074f3	0	1	2021-09-24 14:28:30.637218		2021/09
84	398	Issue	SBM-OBC-NC-00037 No cumplimiento de standars.docx	210924142832_1e41eee2ddde432ae381a211a3b96327.docx	1857904	application/vnd.openxmlformats-officedocument.wordprocessingml.document	5dceef93b5dba8ce56ed63d79e2e45338a90598812ee63b0d60a9896fc288d62	0	1	2021-09-24 14:28:32.24492		2021/09
85	393	Issue	SBM-OBC-NC-00042 Footprint en PCB de tamaño diferente respecto al componente.docx	210924143033_d1f3c9c5c102d20a568f24be0ddfd5ea.docx	187594	application/vnd.openxmlformats-officedocument.wordprocessingml.document	ddd0651f4ee9b7548f330f3f1a60a28df58e3dc5e93a456265b432101b811016	0	1	2021-09-24 14:30:33.492831		2021/09
86	384	Issue	Consultas_INVAP_20210422.docx	210924143326_Consultas_INVAP_20210422.docx	24762	application/vnd.openxmlformats-officedocument.wordprocessingml.document	ad52e2b9ef9fccf558d7cac32d279ff74b4eff486215d6c72ef3ef38e91fb333	0	1	2021-09-24 14:33:26.366103		2021/09
87	384	Issue	RE  SBM-OBC-NC-00031 - NRB#2.msg	210924143326_6a79ca99d6b9b537fe5d7adecf7de583.msg	113152	application/vnd.ms-outlook	635b7d53562e4b17f4c8214034f0eafecdc798f1cac8931a6316a112a635d281	0	1	2021-09-24 14:33:26.797572		2021/09
91	384	Issue	SBM-OBC-NC-00031 -  Datapackage.rar	210924143342_a5deb8cb588f858cb488726c7260ec54.rar	4047182	application/x-rar-compressed	0c353253c006a0bdaabbb051ed24d4455abdc2689005e38daec6368ebada94b4	0	1	2021-09-24 14:33:42.77126		2021/09
92	381	Issue	NCR PM-OBC EM 2 Backplane EM Wormanship documentation and process Problems 19-07-18 (1).doc	210924143718_449e7721981612fee5da307ef67e0651.doc	2199552	application/msword	7c6cf7dbb9571dfe1ca8bd7f67f12420391b58e97405cf1a9e0b00e11ea2337e	0	1	2021-09-24 14:37:18.718726		2021/09
94	380	Issue	RE  Therm-a-gap NRB NC SBM-OBC-NC-00066.msg	210924143906_8fb49ca604f834fa0398ff7fff37f5ad.msg	67584	application/vnd.ms-outlook	3a20c0011a3399a89aaf33f5874dd6b17c216997bd01e9ee1e3fa2632ffbfb29	0	1	2021-09-24 14:39:06.551218		2021/09
97	379	Issue	SBM-OBC-NC-00052 Platina de alineación para conectores DB con agujeros pequeños AVAB y GPIO.docx	210924144124_902b4e86065f3176ea9f12646d1caec1.docx	710443	application/vnd.openxmlformats-officedocument.wordprocessingml.document	4bf6fa1761f6d2bcde2e9f15832d5f4bceafa8f9e6ff56a16bf7c76094830554	0	1	2021-09-24 14:41:24.537843		2021/09
88	384	Issue	SBM-OBC-NC-00031 Falla en la ejecución de SW Aplicativo cargado por el Bootloader (ensayo de desempeño SBC EM).pdf	210924143327_d022bad8cf64cb5768b33901dd1c6a70.pdf	142684	application/pdf	e197dd41928a0fbb01f75247536bf9e63af5aff22ae974c1fe7abbae70e975ff	0	1	2021-09-24 14:33:27.539566		2021/09
90	384	Issue	SWs.zip	210924143332_SWs.zip	4594921	application/x-zip-compressed	39d932c3035f9e4d4d854bac34dad9742b2bfc181a10c7e001ff8b108f01ac10	0	1	2021-09-24 14:33:32.604688		2021/09
93	380	Issue	RE  Therm-a-gap NRB NC SBM-OBC-NC-00066.msg	210924143906_6123b253a2b6f7edfe55be49d5565260.msg	44032	application/vnd.ms-outlook	5c01cf2fa92880f11e0c84476f509fc3d3ae60f2916415866104a59f41a66924	0	1	2021-09-24 14:39:06.54331		2021/09
217	384	Issue	SBM-OBC-RP-00090-A FALLA DE CARGA DE APLICATIVO EN MODO NOMINAL - SBC.pdf	210927162041_f3ddfe38b7dfbab142d26b0cd809b983.pdf	1533511	application/pdf	ba4d28ff0eee261e9b78326bf5e7d3846c6e476fa3ad486b83d977848e5fde1f	0	1	2021-09-27 16:20:41.784607		2021/09
96	380	Issue	SBM-OBC-NC-00066 Falta de información para colocación de Therm-a-gap y componentes en altura .docx	210924144012_e5f4918d40b20b3046c7406207518056.docx	61111	application/vnd.openxmlformats-officedocument.wordprocessingml.document	7d9972f8812950613edba86b9b9f4cd187a4380c41375cfe170d0a70e7e5743c	0	1	2021-09-24 14:40:12.815977		2021/09
229	\N	\N	SB-020100-RQ-00100-C SABIAMAR L2B ENVIROMENTAL REQUIREMENT DOCUMENT.pdf	210929181210_b72dacf8beb059fe0f18bfc9857487b9.pdf	458752	application/pdf	5ea879d3cb543f16df220ffc5ce93997f0bb11d28602e33e326b4811b45c7d25	0	1	2021-09-29 18:12:10.693801	\N	2021/09
98	378	Issue	SBM-OBC-NC-00053 Pines de conectores d-SUB no pasan al lado Bottom.docx	210924145140_4fed7b1382b0549f523ee36f361ba845.docx	439109	application/vnd.openxmlformats-officedocument.wordprocessingml.document	772fdb029cd79ce367e17ce3128d482f7e8fd577ffd9f2aacfd119a2f98d9db5	0	1	2021-09-24 14:51:40.506515		2021/09
124	378	Issue	IMG_20210408_155540137.jpg	210924145800_IMG_20210408_155540137.jpg	906504	image/jpeg	f3b3b2ae5503d2a5fede78337398eec2c2bef050d0f85062914768934e3cc857	0	1	2021-09-24 14:58:00.51714	GPIO pines conectores d-sub	2021/09
125	378	Issue	IMG_20210408_155546917.jpg	210924145802_IMG_20210408_155546917.jpg	904136	image/jpeg	3e95f21020409a2bca78c59c0c212cba5ae6a1602860039af287f4e9902fe627	0	1	2021-09-24 14:58:02.853826	GPIO pines conectores d-sub	2021/09
126	378	Issue	IMG_20210408_155601586.jpg	210924145804_IMG_20210408_155601586.jpg	831769	image/jpeg	465ff8f25b03fb011a6fc80714b86bfbcbc4c641c5c3eea624f726e108f60c8a	0	1	2021-09-24 14:58:04.282991	GPIO pines conectores d-sub	2021/09
130	378	Issue	IMG_20210408_155607850.jpg	210924145914_IMG_20210408_155607850.jpg	903850	image/jpeg	dc11e994957601e194da38a0dd1592524338639e0f992c65dddbdbbffbccd735	0	1	2021-09-24 14:59:14.73803	GPIO pines conectores d-sub	2021/09
132	378	Issue	IMG_20210408_155629923.jpg	210924145916_IMG_20210408_155629923.jpg	1011279	image/jpeg	e811c4fa1cb1c6ce7cbda2b6668e2433ea48ae0a9213764797196d193e1a1c94	0	1	2021-09-24 14:59:16.320733	GPIO pines conectores d-sub	2021/09
131	378	Issue	IMG_20210408_155633372.jpg	210924145916_IMG_20210408_155633372.jpg	1029826	image/jpeg	9f31404a43b5373fa849feafb0e7cebe317668079ca5a9c5eec925d92717fc8b	0	1	2021-09-24 14:59:16.246449	GPIO pines conectores d-sub	2021/09
133	378	Issue	IMG_20210408_155640694.jpg	210924145917_IMG_20210408_155640694.jpg	1025319	image/jpeg	a61f02cc795f7cf67dfdf505b9b6ee74ff75ab26f44f4b95c258349c10a35db8	0	1	2021-09-24 14:59:17.296765	GPIO pines conectores d-sub	2021/09
135	378	Issue	IMG_20210408_155700381.jpg	210924145919_IMG_20210408_155700381.jpg	1075656	image/jpeg	b8156591da187a9f3871b4629b496204586bb498d72ae711b2d669e991ad4870	0	1	2021-09-24 14:59:19.953833	GPIO pines conectores d-sub	2021/09
134	378	Issue	IMG_20210408_155642866.jpg	210924145918_IMG_20210408_155642866.jpg	1089145	image/jpeg	d4c4f5dc6205abe7ba3d6684cba1cae414bdf10543f4159361af06bf80223b06	0	1	2021-09-24 14:59:18.362506	GPIO pines conectores d-sub	2021/09
242	\N	\N	SB1-G-SUM-D-D01-025_v1.1_ManualdeUsuarioX-BandDownloader-v1.1.pdf	211202133307_1f9328b324b5f24618de7a998a491e04.pdf	1037463	application/pdf	28861ae84e5be1cabd3762b7502d25ac81334be8b57c7ffcbd4aad06f55b64c6	0	1	2021-12-02 13:33:07.89583	\N	2021/12
99	378	Issue	IMG_20210407_150704309.jpg	210924145404_IMG_20210407_150704309.jpg	901773	image/jpeg	96457136f9ee02a792c8dcaedc56acad05ba557f2f8d0438d51ff31efb604531	0	1	2021-09-24 14:54:04.763428	GPIO pines conectores d-sub	2021/09
100	378	Issue	IMG_20210407_150658111.jpg	210924145405_IMG_20210407_150658111.jpg	1562078	image/jpeg	7dba15ba2c333f0578074a57c373510fab7f7b2f6fb3d74f7986e0eccd7fead9	0	1	2021-09-24 14:54:05.662807	GPIO pines conectores d-sub	2021/09
101	378	Issue	IMG_20210407_150726460.jpg	210924145405_IMG_20210407_150726460.jpg	910934	image/jpeg	14830b22e72c90ccd225bec836a7ec1f90a93529f47be5fe7e4393985ee93491	0	1	2021-09-24 14:54:05.795646	GPIO pines conectores d-sub	2021/09
104	378	Issue	IMG_20210407_150720999.jpg	210924145407_IMG_20210407_150720999.jpg	927712	image/jpeg	d354da22e3b1d1999ff1b7f831306e22d3bb60e49a633a8d400b8402acbad625	0	1	2021-09-24 14:54:07.520343	GPIO pines conectores d-sub	2021/09
102	378	Issue	IMG_20210407_151219184_HDR.jpg	210924145406_IMG_20210407_151219184_HDR.jpg	613442	image/jpeg	eecb1b1f306f04b4b2a287b6b7edcda6569b5b21ecf150fe492f2e4562fb3bfe	0	1	2021-09-24 14:54:06.579085	GPIO pines conectores d-sub	2021/09
103	378	Issue	IMG_20210407_151221724.jpg	210924145407_IMG_20210407_151221724.jpg	695623	image/jpeg	0497ad5a4105319f2b42495497cc5e73ca4e275752cb53549649be599df6dbe8	0	1	2021-09-24 14:54:07.378929	GPIO pines conectores d-sub	2021/09
105	378	Issue	IMG_20210407_151223611.jpg	210924145409_IMG_20210407_151223611.jpg	690615	image/jpeg	7874e403a0dc06ba34c88e0766fab8ef5e64dc051e4ac626e94b071163afad7a	0	1	2021-09-24 14:54:09.76204	GPIO pines conectores d-sub	2021/09
106	378	Issue	IMG_20210407_151245704.jpg	210924145411_IMG_20210407_151245704.jpg	773537	image/jpeg	a86bf18bd004c3f0fce53458bdd90c331386c17ef783a04ee326b9bdd56eae13	0	1	2021-09-24 14:54:11.5947	GPIO pines conectores d-sub	2021/09
107	378	Issue	IMG_20210407_151251372_HDR.jpg	210924145415_IMG_20210407_151251372_HDR.jpg	694855	image/jpeg	d47a40d6792507006f3ad488bdc3e571e1683bf349ef3385a911d065fabb0eb4	0	1	2021-09-24 14:54:15.677101	GPIO pines conectores d-sub	2021/09
108	378	Issue	IMG_20210407_150736445.jpg	210924145416_IMG_20210407_150736445.jpg	884699	image/jpeg	400a669ec4e1283f0d26acefdad1506b2c9413a656594187d1cf693e1673f3d7	0	1	2021-09-24 14:54:16.71888	GPIO pines conectores d-sub	2021/09
245	\N	\N	L2.csv	211209193418_L2.csv	9239	application/vnd.ms-excel	74e037b0ae19672aa1e43f1ec3b78414af24bc5d5db72d408ffb3a797de07a65	0	1	2021-12-09 19:34:18.111996	\N	2021/12
251	\N	\N	SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.txt	211213124811_d227bbf9f17fad58bdc78f5e1552866c.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-13 12:48:11.463983	\N	2021/12
252	\N	\N	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	211213124811_7668578567693358306b914f3e454b8d.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-13 12:48:11.529158	\N	2021/12
218	373	Issue	IMG_20210517_154729844.jpg	210927171922_IMG_20210517_154729844.jpg	3730630	image/jpeg	5989d80811918df8ed29279e882261771776ac7ff358853a6353238d951b9c5e	0	1	2021-09-27 17:19:22.969252		2021/09
230	\N	\N	SB-030000-RQ-00100-C SABIA-Mar L2B Safety And Mission Assurance Requirements(1).pdf	210929184817_6ff52f1f43f3aac4d9b38eebadb768f8.pdf	527215	application/pdf	1d2350ece0666f56e81da3eabdde816d34a1a94c259783b291b5ffc7e90de296	0	1	2021-09-29 18:48:17.449216	\N	2021/09
231	\N	\N	SB-020100-RQ-00200-C SABIAMar L2B Mission System Requirement document.pdf	210929184819_5be1c1b15453ab878f6ba10d8582ca90.pdf	812727	application/pdf	c8d86b33ffa4e0595e71c127a6e8bfe00d47ed74fc6f6629be249a8c6c0d88bc	0	1	2021-09-29 18:48:19.19554	\N	2021/09
232	\N	\N	SB-020100-RQ-00100-C SABIAMAR L2B ENVIROMENTAL REQUIREMENT DOCUMENT.pdf	210929184916_b72dacf8beb059fe0f18bfc9857487b9.pdf	458752	application/pdf	5ea879d3cb543f16df220ffc5ce93997f0bb11d28602e33e326b4811b45c7d25	0	1	2021-09-29 18:49:16.869198	\N	2021/09
136	378	Issue	IMG_20210407_161337589.jpg	210924150204_IMG_20210407_161337589.jpg	955408	image/jpeg	8e23e9c6dc87f16325a32fee4028e7b66de62b5f1fd58981274fd7f9f874d7d6	0	1	2021-09-24 15:02:04.144348	AVAB	2021/09
137	378	Issue	IMG_20210407_161341682.jpg	210924150204_IMG_20210407_161341682.jpg	947946	image/jpeg	5e39bbfbd9953a9b5195f8fc0c01cb3cbe9d0965aa1eaaae6f169af87888ba2d	0	1	2021-09-24 15:02:04.217925	AVAB	2021/09
139	378	Issue	IMG_20210407_161353336.jpg	210924150206_IMG_20210407_161353336.jpg	1025809	image/jpeg	d93176ec292a5dd73c995d64d857c6c340c5d300f447d8476c1f8003c69e2a12	0	1	2021-09-24 15:02:06.043173	AVAB	2021/09
138	378	Issue	IMG_20210407_161400577.jpg	210924150205_IMG_20210407_161400577.jpg	880371	image/jpeg	70d28879ed848c9da2345e7feb65f48d99a7eae3ca821af25484402bc3e62629	0	1	2021-09-24 15:02:05.693084	AVAB	2021/09
140	378	Issue	IMG_20210407_161323986.jpg	210924150206_IMG_20210407_161323986.jpg	1356383	image/jpeg	85d717833ac02c502a879fb562bf7ffe84a84b700ab91702bb596e7a6c316368	0	1	2021-09-24 15:02:06.98437	AVAB	2021/09
145	378	Issue	IMG_20210407_161406478.jpg	210924150214_IMG_20210407_161406478.jpg	1024942	image/jpeg	47d450926cd23c71586a9c8c43d5edc576de7ed62f8b462b0f0fd48da1fd65e3	0	1	2021-09-24 15:02:14.208767	AVAB	2021/09
141	378	Issue	IMG_20210407_161422228.jpg	210924150207_IMG_20210407_161422228.jpg	827017	image/jpeg	90056468fb458a95b9475e44d8bc4109493be268b00244b29f1aeb6e9437b214	0	1	2021-09-24 15:02:07.975768	AVAB	2021/09
142	378	Issue	IMG_20210407_161637092.jpg	210924150208_IMG_20210407_161637092.jpg	742315	image/jpeg	01dab13de84e9b1c1fa7c2b3aeb158de4611bd1c15889ed8aefc8852594ab53e	0	1	2021-09-24 15:02:08.800792	AVAB	2021/09
143	378	Issue	IMG_20210407_161642421.jpg	210924150209_IMG_20210407_161642421.jpg	813719	image/jpeg	9ccbff1fac856159e8dccd081760fe2bfcb5d01c83d7fd047f7000df3d7ea05a	0	1	2021-09-24 15:02:09.917106	AVAB	2021/09
144	378	Issue	IMG_20210407_161410400.jpg	210924150211_IMG_20210407_161410400.jpg	933329	image/jpeg	ff348ff2a47d90b2be04e248b25b2314d8417cb26830b93e40d325c611070e87	0	1	2021-09-24 15:02:11.141972	AVAB	2021/09
146	\N	\N	IMG_20210407_161410400.jpg	210924150354_IMG_20210407_161410400.jpg	933329	image/jpeg	ff348ff2a47d90b2be04e248b25b2314d8417cb26830b93e40d325c611070e87	0	1	2021-09-24 15:03:54.74497	\N	2021/09
147	\N	\N	IMG_20210407_161704651.jpg	210924150354_IMG_20210407_161704651.jpg	788874	image/jpeg	56fa515be1d44bc90713eab9cef91b85ee4cdd04f345e427aa2d4b17bed96462	0	1	2021-09-24 15:03:54.768454	\N	2021/09
148	\N	\N	IMG_20210407_161733171.jpg	210924150357_IMG_20210407_161733171.jpg	745230	image/jpeg	22aed209c18d4c1e5671ee956bd4110fd3c26e1e1945d44e95696d5ea822fbbc	0	1	2021-09-24 15:03:57.406427	\N	2021/09
149	\N	\N	IMG_20210407_161710250.jpg	210924150357_IMG_20210407_161710250.jpg	795330	image/jpeg	81e4fd8df67bab431652198d342608213f2280f995392682c5257a4a556143db	0	1	2021-09-24 15:03:57.417509	\N	2021/09
150	\N	\N	IMG_20210407_161730452.jpg	210924150358_IMG_20210407_161730452.jpg	814288	image/jpeg	e2edfc63b0078e3061eb4161f8c7036d56b7886f456077cc78e23b550977610a	0	1	2021-09-24 15:03:58.633622	\N	2021/09
151	\N	\N	IMG_20210408_122855052.jpg	210924150359_IMG_20210408_122855052.jpg	1078328	image/jpeg	e5bf22881fdc038fe5c843d6f00574399a3ab2921c4003deb9a94ca7a3b85ce9	0	1	2021-09-24 15:03:59.800921	\N	2021/09
152	\N	\N	IMG_20210408_122832506.jpg	210924150401_IMG_20210408_122832506.jpg	1133237	image/jpeg	5ae41a9c473303bbf424f9dee65c84748b6ede93c6745b88a1d350bfdd713237	0	1	2021-09-24 15:04:01.008277	\N	2021/09
153	\N	\N	IMG_20210408_122857764.jpg	210924150401_IMG_20210408_122857764.jpg	1096211	image/jpeg	04d5f06d7343a24819e3e45f501d3f3c9d684fcb92b155ea8fb544ad89e55beb	0	1	2021-09-24 15:04:01.991321	\N	2021/09
154	\N	\N	IMG_20210408_122820646.jpg	210924150402_IMG_20210408_122820646.jpg	1010578	image/jpeg	8bbb98dca4efcf26d5b545548c4dca8022fe4576ffd35e7f4983ae7329e55b0e	0	1	2021-09-24 15:04:02.099464	\N	2021/09
155	\N	\N	IMG_20210408_122931872_BURST000_COVER.jpg	210924150403_IMG_20210408_122931872_BURST000_COVER.jpg	1392325	image/jpeg	651befaf4caf193ce7a29fcef684aeab4057d60bb6069bdda605601133a270cb	0	1	2021-09-24 15:04:03.182797	\N	2021/09
233	\N	\N	SB-020100-RQ-00200-C SABIAMar L2B Mission System Requirement document.pdf	210929184923_5be1c1b15453ab878f6ba10d8582ca90.pdf	812727	application/pdf	c8d86b33ffa4e0595e71c127a6e8bfe00d47ed74fc6f6629be249a8c6c0d88bc	0	1	2021-09-29 18:49:23.910182	\N	2021/09
234	\N	\N	SB-030000-RQ-00100-C SABIA-Mar L2B Safety And Mission Assurance Requirements.pdf	210929184926_f09b55161f0dcd87f25e99e4cbba24ef.pdf	527215	application/pdf	1d2350ece0666f56e81da3eabdde816d34a1a94c259783b291b5ffc7e90de296	0	1	2021-09-29 18:49:26.442553	\N	2021/09
246	\N	\N	L3.csv	211209194841_L3.csv	4317	application/vnd.ms-excel	99a1ca7250cccb17d5dff57556fd65e2ed019865539cefee847fb3c927481f9d	0	1	2021-12-09 19:48:41.297274	\N	2021/12
258	\N	\N	scenario-generator-3.2.2.tar.md5	211220182556_scenario-generator-3.2.2.tar.md5	223	\N	6257ea80073832adaffd8427b00978100ec4d4e72b21e92378737726b12d9630	0	1	2021-12-20 18:25:56.775201	\N	2021/12
156	378	Issue	IMG_20210408_122925424.jpg	210924150502_IMG_20210408_122925424.jpg	1164142	image/jpeg	05fc8fc668da82798fcb1280a6944580bac6bf580aecfd7bdaf539b43632ba20	0	1	2021-09-24 15:05:02.160419	AVAB	2021/09
157	378	Issue	IMG_20210408_122936046.jpg	210924150502_IMG_20210408_122936046.jpg	1146107	image/jpeg	629f46c5a7749b2829543defd38ccf23ae8815eb077284e3a1a04d98ecdb81fa	0	1	2021-09-24 15:05:02.648462	AVAB	2021/09
159	378	Issue	IMG_20210408_122957751.jpg	210924150505_IMG_20210408_122957751.jpg	1192087	image/jpeg	bcabc83569fd6db5de5e416e761a9c9738abe8eb5fae907a6040eede6d4066cb	0	1	2021-09-24 15:05:05.324625	AVAB	2021/09
158	378	Issue	IMG_20210408_123020030.jpg	210924150503_IMG_20210408_123020030.jpg	1152535	image/jpeg	7d6cdee597ef338f61f2bb7c3a4cab329ac9d7293271be7923f7e898bc72f5cc	0	1	2021-09-24 15:05:03.914859	AVAB	2021/09
160	378	Issue	IMG_20210408_123045108.jpg	210924150505_IMG_20210408_123045108.jpg	1277116	image/jpeg	e48fb1b23858dd3255e62e29f937f3d5a1f649788a71c20a19e75897a67a0aa3	0	1	2021-09-24 15:05:05.364336	AVAB	2021/09
161	378	Issue	IMG_20210408_123053911.jpg	210924150506_IMG_20210408_123053911.jpg	939409	image/jpeg	67bd69aa14dbf8a0e9478a4217589e732fcb5d29a41c3766f71811f5efc6daa5	0	1	2021-09-24 15:05:06.623516	AVAB	2021/09
162	378	Issue	IMG_20210408_123102421.jpg	210924150507_IMG_20210408_123102421.jpg	1101201	image/jpeg	fd57d9127c203a1995723e590970e6ef0e8b15c21eb156a2075b554c789c349f	0	1	2021-09-24 15:05:07.381659	AVAB	2021/09
164	378	Issue	IMG_20210408_123108956.jpg	210924150510_IMG_20210408_123108956.jpg	1193983	image/jpeg	70848c40bb412af5db3f0c953e269d468672603497fcc8376d452d40c47366a7	0	1	2021-09-24 15:05:10.022196	AVAB	2021/09
163	378	Issue	IMG_20210408_123026763.jpg	210924150509_IMG_20210408_123026763.jpg	1194557	image/jpeg	78d9a7ddb95e7a6bed806cf66f912aefba041b40d676a8438e435e0b018d61b6	0	1	2021-09-24 15:05:09.531418	AVAB	2021/09
165	377	Issue	SBM-OBC-NC-00059 Footprint en PCB de tamaño diferente respecto al componente.docx	210924151102_8e9dadaa72390bb3c639f92de1455ab9.docx	277045	application/vnd.openxmlformats-officedocument.wordprocessingml.document	144ef85bda854590180f0688aef42d873c422fabbad7ee4c6055282296fc273e	0	1	2021-09-24 15:11:02.106401		2021/09
219	378	Issue	IMG_20210408_155457070.jpg	210927180259_IMG_20210408_155457070.jpg	843493	image/jpeg	73ac45db4bcf51f12df3824133a7237481c14a88da92134e3360f23961307613	0	1	2021-09-27 18:02:59.185	GPIO pines conectores d-sub	2021/09
166	376	Issue	SBM-OBC-NC-00060 Dificultad para soldar capacitor ceramico dentro de valores de temperatura indicados por norma.docx	210924151147_3ffdf83994b73a08957a4a48ceebfc68.docx	60934	application/vnd.openxmlformats-officedocument.wordprocessingml.document	9a1896cad38f3e63a430a200f7c3739b7c66c4b5c099d558fa852662a24bee27	0	1	2021-09-24 15:11:47.833058		2021/09
235	\N	\N	SB-040000-RQ-00400-B SABIAMar L1 and L2A Requirements.pdf	210929184936_21ec5787a9fb522ce870a8096f371bdd.pdf	883251	application/pdf	648cf7d171af0e1af1b138b7bf7a6b81022e72bb85700f6d7fd9f8fbc7dc48ff	0	1	2021-09-29 18:49:36.790802	\N	2021/09
167	375	Issue	SBM-OBC-NC-00062 Desplazamiento de thermagap una vez integrado el componente.docx	210924151237_1338e85bd8257dfecd09e448db3cb9ef.docx	1501840	application/vnd.openxmlformats-officedocument.wordprocessingml.document	bd6350dbb54bd98d793058265dabd225a7bd9b7713260688baac3d2756d3310e	0	1	2021-09-24 15:12:37.80717		2021/09
247	\N	\N	SB1-D-RPT-R-D01-002_v1.1_VerificationControlMatrix-GS-GSE-EMv2.0.pdf	211209195008_096b6da21e28c3d3d97351748ce22d3d.pdf	721313	application/pdf	06dfd6a8f0246aaa1404e77fdb96a47ad35aa3117c963467ba3ea81805dc9347	0	1	2021-12-09 19:50:08.07511	\N	2021/12
168	374	Issue	SBM-OBC-NC-00064 Discrepancias entre componentes y footprints.docx	210924151342_69eda1fb2ff16392a6c5c1a3a48d3f46.docx	2229569	application/vnd.openxmlformats-officedocument.wordprocessingml.document	f97dbbc9902d3d2749e40d66749c5c27d21799b54b66bd4d0813863c3eefc4ca	0	1	2021-09-24 15:13:42.10534		2021/09
253	\N	\N	SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.txt	211213125326_d227bbf9f17fad58bdc78f5e1552866c.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-13 12:53:26.928871	\N	2021/12
254	\N	\N	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211213125544_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-13 12:55:44.539697	\N	2021/12
256	\N	\N	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211213151735_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-13 15:17:35.211723	\N	2021/12
259	\N	\N	SB1-G-RPT-T-D01-003_v5.0_Commanding-5.0.0-DisenoeInformeDeTests_Evidencias.md5	211220191015_76e89afd80a35d082479648d32ce7050.md5	317	\N	171bdf121367be8980f31e429439b51a798c2dcedfcae5e9f08b9ee1aa317f32	0	1	2021-12-20 19:10:15.588032	\N	2021/12
260	\N	\N	SB1-G-RPT-T-D01-003_v5.0_Commanding-5.0.0-DisenoeInformeDeTests_Evidencias.md5	211220191032_76e89afd80a35d082479648d32ce7050.md5	317	\N	171bdf121367be8980f31e429439b51a798c2dcedfcae5e9f08b9ee1aa317f32	0	1	2021-12-20 19:10:32.242816	\N	2021/12
169	373	Issue	IMG_20210510_112432366_HDR.jpg	210924152051_IMG_20210510_112432366_HDR.jpg	2433562	image/jpeg	412fb3cb0943e11cb657dfa500ad122b4b01b814ccada6b7e2f5c58fdc9ad745	0	1	2021-09-24 15:20:51.334083		2021/09
170	373	Issue	IMG_20210510_112443619.jpg	210924152051_IMG_20210510_112443619.jpg	2278262	image/jpeg	c09fdd56b9fab3e739f05aaf1b3e382b75289fd427562be30ea3db58f0ff6728	0	1	2021-09-24 15:20:51.393496		2021/09
171	373	Issue	IMG_20210510_112446422.jpg	210924152054_IMG_20210510_112446422.jpg	2249115	image/jpeg	a35ee320340f343d9351836cdbd329e27051bb066789991f6c94f7f1cbf51a29	0	1	2021-09-24 15:20:54.433092		2021/09
172	373	Issue	IMG_20210510_112455676.jpg	210924152057_IMG_20210510_112455676.jpg	2330774	image/jpeg	7af4b172f88aa47a1fa96e1828c1938107a6f06becb067da57cf72b7feba50e8	0	1	2021-09-24 15:20:57.807456		2021/09
173	373	Issue	Especificaciones Conformado de Pines.xls	210924152100_911ac3b68e0c7b1d775dbb1f64af50ca.xls	4101632	application/vnd.ms-excel	536ef2a9799e59ff2fde5910c427b181f2dbab4390ccf5510baf23a0e3133d03	0	1	2021-09-24 15:21:00.874403		2021/09
175	373	Issue	IMG_20210517_154003205.jpg	210924152106_IMG_20210517_154003205.jpg	2734406	image/jpeg	a1a11f37b4810e0a56d65db6051b2b6a889e7e1ed6e7f19c98ed18188f65370c	0	1	2021-09-24 15:21:06.731322		2021/09
174	373	Issue	IMG_20210517_154028944.jpg	210924152105_IMG_20210517_154028944.jpg	3412744	image/jpeg	a3cb795ec29b169bc947ca90a4416ae02c3bcef1f783d6a2a6fe0f67cfb26c5b	0	1	2021-09-24 15:21:05.231445		2021/09
176	373	Issue	IMG_20210517_154311122.jpg	210924152109_IMG_20210517_154311122.jpg	3595826	image/jpeg	b6bdee963abf05e8f93d346586c453e519a26c833293c193b3601356f227da77	0	1	2021-09-24 15:21:09.42289		2021/09
178	373	Issue	IMG_20210517_154329592.jpg	210924152116_IMG_20210517_154329592.jpg	3578820	image/jpeg	99690b74c5d70a1158b8041ca9ac9debef47967b9ffffd77a857aae8cac9d87c	0	1	2021-09-24 15:21:16.054422		2021/09
177	373	Issue	IMG_20210517_154340487.jpg	210924152113_IMG_20210517_154340487.jpg	3082557	image/jpeg	f7d75ee89c539ccd1cccb9e2bc20333cf925dcb799b35a4dac69a9a8ff8cc8c9	0	1	2021-09-24 15:21:13.096752		2021/09
180	373	Issue	IMG_20210517_154358454.jpg	210924152204_IMG_20210517_154358454.jpg	4014873	image/jpeg	1f1bc6eab18ca5bc436cb901c231af597715daf4830e1cc2ecc324f0381bad63	0	1	2021-09-24 15:22:04.705796		2021/09
179	373	Issue	IMG_20210517_154738694.jpg	210924152159_IMG_20210517_154738694.jpg	3338740	image/jpeg	a90995d7bc212b24d9091e3141f2c8c564d8b4a5929809c35406737b5de6c2c2	0	1	2021-09-24 15:21:59.331841		2021/09
181	373	Issue	IMG_20210517_154744597.jpg	210924152205_IMG_20210517_154744597.jpg	3535482	image/jpeg	e0dd63175adb23ee1bc964e9cccb55a536ec1789ccf402e1cc53c281d6150390	0	1	2021-09-24 15:22:05.980044		2021/09
182	373	Issue	IMG_20210517_154800471.jpg	210924152209_IMG_20210517_154800471.jpg	3118004	image/jpeg	1ee004001f4de287f9966b8f46d7bfbf5660983bd0874eacd79bae22641753af	0	1	2021-09-24 15:22:09.337921		2021/09
183	373	Issue	IMG_20210517_154805952.jpg	210924152210_IMG_20210517_154805952.jpg	3071944	image/jpeg	090f1a7027a33892a3bdb9ec1b00bf0310998e7ef89ed0a500c1d91528b4ca67	0	1	2021-09-24 15:22:10.687636		2021/09
186	373	Issue	IMG_20210517_154809113.jpg	210924152224_IMG_20210517_154809113.jpg	4280744	image/jpeg	7101e1577ec9830f960d281bbed2f5208f4a74a890fcb7cd4a230d48166d6257	0	1	2021-09-24 15:22:24.101887		2021/09
184	373	Issue	IMG_20210517_160413489.jpg	210924152216_IMG_20210517_160413489.jpg	4318568	image/jpeg	a37597fcb12c5a0575b5f60aa3b7d2912090bb3c679e5d150baea9b7df78f596	0	1	2021-09-24 15:22:16.061579		2021/09
185	373	Issue	IMG_20210517_160418467.jpg	210924152221_IMG_20210517_160418467.jpg	3585507	image/jpeg	79eb4049caa6d96ed8d03b3d3e9a8c544d024b97c97d731b51c6edc9d6ec1ee6	0	1	2021-09-24 15:22:21.452233		2021/09
187	373	Issue	IMG_20210517_160424360.jpg	210924152225_IMG_20210517_160424360.jpg	3038789	image/jpeg	33fff06e5fe3614512e9b33db803684c6ba7e7b6a524501e1201bcc29c656ef1	0	1	2021-09-24 15:22:25.726984		2021/09
188	373	Issue	IMG_20210517_160430619.jpg	210924152229_IMG_20210517_160430619.jpg	3008956	image/jpeg	15ac2c07f8016d0f7ea16d64a8f88b03fbe0be40379d16c4d37fe807c6b86275	0	1	2021-09-24 15:22:29.676064		2021/09
198	373	Issue	RE  Modificaciones de PCBs por NCs de Poblado.msg	210924152355_b294d2745f8d250285046f07fef8d16d.msg	1357312	application/vnd.ms-outlook	dcc2748bdb60e99520405df4d3f521b091dc6cfba7cd04564aee97d069f65281	0	1	2021-09-24 15:23:55.304519	Mail de Marcos Ferrer del 11-6-21	2021/09
189	373	Issue	IMG_20210517_160431124.jpg	210924152340_IMG_20210517_160431124.jpg	2828950	image/jpeg	50d49f68f30dbd0355d536cde4a0231552764e70136c250306fcb4fa2e9aba7b	0	1	2021-09-24 15:23:40.515835		2021/09
190	373	Issue	IMG_20210517_160441837.jpg	210924152341_IMG_20210517_160441837.jpg	3091625	image/jpeg	ce84ee30643714b52827943061f4bee28ad261a805ed6c76e26c8df7009f613b	0	1	2021-09-24 15:23:41.266134		2021/09
191	373	Issue	IMG_20210517_160450475.jpg	210924152344_IMG_20210517_160450475.jpg	3121091	image/jpeg	369e65606187a8c6e8b344c4d54c8cd6a24a764b541edd28f2cb7c3b46524268	0	1	2021-09-24 15:23:44.265189		2021/09
193	373	Issue	IMG_20210517_160454904.jpg	210924152348_IMG_20210517_160454904.jpg	3968075	image/jpeg	d9c12d19626600cee8852b7841db7dd36e5c2df11a80a97842b8d3cfb70af84d	0	1	2021-09-24 15:23:48.364093		2021/09
192	373	Issue	IMG_20210518_105747822.jpg	210924152347_IMG_20210518_105747822.jpg	1996730	image/jpeg	3172e44c7a713ab4f77ca86a25cf51a17ca8e156a422d02b0ad0612d0f400dc8	0	1	2021-09-24 15:23:47.673085		2021/09
196	373	Issue	IMG_20210518_105938667.jpg	210924152350_IMG_20210518_105938667.jpg	1351332	image/jpeg	d8fbc10f645b8f73106d016f2167e2c0032b0b55f39fc6640e3c48914cde2ad2	0	1	2021-09-24 15:23:50.963463		2021/09
194	373	Issue	SBM-OBC-NC-00068 Listado de seguimiento de acciones.xlsx	210924152349_684f41dcbe84ef8a20846e493d5f3ef1.xlsx	641902	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	6031435334e46c837d8bf35c8373e7183b0f8a1d58e0e50ce968b803c88ccc33	0	1	2021-09-24 15:23:49.848859		2021/09
195	373	Issue	RE  Invitación  NRB NC diferencias dimensionales altura de conformado componentes (SBM-OBC-NC-00068).msg	210924152350_d741521cac418d845cbfafd38bb88fe7.msg	215552	application/vnd.ms-outlook	8508168ba13ba0bc8b84184f3a0d4214c7564f741c61c6e935ad0cef8ee40d82	0	1	2021-09-24 15:23:50.605203		2021/09
197	373	Issue	RE  Modificaciones de PCBs por NCs de Poblado.msg	210924152351_6bc9155495fa0532b0559ebd0d2abcea.msg	275968	application/vnd.ms-outlook	b37629b802a438c871ad04651921c06c710172bb42ee8e616105188eb1fb986c	0	1	2021-09-24 15:23:51.355028	Mail de Marcos Ferrer del 11-6-21	2021/09
199	373	Issue	SBM-OBC-NC-00068 Diferencias dimensionales en altura de componentes.pdf	210924152434_9a8289d9c226ce35b7231d1c057c1cf2.pdf	1001692	application/pdf	3c55babdda60d758e2ff22573348f9abdc335f6b75d944b86daa9fcdd4adfe2b	0	1	2021-09-24 15:24:34.081792		2021/09
200	\N	\N	S1300-21 CONAE - SABIA MAR - NCR - 4e cell self-discharge.pdf	210924153833_9c07aac9ef48958bef2ac1821f59825c.pdf	371631	application/pdf	d2ab65c784c04bcdadad63e3809ec798979fc2a6b2d141fb10da6d71f2cdf61e	0	1	2021-09-24 15:38:33.155008	\N	2021/09
201	\N	\N	S1389-21_Sabia-Mar_Delivery preparation_MoM Signed.pdf	210924153833_fb161b0e930257422689f9e4503f3a79.pdf	767932	application/pdf	1bda3be3cfecc086b573ecf972b3a3c52a2db0005050d37483b2cd1fdacdb2ed	0	1	2021-09-24 15:38:33.383845	\N	2021/09
202	371	Issue	20210616-173559-380.png	210924153848_20210616-173559-380.png	185251	image/png	24a1259bf22390b5d5910b69fd868e13d15654a3ba6ece1e874dbbc2501a8be4	0	1	2021-09-24 15:38:48.031976		2021/09
203	371	Issue	S1389-21_Sabia-Mar_Delivery preparation_MoM Signed.pdf	210924153833_fb161b0e930257422689f9e4503f3a79.pdf	767932	application/pdf	1bda3be3cfecc086b573ecf972b3a3c52a2db0005050d37483b2cd1fdacdb2ed	0	1	2021-09-24 15:38:48.681289		2021/09
205	371	Issue	S1819-21.pdf	210924153851_S1819-21.pdf	1371841	application/pdf	2523b3dfa2ac81a8a812375540720ae2eb962bb64ff32c86b48e6121d5768959	0	1	2021-09-24 15:38:51.322578		2021/09
204	371	Issue	Sabia Mar - PFM battery pack activity progress (138 MB).msg	210924153850_7feef8c53d0c2b14ef97ba23f15c0ca8.msg	1456640	application/vnd.ms-outlook	08eb6b702b5db4332cff4ef233f8428dc315be4ddfd029e9695d9715367b5131	0	1	2021-09-24 15:38:50.172619		2021/09
208	\N	\N	Especificación de requerimientos y compliance matrix.rar	210924154410_b7e1b77c6da5788dc88b5af639e06a90.rar	1720837	application/x-rar-compressed	a5b6086cb06e481668dbcc8465ff3aed163a73b55073401b25697c549398f850	0	1	2021-09-24 15:44:10.187892	\N	2021/09
209	\N	\N	selección del actuador de Moog.rar	210924154418_114670a3a8061b2c3a6f4a8342f08776.rar	2470332	application/x-rar-compressed	7eebb638ddf9e2442fcdcd287ceaca9c733c366c6910b15f369418bca6398238	0	1	2021-09-24 15:44:18.67697	\N	2021/09
210	\N	\N	Informacion técnica adicional.rar	210924154420_5f6ea0db9df985b2fb674871ed07b5fd.rar	2809996	application/x-rar-compressed	2c2727f7dba61f26bafc8926b0b16205f666058a5a66a9ebf77b567fc9ebfb5b	0	1	2021-09-24 15:44:20.718673	\N	2021/09
206	367	Issue	20210804-102619-217.png	210924154242_20210804-102619-217.png	5319	image/png	2463a52f15ad567af368d3bcf05e3b001e729205191a375b1ca51b2314e4c93b	0	1	2021-09-24 15:42:42.893943		2021/09
207	367	Issue	Historial NC SBM-NCR-00037 v210818.docx	210924154243_679216b5746243d90f74db03e680c4f4.docx	21884	application/vnd.openxmlformats-officedocument.wordprocessingml.document	798987443e8e50dfb230c036addb94d4ae545e301532a1d44a0ea1fec65e6c5a	0	1	2021-09-24 15:42:43.109671		2021/09
211	\N	\N	SBM-OBC-NC-00086 Orden incorrecto de encendido de fuentes power up SBC EM.docx	210924154609_443ab33ba8a24503f69e52761fd91db5.docx	61374	application/vnd.openxmlformats-officedocument.wordprocessingml.document	fe719243ee707754520058c2d1da704ec484ffea5b0566e9dc68a6fff88b085f	0	1	2021-09-24 15:46:09.985253	\N	2021/09
212	366	Issue	AC10 SBM-OBC-NC-00086 Orden incorrecto de encendido de fuentes power up SBC EM.docx	210924154609_443ab33ba8a24503f69e52761fd91db5.docx	61374	application/vnd.openxmlformats-officedocument.wordprocessingml.document	fe719243ee707754520058c2d1da704ec484ffea5b0566e9dc68a6fff88b085f	0	1	2021-09-24 15:46:17.766428		2021/09
223	378	Issue	IMG_20210407_161733171.jpg	210927180831_IMG_20210407_161733171.jpg	745230	image/jpeg	22aed209c18d4c1e5671ee956bd4110fd3c26e1e1945d44e95696d5ea822fbbc	0	1	2021-09-27 18:08:31.771234	AVAB	2021/09
224	378	Issue	IMG_20210408_122820646.jpg	210927180832_IMG_20210408_122820646.jpg	1010578	image/jpeg	8bbb98dca4efcf26d5b545548c4dca8022fe4576ffd35e7f4983ae7329e55b0e	0	1	2021-09-27 18:08:32.446987	AVAB	2021/09
225	378	Issue	IMG_20210408_122832506.jpg	210927180833_IMG_20210408_122832506.jpg	1133237	image/jpeg	5ae41a9c473303bbf424f9dee65c84748b6ede93c6745b88a1d350bfdd713237	0	1	2021-09-27 18:08:33.869753	AVAB	2021/09
236	\N	\N	conae_logo.png	210929191329_conae_logo.png	8612	image/png	9dff11a23e9a7306bd05e5410dc3570dec18dc4efe160168374e019665a5d07c	0	1	2021-09-29 19:13:29.91368	\N	2021/09
237	\N	\N	REQUIREMENT TREE-36.jpg	210929191331_54e73da081b52fe7f28953a700b0c5f3.jpg	105706	image/jpeg	300b61ee851e8b8a4111a48cca5a76080f40cecafa83f569015b661aecd1e2c6	0	1	2021-09-29 19:13:31.737305	\N	2021/09
238	\N	\N	satelite.jpg	210929191332_satelite.jpg	10874	image/jpeg	2b6a7b9aa41446cda743108556d9f08b27b9ee4fe3abb2fc9ee80a36f49bb50e	0	1	2021-09-29 19:13:32.645659	\N	2021/09
239	\N	\N	Screenshot_3.jpg	210929191333_Screenshot_3.jpg	14142	image/jpeg	7d966efcee2803351fdd5650fa23580481f7d76074c6483166d25b39a15ef76e	0	1	2021-09-29 19:13:33.445332	\N	2021/09
240	\N	\N	sabia_satelite.png	210929191337_sabia_satelite.png	463606	image/png	7e642a74fe3223a7feaaab9cf607b9395c5f307dc3c6294165666e77007ccbf1	0	1	2021-09-29 19:13:37.094841	\N	2021/09
243	\N	\N	L1.csv	211209183721_L1.csv	252	application/vnd.ms-excel	230d0e59c10d05b46a6a9e8bbcb9b7f60ccedbe402cb5aed57cde423a3ab112b	0	1	2021-12-09 18:37:21.44943	\N	2021/12
248	\N	\N	SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.txt	211213122729_d227bbf9f17fad58bdc78f5e1552866c.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-13 12:27:29.840856	\N	2021/12
249	\N	\N	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	211213122729_7668578567693358306b914f3e454b8d.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-13 12:27:29.948204	\N	2021/12
255	\N	\N	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	211213144641_7668578567693358306b914f3e454b8d.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-13 14:46:41.876106	\N	2021/12
257	\N	\N	L2.csv	211216171355_L2.csv	9239	application/vnd.ms-excel	74e037b0ae19672aa1e43f1ec3b78414af24bc5d5db72d408ffb3a797de07a65	0	1	2021-12-16 17:13:55.340335	\N	2021/12
261	\N	\N	SB1-G-RPT-T-D01-003_v5.0_Commanding-5.0.0-DisenoeInformeDeTests_Evidencias.md5	211220191209_76e89afd80a35d082479648d32ce7050.md5	317	\N	171bdf121367be8980f31e429439b51a798c2dcedfcae5e9f08b9ee1aa317f32	0	1	2021-12-20 19:12:09.412931	\N	2021/12
262	\N	\N	SB1-G-RPT-T-D01-003_v5.0_Commanding-5.0.0-DisenoeInformeDeTests_Evidencias.md5	211220191340_76e89afd80a35d082479648d32ce7050.md5	317	\N	171bdf121367be8980f31e429439b51a798c2dcedfcae5e9f08b9ee1aa317f32	0	1	2021-12-20 19:13:40.980057	\N	2021/12
263	\N	\N	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	211220192941_7668578567693358306b914f3e454b8d.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-20 19:29:41.746848	\N	2021/12
264	\N	\N	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211223112501_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-23 11:25:01.858039	\N	2021/12
265	\N	\N	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211223170655_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-23 17:06:55.35917	\N	2021/12
266	\N	\N	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211223171655_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-23 17:16:55.180047	\N	2021/12
267	\N	\N	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.pdf	211223172837_f375eceff3852acfe5a5b1e27bbd3c72.pdf	1405671	application/pdf	4d2d58826a53684b3f954e3e9fd44b0874133cebfd65d1f470d0425e2970da09	0	1	2021-12-23 17:28:37.831064	\N	2021/12
268	\N	\N	SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.pdf	211223172925_78d4f4e881474e6107886273d924381f.pdf	7419278	application/pdf	1944f6e7cbfe6ccb4b3b55f0ebc33f377775a1be6f6c899788113fbc2d63ab62	0	1	2021-12-23 17:29:25.240365	\N	2021/12
269	\N	\N	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211223173519_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	0	1	2021-12-23 17:35:19.215271	\N	2021/12
270	\N	\N	pro_eva_desemp.vsdx	220214171816_pro_eva_desemp.vsdx	71067	application/vnd.ms-visio.drawing	28727e2c2cec9e4772b79aee2fee66cd0b13e8f6424246dc55223c0ccdca3683	0	1	2022-02-14 17:18:16.377732	\N	2022/02
271	\N	\N	notas user car.txt	220214172921_ee9ccfd74afea35e10a2bfe182f31c92.txt	3480	text/plain	e7b8fcf36bff661014ce55b85797c7f1339915ef05e4cee6d3b55ea5c1b94067	0	1	2022-02-14 17:29:21.128243	\N	2022/02
272	\N	\N	SAB-5339_rfw.docx	220214172921_SAB-5339_rfw.docx	43853	application/vnd.openxmlformats-officedocument.wordprocessingml.document	7232badee3171cd1b3cc0281acfa618b7df373770cbef7d0b72d0b397b668711	0	1	2022-02-14 17:29:21.344261	\N	2022/02
273	\N	\N	SBO-F-PRO-T-D01-002_v1.0_MOCv2.0-OperationsAcceptanceAndValidationProcedures_Dataset.md5	220222155844_322ffa38b9c21d7d20fd9068d987fe79.md5	337	\N	3ff88f6af8ed701db7c8bf19fbff64a1b25d243f7236f55d9204fc0e97d04b3f	0	1	2022-02-22 15:58:44.62947	\N	2022/02
274	\N	\N	SBO-F-PRO-T-D01-002_v1.0_MOCv2.0-OperationsAcceptanceAndValidationProcedures_Dataset.md5	220222160638_322ffa38b9c21d7d20fd9068d987fe79.md5	337	\N	3ff88f6af8ed701db7c8bf19fbff64a1b25d243f7236f55d9204fc0e97d04b3f	0	1	2022-02-22 16:06:38.238469	\N	2022/02
\.


--
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_sources (id, type, name, host, port, account, account_password, base_dn, attr_login, attr_firstname, attr_lastname, attr_mail, onthefly_register, tls, filter, timeout, verify_peer) FROM stdin;
1	AuthSourceLdap	Conae	auth.conae.gov.ar	389			dc=conae,dc=gov,dc=ar	mail			mail	t	f	(accountActive=TRUE)	\N	f
\.


--
-- Data for Name: boards; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.boards (id, project_id, name, description, "position", topics_count, messages_count, last_message_id, parent_id) FROM stdin;
\.


--
-- Data for Name: changes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.changes (id, changeset_id, action, path, from_path, from_revision, revision, branch) FROM stdin;
\.


--
-- Data for Name: changeset_parents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.changeset_parents (changeset_id, parent_id) FROM stdin;
\.


--
-- Data for Name: changesets; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.changesets (id, repository_id, revision, committer, committed_on, comments, commit_date, scmid, user_id) FROM stdin;
\.


--
-- Data for Name: changesets_issues; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.changesets_issues (changeset_id, issue_id) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.comments (id, commented_type, commented_id, author_id, content, created_on, updated_on) FROM stdin;
\.


--
-- Data for Name: custom_field_enumerations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.custom_field_enumerations (id, custom_field_id, name, active, "position") FROM stdin;
\.


--
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.custom_fields (id, type, name, field_format, possible_values, regexp, min_length, max_length, is_required, is_for_all, is_filter, "position", searchable, default_value, editable, visible, multiple, format_store, description, dmsf_not_inheritable) FROM stdin;
64	IssueCustomField	Verification Method	list	---\n- Test\n- Analysis\n- Review of design\n- Inspection\n- Heritage\n		\N	\N	f	f	t	12	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
106	IssueCustomField	Project Impact	list	---\n- Techinal\n- Cost\n- Schedule\n		\N	\N	f	f	t	101	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
31	IssueCustomField	Origin AI #	string	\N		\N	\N	f	f	t	42	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
107	IssueCustomField	Mitigation Proposal	string	\N		\N	\N	f	f	f	102	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
108	IssueCustomField	Originated in	list	---\n- Area\n- Segment\n- Subsystem\n		\N	\N	f	f	t	103	t		t	t	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
152	IssueCustomField	Limited Life Hardware	list	---\n- 'YEs'\n- 'No'\n		\N	\N	f	f	f	141	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
153	IssueCustomField	Criticality	list	---\n- '0'\n- '1'\n- '2'\n- '3'\n- '4'\n- '5'\n- '6'\n- '7'\n- '8'\n- '9'\n		\N	\N	f	f	f	142	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
154	IssueCustomField	Mechanical PartsGroup ID	list	---\n- Anibal TBC\n		\N	\N	f	f	f	143	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
75	IssueCustomField	Provider	list	---\n- INVAP\n- VENG\n- UNLP\n- SAFT\n- CNEA\n- IMER\n- RAFAEL\n- ASCENTIO\n- MOOG\n		\N	\N	f	f	t	70	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
62	IssueCustomField	NC, RFD, RFW ID	text	\N		\N	\N	f	f	f	10	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
52	IssueCustomField	Requires	list	---\n- Rework\n- Retest\n- Analysis\n		\N	\N	f	f	t	65	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
70	IssueCustomField	Classification	list	---\n- l\n- ll\n- Full\n- Partial\n		\N	\N	f	f	t	20	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
65	IssueCustomField	Verification Milestone	list	---\n- PDR\n- Ground Segment CDR\n- Flight Segment CDR\n- Mission CDR\n- FRR\n- PSR\n- PLAR\n- MOR\n- ORR\n		\N	\N	f	f	t	13	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
69	IssueCustomField	Verification Stage	list	---\n- Design\n- Qualification\n- Acceptance\n		\N	\N	f	f	t	15	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
29	IssueCustomField	Key Requirement 	list	---\n- Key\n- No Key\n		\N	\N	f	f	t	5	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
105	IssueCustomField	Sub Status	list	---\n- Open\n- Closed\n- Under Review\n- 'Rejected: need clarification'\n		\N	\N	f	f	t	99	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	RFA field	\N
155	IssueCustomField	Processes Group ID	list	---\n- Anibal TBC\n		\N	\N	f	f	f	144	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
63	IssueCustomField	Verification Outline	text	\N		\N	\N	f	f	f	11	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
156	IssueCustomField	Processes Type	list	---\n- Anibal TBC\n		\N	\N	f	f	f	145	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
157	IssueCustomField	Processes  description	text	\N		\N	\N	f	f	f	146	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n		\N
158	IssueCustomField	Provider internal procedure	string	\N		\N	\N	f	f	f	147	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
22	IssueCustomField	Item Description 	string	\N		\N	\N	f	f	t	38	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
23	IssueCustomField	Root Cause	text	\N		\N	\N	f	f	t	39	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n		\N
21	IssueCustomField	Safety evaluation	list	---\n- 'Yes'\n- 'No'\n		\N	\N	f	f	t	37	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
20	IssueCustomField	Remedial action / Action taken	string	\N		\N	\N	f	f	t	36	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
18	IssueCustomField	Corrective Action Rating	list	---\n- Known Cause / Certain Corrective Action\n- Unknown Cause / Certain Corrective Action\n- Known Cause / Uncertainty in Corrective Action\n- Unknown Cause / Uncertainty in Corrective Action\n		\N	\N	f	f	t	34	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
15	IssueCustomField	Critical Item	list	---\n- 'Yes'\n- 'No'\n		\N	\N	f	f	t	31	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
30	IssueCustomField	Organization	string	\N		\N	\N	f	f	t	9	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	Organization responsible who write and maintain this requirement	\N
32	IssueCustomField	Assignee 1	user	\N		\N	\N	f	f	t	43	f	\N	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nuser_role: []\nedit_tag_style: ''\n		\N
6	IssueCustomField	Originator - Reported By	user	\N		\N	\N	f	f	t	1	f	\N	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nuser_role: []\nedit_tag_style: ''\n		\N
159	IssueCustomField	Sys/SubSys/ Element Resp	string	\N		\N	\N	f	f	f	148	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
73	IssueCustomField	Version Originated	link	\N		\N	\N	f	f	f	21	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n		\N
67	IssueCustomField	Splited	list	---\n- 'Yes'\n- 'No'\n		\N	\N	f	f	t	16	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
74	IssueCustomField	Version Resolved	link	\N		\N	\N	f	f	f	22	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n		\N
66	IssueCustomField	Verification Level	list	---\n- Mission\n- Satelite\n- Segment\n- System\n- Subsystem\n- Unit\n- Box\n- Component\n- Part\n		\N	\N	t	f	t	14	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
1	IssueCustomField	Title	string	\N		\N	\N	f	f	f	2	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
76	IssueCustomField	Location	string	\N		\N	\N	f	f	f	71	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
26	IssueCustomField	Parent Requirement	string	\N		\N	\N	f	f	t	6	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
27	IssueCustomField	Children	text	\N		\N	\N	f	f	t	7	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n		\N
93	IssueCustomField	DUE DATE	list	---\n- APPs CDR\n- Mission CDR\n- ETC\n		\N	\N	f	f	t	88	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	RFA field	\N
95	IssueCustomField	Action Description	string	\N		\N	\N	f	f	f	90	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
101	IssueCustomField	Justification for RFD/RFW	string	\N		\N	\N	f	f	f	95	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	Indicate the cause for failing to implement the applicable requirement.  Indicate risk acceptance associated with approval of the request.  Identify negative impacts to cost, schedule, performance and safety associated with request approval or disapproval.	\N
94	IssueCustomField	Responsible	user	\N		\N	\N	f	f	t	89	f	\N	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nuser_role: []\nedit_tag_style: ''\n	RFA field	\N
68	IssueCustomField	Requirement Level 	list	---\n- L1-MIS\n- L2A\n- L2A-SCI\n- L2B-ENV\n- L2B-SPA\n- L2B-SYS\n- L3-APP\n- L3-PM\n- L3-STRUCTURE\n- L3-GENERAL\n- L3-GS\n- L3-OPS\n- L3-SM\n- L3-LS\n- L4\n- L4-APP\n- L4-NIR-SWIR\n- l4-OBC\n- L4-OBDH\n- L4-TIR\n- L4-VIS-NIR\n- L4-CONTROL CENTER\n- L4-GROUND STATIONS\n- L4 MISSION CENTER\n- L4-OPS\n- L4-LS\n		\N	\N	f	f	t	17	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
4	IssueCustomField	References	string	\N		\N	\N	f	f	t	18	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
48	DmsfFileRevisionCustomField	Project Document CODE	string	\N		\N	\N	f	f	t	1	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
169	IssueCustomField	ID L2B ERD	list	---\n- L2B-ERD\n		\N	\N	f	f	t	152	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
49	DmsfFileRevisionCustomField	Document Type	list	---\n- Analysis\n- Plan\n- Procedure\n- Technical Note\n- Software\n- Requirement\n		\N	\N	t	f	t	5	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
3	IssueCustomField	Type	string	\N		\N	\N	f	f	t	4	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	FUNCTIONAL\r\nCONSTRAINT\r\nPERFORMANCE\r\nNON FUNCTIONAL\r\nDocumentation\r\nHW\r\nSW\r\nSafety\r\nQUALITYOFSERVICE\r\nINTERFACE\r\nENVIRONMENTAL\r\nLOGISTICS\r\nCONFIGURATION\r\nOPERATIONAL\r\nPRODUCTASSURANCE\r\nRESOURCE\r\nPHYSICAL\r\nSTANDARDS\r\nDESIGN\r\nVERIFICATION\r\nNone	\N
2	IssueCustomField	Class	list	---\n- Requirement\n- Recommendation\n- Information\n- Definition\n- Golden Rule\n- Minor\n- Major\n- Waiver\n- Deviation\n- prueba\n		\N	\N	f	f	t	3	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
35	IssueCustomField	Comments	text	\N		\N	\N	f	f	f	56	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n		\N
28	IssueCustomField	Rationale - Justification	text	\N		\N	\N	f	f	f	41	t	None	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n		\N
46	IssueCustomField	Risk Reduction Action	text	\N		\N	\N	f	f	f	55	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n		\N
55	IssueCustomField	Software Affected	list	---\n- S/P SW\n- S/P Firmaware\n- Science\n- Instrument SW\n- Instrument Firmware\n- EGSE\n- Facility\n- N/A\n		\N	\N	f	f	t	62	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
71	IssueCustomField	Close-Out Status	list	---\n- Open\n- Close\n		\N	\N	f	f	t	68	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	State when the requirement is closed by a Verification review	\N
72	IssueCustomField	Mitigation Options	text	\N		\N	\N	f	f	f	69	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n		\N
16	IssueCustomField	Defect	list	---\n- Conformal Coating\n- Contamination\n- Damage\n- Dimensional\n- Documentation\n- Electronic / Electrical\n- Finish\n- Identification\n- Material\n- Mechanical\n- Soldering\n- Acoustic Test\n- EMI/EMC Test\n- Leak Test\n- Performance Test\n- Shock Test\n- Thermal Cycle Test\n- Vibration Test\n- Thermal Vacuum Test\n- Welding / Welds\n- Wiring\n- Continuity / Ground\n- Software Code\n- Quality System Element\n- Mission Operation\n- Short Shipment\n- Provisioning/Purchasing\n		\N	\N	f	f	t	32	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
17	IssueCustomField	Disposition	list	---\n- Use as is / Continue / Accept\n- Rework / Redo / Return to Supplier\n- Correct / Repair / Fix\n- Scrap / Dismiss / Abort\n		\N	\N	f	f	t	33	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
110	IssueCustomField	Req Resp. Office Concurrence	string	\N		\N	\N	f	f	f	104	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
5	IssueCustomField	System Element ID	string	\N		\N	\N	f	f	t	19	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	Topic.Subtopic. 	\N
53	IssueCustomField	ECR Impact	list	---\n- Mass\n- Power\n- Computer Resources\n- Other (add as comment)\n		\N	\N	f	f	t	64	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
164	IssueCustomField	Scope Statement	string	\N		\N	\N	f	f	f	149	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
165	IssueCustomField	Deliverables	link	\N		\N	\N	f	f	f	150	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n		\N
166	IssueCustomField	Function Responsible	string	\N		\N	\N	f	f	f	151	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
170	IssueCustomField	Sys/subsys	list	---\n- Fligh Segment ProtoFlight Model FSFM\n- "├Service Module -  SMOD"\n- "├Payload Module -  PYLM"\n- "├EM service Module - EMSM"\n- "└EM payload Module - EMPM"\n- Ground Segment - GS\n- "├Control Center - CC"\n- "├Mission Center - MC"\n- "├TT&C Station - TT&C"\n- "└Payload Station - PYLS"\n		\N	\N	t	f	f	153	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
50	IssueCustomField	Reason for change	string	\N		\N	\N	f	f	f	67	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
51	IssueCustomField	Documents affected	link	\N		\N	\N	f	f	f	66	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n		\N
10	IssueCustomField	Event Date	date	\N		\N	\N	f	f	t	26	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n		\N
77	IssueCustomField	Reason for rejection	list	---\n- Is a fact, not a risk\n- Normal work\n- Miswritten\n		\N	\N	f	f	t	72	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
78	IssueCustomField	Rejection Details	string	\N		\N	\N	f	f	f	73	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
79	IssueCustomField	Likelihood Consequence	list	---\n- '1'\n- '2'\n- '3'\n- '4'\n- '5'\n		\N	\N	f	f	t	74	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
80	IssueCustomField	Risk Consequence	list	---\n- '1'\n- '2'\n- '3'\n- '4'\n- '5'\n		\N	\N	f	f	t	75	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
92	IssueCustomField	RATIONAL FOR DISPOSITION	string	\N		\N	\N	f	f	f	87	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	RFA field	\N
19	IssueCustomField	Cause	list	---\n- Under Analysis\n- Design Deficiency\n- Procedure not available\n- Procedure not implemented\n- Procedure Inadequate\n- Inadequate Training / Certification\n- Equipment Malfunction\n- Cause Unknown\n- Others\n		\N	\N	f	f	t	35	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
8	IssueCustomField	NC Proveedor	string	\N		\N	\N	f	f	t	24	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
111	IssueCustomField	Requested by	user	\N		\N	\N	f	f	t	105	f	\N	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nuser_role: []\nedit_tag_style: ''\n		\N
36	IssueCustomField	Observations	string	\N		\N	\N	f	f	f	45	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
41	IssueCustomField	Occurrence Tendency	list	---\n- "+"\n- "-"\n- "="\n		\N	\N	f	f	t	51	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
39	IssueCustomField	Impact Tendency	list	---\n- "+"\n- "-"\n- "="\n		\N	\N	f	f	t	49	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
112	IssueCustomField	Familiy	string	\N		\N	\N	f	f	f	106	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
113	IssueCustomField	Group	string	\N		\N	\N	f	f	f	107	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
61	IssueCustomField	Related to	text	\N		\N	\N	f	f	f	8	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n		\N
114	IssueCustomField	Commercial designation	string	\N		\N	\N	f	f	f	108	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
13	IssueCustomField	Build Number	string	\N		\N	\N	f	f	t	29	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
14	IssueCustomField	Serial Number	string	\N		\N	\N	f	f	t	30	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
115	IssueCustomField	Part Number	string	\N		\N	\N	f	f	f	109	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
116	IssueCustomField	Manufacturer	string	\N		\N	\N	f	f	f	110	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
117	IssueCustomField	MFR Country	string	\N		\N	\N	f	f	f	111	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
54	IssueCustomField	Impacted Schedule	list	---\n- Assy/ Sub assy\n- Subsystem\n- Instrument\n- Service Platform\n- Observatory I&T\n- Envirom. Testing\n- Launch Ops\n- Customer\n		\N	\N	f	f	t	63	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
59	IssueCustomField	Origin Type	list	---\n- Comprado\n- Fabricado\n		\N	\N	f	f	t	58	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
33	IssueCustomField	Origin	string	\N		\N	\N	f	f	t	44	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
118	IssueCustomField	Quality Level	string	\N		\N	\N	f	f	f	112	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
119	IssueCustomField	Specification	string	\N		\N	\N	f	f	f	113	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
120	IssueCustomField	Previous Ussage Experience	string	\N		\N	\N	f	f	f	114	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
81	IssueCustomField	Risk Category	list	---\n- Red\n- Yellow\n- Green\n		\N	\N	f	f	t	76	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
34	IssueCustomField	Close Date	date	\N		\N	\N	f	f	t	100	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
7	IssueCustomField	Document/Requirement Affected	string	\N		\N	\N	f	f	t	23	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
131	IssueCustomField	User Analysis	text	\N		\N	\N	f	f	f	120	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	PART ASSESMENT	\N
132	IssueCustomField	Associated Risk IDs	string	\N		\N	\N	f	f	f	121	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
123	IssueCustomField	Procurement Inspection Test	text	\N		\N	\N	f	f	f	115	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	PART ASSESMENT	\N
124	IssueCustomField	Complementary Test	text	\N		\N	\N	f	f	f	116	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	PART ASSESMENT	\N
128	IssueCustomField	Recomendations	text	\N		\N	\N	f	f	f	117	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n		\N
129	IssueCustomField	Usage	string	\N		\N	\N	f	f	f	118	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	PART ASSESMENT	\N
130	IssueCustomField	Project Requirements	text	\N		\N	\N	f	f	f	119	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	PART ASSESMENT	\N
172	DmsfFileRevisionCustomField	Description	string	\N		\N	\N	f	f	t	3	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	Document content description	\N
171	DmsfFileRevisionCustomField	Title	string	\N		\N	\N	t	f	t	2	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	Name defined for the document	\N
173	DmsfFileRevisionCustomField	Doc Author	string	\N		\N	\N	f	f	f	4	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
167	DmsfFileRevisionCustomField	Provider Document Code	string	\N		\N	\N	t	f	f	6	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
56	IssueCustomField	Impacted Project Element	list	---\n- Project Management\n- Science\n- MSE/PSE\n- SMA\n- Launch services\n- Observatory\n- GDS\n- Operations\n- Instrument\n- Other\n		\N	\N	f	f	t	61	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
85	IssueCustomField	REVISOR	list	---\n- REvisor1\n- REvisor2\n- etc\n		\N	\N	f	f	t	80	t		t	t	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	RFA field	\N
58	IssueCustomField	Level and Name	string	\N		\N	\N	f	f	f	59	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
25	IssueCustomField	Model	list	---\n- EM\n- FM\n- MGSE\n- EGSE\n- PFM\n		\N	\N	f	f	t	40	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
133	IssueCustomField	Category / Group	list	---\n- F\n- I\n- TBC anibal\n		\N	\N	f	f	f	122	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	Critical Item field	\N
134	IssueCustomField	Cause (criticality descript)	string	\N		\N	\N	f	f	f	123	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
135	IssueCustomField	Associates risk text	string	\N		\N	\N	f	f	f	124	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
136	IssueCustomField	Criticality level	list	---\n- '0'\n- '1'\n- '2'\n- '3'\n- '4'\n- '5'\n- '6'\n- '7'\n- '8'\n- '9'\n		\N	\N	f	f	f	125	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	Critical Item field	\N
137	IssueCustomField	Control Activity	string	\N		\N	\N	f	f	f	126	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
138	IssueCustomField	Closure Statment	string	\N		\N	\N	f	f	f	127	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
139	IssueCustomField	Critical item type	list	---\n- EEE Parts\n- Reliability Analysis\n- TBc Anibal\n		\N	\N	f	f	f	128	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	Critical Item field	\N
168	DmsfFileRevisionCustomField	Provider	list	---\n- INVAP\n- VENG\n- UNLP\n- SAFT\n- CNEA\n- IMER\n- RAFAEL\n- ASCENTIO\n- MOOG\n		\N	\N	t	f	f	7	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
57	IssueCustomField	Design and specs references	string	\N		\N	\N	f	f	f	60	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
174	DmsfFileRevisionCustomField	WBS ID	list	---\n- 01 - Project documents\n- 0101 - Project Management\n- 0102 - Risk Management\n- 0103 - Project Planning\n- 0104 - Projet reviews\n- 0105 - Cost\n- 0106 - Configuration management\n- 0107 - Logistics and Facilities\n- 02 - System Engineering\n- 0201 - System Engineering Management\n- 0202 - Mission Design\n- 0203 - Software Engineering\n- 0204 - Project Verification and Validation\n- 03 - Safety and Mission Assurance\n- 0301 - SMA Management\n- 030101 - Non-conformance processes activities\n- 030102 - Waivers and deviations process activities\n- 030103 - PFRs and Anomalies\n- 030104 - Documentation Management Activities\n- 030105 - Configuration Control Activities\n- 0302 - System Safety\n- 0303 - Environments\n- 0304 - Reliability\n- 0305 - EEE Parts Material and Process\n- 030501 - NSEPAR\n		\N	\N	t	f	t	8	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
82	IssueCustomField	ID UAM	string	\N		\N	\N	f	f	t	77	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	RFAs ID UAM	\N
83	IssueCustomField	Review Title	string	\N		\N	\N	f	f	f	78	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	RFA Field	\N
84	IssueCustomField	TOPIC	string	\N		\N	\N	f	f	f	79	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	RFA field	\N
9	IssueCustomField	External ID	string	\N		\N	\N	f	f	t	25	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
86	IssueCustomField	STATMENT OF CONCERN	string	\N		\N	\N	f	f	f	81	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	RFA field	\N
87	IssueCustomField	RECOMMENDED ACTION	string	\N		\N	\N	f	f	f	82	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	RFA Field	\N
88	IssueCustomField	Organización	string	\N		\N	\N	f	f	t	83	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	RFA Field	\N
89	IssueCustomField	Dia	string	\N		\N	\N	f	f	t	84	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
44	IssueCustomField	Time Frame	list	---\n- Near-term\n- Mid-term\n- Far-term\n		\N	\N	f	f	t	53	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	Urgency of actions\r\n\r\nNear-term – Action or mitigation needs to take place within the next four months. \r\nMid-term – Action or mitigation needs to take place between 4 and 8 months. \r\nFar-term – Actions or mitigation needs to take place beyond 8 months.\r\n	\N
60	IssueCustomField	CI Type	list	---\n- Hardware\n- Software\n		\N	\N	f	f	t	57	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
90	IssueCustomField	Affected Document/Presentation	link	\N		\N	\N	f	f	f	85	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	RFA field	\N
91	IssueCustomField	RFA DISPOSITION	list	---\n- RFA\n- ADVISORY\n- Rejected\n		\N	\N	f	f	t	86	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	RFA field	\N
42	IssueCustomField	Risk Map	list	---\n- Green\n- Yellow\n- Red\n		\N	\N	f	f	f	52	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
140	IssueCustomField	Impact	list	---\n- High\n- Medium\n- Low\n		\N	\N	f	f	f	129	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
141	IssueCustomField	Probability	list	---\n- High\n- Medium\n- Low\n		\N	\N	f	f	f	130	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
40	IssueCustomField	Probability of Occurrence	list	---\n- 5-Almost certain / 70-100%\n- 4-More likely than not / 50-70%\n- 3-Significant likelihood / 30-50%\n- 2-Unlikely / 1-30%\n- 1-Very unlikely / <1%\n		\N	\N	f	f	t	50	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	Likelihood	\N
11	IssueCustomField	Project Phase	list	---\n- Phase A – Preliminay Analysis – Mission Definition\n- Phase B – Definition – System Definition\n- Phase B – Definition – Preliminary Design\n- Phase C – Design – Final Design\n- Phase D – Development – Fabrication & Integration\n- Phase D – Development – Preparation for Deployment\n- Phase D – Development – Deploy & Ops Verification\n- Phase E/F – Operations & Disposal – Mission Ops\n- Phase E/F – Operations & Disposal - Disposal\n		\N	\N	f	f	f	27	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
12	IssueCustomField	Detected During	list	---\n- Internal Audit\n- Supplier Audit Customer Complaint\n- Incoming Inspection / Test\n- In Process / Final Inspection / Test (non operational)\n- Pre flight / Launch operations\n- Check out and Mission Operations\n- CA Follow up\n- Others\n		\N	\N	f	f	f	28	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
96	IssueCustomField	DOCUMENTATION	string	\N		\N	\N	f	f	f	91	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	RFA field	\N
99	IssueCustomField	Instrument / Unit	string	\N		\N	\N	f	f	t	46	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
45	IssueCustomField	Actions	list	---\n- Watch\n- Research\n- Accept\n- Mitigate\n		\N	\N	f	f	t	54	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	ACTION\r\nWatch This approach includes deciding not to take immediate action, but to track and monitor the trends and behavior of factors that could affect the risk assessment\r\nResearch This approach requires further study and collection of specific information to base future assessments and decisions pertaining to the risk.\r\nAccept Based on the judgment of the RMT and the PMs, the likelihood and consequences of a risk are such that the PMs elect to accept the risk (and its potential consequences) and no longer expend project resources on this risk.\r\nThe PM shall establish the criteria for accepting risk, document the rationale for accepting individual risks and include the signed formal acceptance within the risk acceptance records. One criteria for accepting risk is to have a documented, tested, and signed contingency or recovery plan in place to respond to the consequences of an accepted risk should that risk manifest itself as an undesired event.\r\nMitigate Risk mitigation may be achieved by applying methods aimed at eliminating the risk or reducing the likelihood and/or consequence of a risk. This may be accomplished through engineering, schedule, or budgetary changes to designs, processes, or procedures; or alternate paths and approaches.\r\n	\N
97	IssueCustomField	Scope of Request:   	list	---\n- Full\n- Partial\n		\N	\N	f	f	f	92	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: check_box\n		\N
98	IssueCustomField	Email Address	string	\N		\N	\N	f	f	f	93	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
37	IssueCustomField	WBS	string	\N		\N	\N	f	f	t	47	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	(01) Project Management\r\n(02) System Engineering\r\n(03) Safety and Mission Assurance\r\n(04) Application Segment	\N
38	IssueCustomField	Risk Impact	list	---\n- 5-Very High\n- 4-High\n- 3-Moderate\n- 2-Low\n- 1-Very low\n		\N	\N	f	f	t	48	t		t	t	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	Risk Impact: This column should be populated with the potential impact of the risk if it did become a project issue.  Valid options include the following and are defined as follows:	\N
103	IssueCustomField	Requesting Sys / Inst Manager	string	\N		\N	\N	f	f	f	97	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
142	IssueCustomField	Material Group ID	list	---\n- Anibal TBC\n		\N	\N	f	f	f	131	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
143	IssueCustomField	Commercial identification	string	\N		\N	\N	f	f	f	132	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	Commercial identification  standardized designation. 	\N
144	IssueCustomField	Chemical nature & product type	list	---\n- "(1) Chemical Nature"\n- "(2) Product Type"\n		\N	\N	f	f	f	133	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
145	IssueCustomField	Manufacturer / Supplier Name.	string	\N		\N	\N	f	f	f	134	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
146	IssueCustomField	Use & Location 	text	\N		\N	\N	f	f	f	135	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n		\N
100	IssueCustomField	Description & Type of Request	list	---\n- Waiver\n- Deviation\n		\N	\N	f	f	t	94	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
104	IssueCustomField	Applicable Requirement:	string	\N		\N	\N	f	f	f	98	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	Quote the specific requirement associated with the request.	\N
102	IssueCustomField	Requesting Subsystem Manager 	string	\N		\N	\N	f	f	f	96	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
147	IssueCustomField	Temperature Range	string	\N		\N	\N	f	f	f	136	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
148	IssueCustomField	Outgassing Level	string	\N		\N	\N	f	f	f	137	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
149	IssueCustomField	Flammability Resistance 	string	\N		\N	\N	f	f	f	138	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
150	IssueCustomField	Radiation Tolerance	string	\N		\N	\N	f	f	f	139	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n		\N
151	IssueCustomField	Projects where was used 	list	---\n- Anibal TC\n		\N	\N	f	f	f	140	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n		\N
\.


--
-- Data for Name: custom_fields_projects; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.custom_fields_projects (custom_field_id, project_id) FROM stdin;
1	2
2	2
3	2
4	2
5	2
6	2
8	2
9	2
10	2
12	2
13	2
14	2
15	2
16	2
17	2
18	2
19	2
20	2
21	2
22	2
23	2
25	2
26	2
11	2
7	2
75	2
76	4
97	7
98	7
99	7
30	7
66	7
68	7
7	7
10	7
22	7
100	7
101	7
102	7
103	7
104	7
9	7
6	7
34	44
83	44
84	44
85	44
86	44
87	44
88	44
89	44
90	44
91	44
92	44
93	44
94	44
95	44
96	44
82	44
105	44
6	6
1	6
11	6
38	6
44	6
72	6
77	6
78	6
79	6
80	6
81	6
106	6
107	6
108	6
42	6
28	6
39	6
40	6
41	6
45	6
46	6
4	39
60	39
59	39
58	39
110	1
110	5
110	7
56	1
50	1
51	1
52	1
54	1
53	1
55	1
61	1
111	1
112	1
113	1
114	1
115	1
116	1
117	1
118	1
119	1
120	1
123	1
124	1
128	1
129	1
130	1
131	1
132	1
111	45
112	45
113	45
114	45
115	45
116	45
117	45
118	45
119	45
120	45
123	45
124	45
128	45
129	45
131	45
132	45
133	1
133	46
132	46
5	46
134	1
134	46
135	1
135	46
4	46
136	1
136	46
137	1
137	46
138	1
138	46
139	46
140	1
140	46
141	1
141	46
31	1
31	43
31	5
33	1
33	43
33	5
37	1
37	43
37	5
35	1
35	43
35	5
142	47
143	47
144	47
145	47
146	47
147	47
148	47
149	47
35	47
150	47
151	47
152	47
153	47
154	47
155	47
156	47
157	47
158	47
159	48
1	48
35	48
1	49
37	49
35	49
164	49
165	49
166	49
164	50
164	51
164	52
164	53
164	54
164	55
164	56
164	57
164	58
164	59
164	60
164	61
164	62
164	63
164	64
164	65
164	67
164	66
164	68
164	69
164	70
165	50
165	51
165	52
165	53
165	54
165	55
165	56
165	57
165	58
165	59
165	60
165	61
165	62
165	63
165	64
165	65
165	67
165	66
165	68
165	69
165	70
166	50
166	51
166	52
166	53
166	54
166	55
166	56
166	57
166	58
166	59
166	60
166	61
166	62
166	63
166	64
166	65
166	67
166	66
166	68
166	69
166	70
164	83
164	84
164	85
164	71
164	72
164	73
164	74
164	87
164	75
164	76
164	77
164	78
164	79
164	80
164	81
164	82
164	86
165	83
165	84
165	85
165	71
165	72
165	73
165	74
165	87
165	75
165	76
165	77
165	78
165	79
165	80
165	81
165	82
165	86
166	83
166	84
166	85
166	71
166	72
166	73
166	74
166	87
166	75
166	76
166	77
166	78
166	79
166	80
166	81
166	82
166	86
169	17
170	43
30	45
130	45
4	47
\.


--
-- Data for Name: custom_fields_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.custom_fields_roles (custom_field_id, role_id) FROM stdin;
\.


--
-- Data for Name: custom_fields_trackers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.custom_fields_trackers (custom_field_id, tracker_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
25	1
26	1
1	2
2	2
3	2
4	2
5	2
26	2
27	2
29	2
28	2
30	2
31	3
1	3
32	3
33	3
34	3
35	3
36	3
37	3
1	4
6	4
11	4
27	4
28	4
38	4
39	4
40	4
41	4
42	4
44	4
45	4
46	4
62	2
61	2
35	2
1	5
2	5
3	5
30	5
63	5
67	5
68	5
4	5
28	5
26	6
30	6
62	6
63	6
64	6
65	6
66	6
69	6
71	6
6	7
1	7
2	7
3	7
26	7
30	7
68	7
4	7
5	7
70	7
7	7
9	7
28	7
4	9
60	9
59	9
58	9
57	9
4	10
60	10
59	10
57	10
61	11
56	11
55	11
54	11
53	11
52	11
51	11
50	11
75	1
75	12
76	12
13	10
6	13
11	13
20	13
44	13
72	13
77	13
78	13
79	13
80	13
1	13
81	13
82	14
82	15
83	14
83	15
84	14
84	15
85	14
85	15
86	14
86	15
87	14
87	15
88	14
88	15
89	14
89	15
90	14
90	15
91	14
92	14
93	14
94	15
95	15
34	15
96	15
97	7
98	7
99	7
100	7
101	7
102	7
103	7
104	7
105	15
106	13
107	13
108	13
72	4
110	7
111	16
30	16
112	16
113	16
114	16
115	16
116	16
117	16
118	16
119	16
120	16
123	16
124	16
128	16
129	16
130	16
131	16
132	16
133	17
5	17
132	17
134	17
135	17
4	17
136	16
136	17
137	17
138	17
139	17
140	17
141	17
142	18
143	18
144	18
143	20
145	18
145	20
4	18
4	19
4	20
146	18
146	20
147	18
149	18
35	18
35	19
35	20
150	18
151	18
151	19
151	20
152	18
153	17
153	18
153	19
152	20
154	20
157	19
156	19
155	19
158	19
1	21
7	21
51	21
96	21
159	21
1	22
37	22
164	22
165	22
166	22
35	22
169	2
170	3
148	18
\.


--
-- Data for Name: custom_values; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.custom_values (id, customized_type, customized_id, custom_field_id, value) FROM stdin;
8045	Issue	336	5	
8046	Issue	336	6	\N
8047	Issue	336	8	
8050	Issue	336	12	
8051	Issue	336	13	
8052	Issue	336	14	
8054	Issue	336	16	
8055	Issue	336	17	
8056	Issue	336	18	
8057	Issue	336	19	
8058	Issue	336	20	
8060	Issue	336	22	
8061	Issue	336	23	
8063	Issue	336	25	
8041	Issue	336	1	Separación entre diodos y resistores insuficiente para Workmanship
8042	Issue	336	2	Minor
8043	Issue	336	3	None
8044	Issue	336	4	None
8048	Issue	336	9	SBM-OBC-NC-00090
8049	Issue	336	10	2021-07-12
8053	Issue	336	15	No
8059	Issue	336	21	No
8064	Issue	336	26	None
8069	Issue	337	5	
8070	Issue	337	6	\N
8071	Issue	337	8	
8074	Issue	337	12	
8075	Issue	337	13	
8076	Issue	337	14	
8078	Issue	337	16	
8080	Issue	337	18	
8081	Issue	337	19	
8084	Issue	337	22	
8085	Issue	337	23	
8087	Issue	337	25	
8065	Issue	337	1	Solicitud modificación radios 0,38 mm a 0,5mm en A1002605 A1002712
8066	Issue	337	2	Minor
8067	Issue	337	3	None
8068	Issue	337	4	None
8072	Issue	337	9	SBM-OBC-NC-00089
8073	Issue	337	10	2021-07-08
8077	Issue	337	15	No
8079	Issue	337	17	Rework / Redo / Return to Supplier
8082	Issue	337	20	La modificación es aprobada, se actualizan los planos y modelos 3D de las piezas involucradas. Códigos de documentos actualizados: • SBM-OBC-DR-00012-C Long side cover A (connectors) A1002605 • SBM-OBC-DR-00055-B MGSE - Side cover (A1002712). • SBM-OBC-MD-00011-E Housing PM-OBC A1002600. • SBM-OBC-MD-00017-B MGSE - Side cover (A1002712).
8083	Issue	337	21	No
8088	Issue	337	26	None
8093	Issue	338	5	
8094	Issue	338	6	\N
8095	Issue	338	8	
8098	Issue	338	12	
8099	Issue	338	13	
8100	Issue	338	14	
8102	Issue	338	16	
8103	Issue	338	17	
8104	Issue	338	18	
8105	Issue	338	19	
8108	Issue	338	22	
8109	Issue	338	23	
8111	Issue	338	25	
8089	Issue	338	1	Revisión VHDL placa IAB EM
8090	Issue	338	2	Minor
8091	Issue	338	3	None
8092	Issue	338	4	None
8096	Issue	338	9	SBM-OBC-NC-00088
8097	Issue	338	10	2021-06-11
8101	Issue	338	15	No
8106	Issue	338	20	MoM 20210610 Emtech presentó las novedades respecto a la revisión del paquete de documentación sobre el VHDL de la placa IAB proveniente de STI y mostró el reporte preliminar.    - Se observan librerías y bloques repetidos con distinto contenido, incluyendo el config.vhd. - Se indica que hay testbenchs que no se pueden ejecutar por error en la comunicación PCI. Esto es bloqueante y no permite verificar los requerimientos asociados. - Dentro de la actualización del código se piensa reutilizar un bloque "Slave PPS" en la IAB, proveniente de la SBC. Se analizó y es posible reutilizarlo.  AI: Definir cómo se va a identificar el Core de IAB, de manera univoca. Ver cuáles son los registros de versión que se usarían para los cores. AI: (Definir) Encontraron un diferencia en el Clock MHz contra 33.33MHz contra 33MHz AI: (Revisar) Instanciaciones condicionales para líneas GPIO AI: (Definir) Pines no utilizados: estaban conectados a GND, en el código está comentada esa parte. Definir si por cuestiones de radiación conviene que los pines estén sin conexión. AI: (Revisar) Verificar si el diseñador modificó las bibliotecas de grlib. AI: Por parte de CONAE o VENG buscar si hay una versión más nueva.      (CERRADO: Se revisó la documentación disponible en el ftp y es la misma que se le entregó a Emtech). AI: Emtech va a mandar el reporte de revisión con una tabla que muestra si los requerimientos se cumplen o se pudieron testear.  (CERRADO: Enviado el 11/06/21 incluyendo tabla de verificación)
8107	Issue	338	21	No
8112	Issue	338	26	None
8117	Issue	339	5	
8118	Issue	339	6	\N
8119	Issue	339	8	
8122	Issue	339	12	
8123	Issue	339	13	
8124	Issue	339	14	
8126	Issue	339	16	
8128	Issue	339	18	
8129	Issue	339	19	
8132	Issue	339	22	
8133	Issue	339	23	
8135	Issue	339	25	
10970	DmsfFolder	1	48	
8113	Issue	339	1	faltante de componente en bolsa de kitting
8114	Issue	339	2	Minor
8115	Issue	339	3	None
8116	Issue	339	4	None
8120	Issue	339	9	SBM-OBC-NC-00087
8121	Issue	339	10	2021-07-01
8125	Issue	339	15	No
8127	Issue	339	17	Rework / Redo / Return to Supplier
8130	Issue	339	20	Se dispone solicitar a personal de storaje un diodo ANTXV1N755AUR para reemplazar el faltante en la bolsa de kiting
8131	Issue	339	21	No
10971	DmsfFolder	1	49	
10973	DmsfFolder	2	48	
10974	DmsfFolder	2	49	
10976	DmsfFolder	3	48	
10977	DmsfFolder	3	49	
8136	Issue	339	26	None
8141	Issue	340	5	
8142	Issue	340	6	\N
8143	Issue	340	8	
8146	Issue	340	12	
8147	Issue	340	13	
8148	Issue	340	14	
8150	Issue	340	16	
8152	Issue	340	18	
8153	Issue	340	19	
8156	Issue	340	22	
8157	Issue	340	23	
8159	Issue	340	25	
8137	Issue	340	1	daño en top de componente con punta del soldador
8138	Issue	340	2	Minor
8139	Issue	340	3	None
8140	Issue	340	4	None
8144	Issue	340	9	SBM-OBC-NC-00085
8145	Issue	340	10	2021-06-10
8149	Issue	340	15	No
8151	Issue	340	17	Rework / Redo / Return to Supplier
8154	Issue	340	20	Se decide reemplazar por componentes del stock de repuestos.
8155	Issue	340	21	No
8160	Issue	340	26	None
8165	Issue	341	5	
8166	Issue	341	6	\N
8167	Issue	341	8	
8170	Issue	341	12	
8171	Issue	341	13	
8172	Issue	341	14	
8174	Issue	341	16	
8175	Issue	341	17	
8176	Issue	341	18	
8177	Issue	341	19	
8178	Issue	341	20	
8180	Issue	341	22	
8181	Issue	341	23	
8183	Issue	341	25	
8161	Issue	341	1	Componentes soldados no indicados para su integración
8162	Issue	341	2	Minor
8163	Issue	341	3	None
8164	Issue	341	4	None
8168	Issue	341	9	SBM-OBC-NC-00084
8169	Issue	341	10	2021-05-14
8173	Issue	341	15	No
8179	Issue	341	21	No
8184	Issue	341	26	None
8189	Issue	342	5	
8190	Issue	342	6	\N
8191	Issue	342	8	
8194	Issue	342	12	
8195	Issue	342	13	
8196	Issue	342	14	
8198	Issue	342	16	
8200	Issue	342	18	
8201	Issue	342	19	
8204	Issue	342	22	
8205	Issue	342	23	
8207	Issue	342	25	
8185	Issue	342	1	Se pierde componente (resistor) en mesa de integración
8186	Issue	342	2	Minor
8187	Issue	342	3	None
8188	Issue	342	4	None
8192	Issue	342	9	SBM-OBC-NC-00083
8193	Issue	342	10	2021-05-28
8197	Issue	342	15	No
8199	Issue	342	17	Rework / Redo / Return to Supplier
8202	Issue	342	20	se solicita un componente de reemplazo a personal de storage
8203	Issue	342	21	No
8208	Issue	342	26	None
8213	Issue	343	5	
8214	Issue	343	6	\N
8215	Issue	343	8	
8218	Issue	343	12	
8219	Issue	343	13	
8220	Issue	343	14	
8222	Issue	343	16	
8224	Issue	343	18	
8225	Issue	343	19	
8228	Issue	343	22	
8229	Issue	343	23	
8231	Issue	343	25	
8209	Issue	343	1	Falta componente en bolsa de kitting
8210	Issue	343	2	Minor
8211	Issue	343	3	None
8212	Issue	343	4	None
8216	Issue	343	9	SBM-OBC-NC-00082
8217	Issue	343	10	2021-05-27
8221	Issue	343	15	No
8223	Issue	343	17	Use as is / Continue / Accept
8226	Issue	343	20	se solicita al personal de storage que provea los componentes faltantes
8227	Issue	343	21	No
8232	Issue	343	26	None
8237	Issue	344	5	
8238	Issue	344	6	\N
8239	Issue	344	8	
8242	Issue	344	12	
8243	Issue	344	13	
8244	Issue	344	14	
8246	Issue	344	16	
8248	Issue	344	18	
8249	Issue	344	19	
8252	Issue	344	22	
8253	Issue	344	23	
8255	Issue	344	25	
8233	Issue	344	1	componente no desdorado en la etapa de integracion
8234	Issue	344	2	Minor
8235	Issue	344	3	None
8236	Issue	344	4	None
8240	Issue	344	9	SBM-OBC-NC-00081
8241	Issue	344	10	2021-05-19
8245	Issue	344	15	No
8247	Issue	344	17	Rework / Redo / Return to Supplier
8250	Issue	344	20	se retitra el componente ya que no se encontraba soldado ,para el pre estañado del mismo.
8251	Issue	344	21	No
8256	Issue	344	26	None
10979	DmsfFileRevision	1	48	
10980	DmsfFileRevision	1	49	
10982	DmsfFolder	4	48	
10983	DmsfFolder	4	49	
10985	DmsfFileRevision	2	48	
10986	DmsfFileRevision	2	49	
8261	Issue	345	5	
8262	Issue	345	6	\N
8263	Issue	345	8	
8266	Issue	345	12	
8267	Issue	345	13	
8268	Issue	345	14	
8270	Issue	345	16	
8272	Issue	345	18	
8273	Issue	345	19	
8276	Issue	345	22	
8277	Issue	345	23	
8279	Issue	345	25	
8257	Issue	345	1	Componentes soldados no indicados para su integracion
8258	Issue	345	2	Minor
8259	Issue	345	3	None
8260	Issue	345	4	None
8264	Issue	345	9	SBM-OBC-NC-00080
8265	Issue	345	10	2021-05-14
8269	Issue	345	15	No
8271	Issue	345	17	Use as is / Continue / Accept
8274	Issue	345	20	se dejan integrados los compoentes en la placa ya que analizada la situación en conjunto con el operador + calidad se determina que no afecta el flujo de integración que estos componentes esten poblados en este punto.  Hubo error de interpretación, la imagen con al que cuenta el instructivo tenia estos componentes en su totalidad y no solamente los indicados por el instructivo de integración . El documento indica de todas maneras que las imagenes soin representativas que se debe respetar lo solicitado en el paso.
8275	Issue	345	21	No
8280	Issue	345	26	None
8285	Issue	346	5	
8286	Issue	346	6	\N
8287	Issue	346	8	
8290	Issue	346	12	
8291	Issue	346	13	
8292	Issue	346	14	
8294	Issue	346	16	
8295	Issue	346	17	
8296	Issue	346	18	
8297	Issue	346	19	
8298	Issue	346	20	
8300	Issue	346	22	
8301	Issue	346	23	
8303	Issue	346	25	
8281	Issue	346	1	Conectores  cuyos algunos  pines no pasan  al lado bottom
8282	Issue	346	2	Minor
8283	Issue	346	3	None
8284	Issue	346	4	None
8288	Issue	346	9	SBM-OBC-NC-00079
8289	Issue	346	10	2021-05-12
8293	Issue	346	15	No
8299	Issue	346	21	No
8304	Issue	346	26	None
8309	Issue	347	5	
8310	Issue	347	6	\N
8311	Issue	347	8	
8314	Issue	347	12	
8315	Issue	347	13	
8316	Issue	347	14	
8318	Issue	347	16	
8320	Issue	347	18	
8321	Issue	347	19	
8324	Issue	347	22	
8325	Issue	347	23	
8327	Issue	347	25	
8305	Issue	347	1	Componente dañado previo a la integracion
8306	Issue	347	2	Minor
8307	Issue	347	3	None
8308	Issue	347	4	None
8312	Issue	347	9	SBM-OBC-NC-00078
8313	Issue	347	10	2021-05-12
8317	Issue	347	15	No
8319	Issue	347	17	Scrap / Dismiss / Abort
8322	Issue	347	20	 se cambia el conector por uno nuevo, este se solicita al area de storage.el componente presenta una deformación aparentemente de origen
8323	Issue	347	21	No
8328	Issue	347	26	None
8333	Issue	348	5	
8334	Issue	348	6	\N
8335	Issue	348	8	
8338	Issue	348	12	
8339	Issue	348	13	
8340	Issue	348	14	
8342	Issue	348	16	
8344	Issue	348	18	
8345	Issue	348	19	
8346	Issue	348	20	
8348	Issue	348	22	
8349	Issue	348	23	
8351	Issue	348	25	
8329	Issue	348	1	 Componente integrado no indicado para integracion en la etapa
8330	Issue	348	2	Minor
8331	Issue	348	3	None
8332	Issue	348	4	None
8336	Issue	348	9	SBM-OBC-NC-00077
8337	Issue	348	10	2021-05-12
8341	Issue	348	15	No
8343	Issue	348	17	Rework / Redo / Return to Supplier
8347	Issue	348	21	No
8352	Issue	348	26	None
8357	Issue	349	5	
8358	Issue	349	6	\N
8359	Issue	349	8	
8362	Issue	349	12	
8363	Issue	349	13	
8364	Issue	349	14	
8366	Issue	349	16	
8368	Issue	349	18	
8369	Issue	349	19	
10988	DmsfFolder	5	48	
10989	DmsfFolder	5	49	
8372	Issue	349	22	
8373	Issue	349	23	
10991	DmsfFolder	6	48	
8353	Issue	349	1	 Componentes sobrantes en paso de integracion TAB EM
8354	Issue	349	2	Minor
8355	Issue	349	3	None
8356	Issue	349	4	None
8360	Issue	349	9	SBM-OBC-NC-00076
8361	Issue	349	10	2021-06-15
8365	Issue	349	15	No
8367	Issue	349	17	Scrap / Dismiss / Abort
10992	DmsfFolder	6	49	
10994	DmsfFolder	7	48	
10995	DmsfFolder	7	49	
10997	DmsfFolder	8	48	
8370	Issue	349	20	Devolver a stock e informar al responsable de hacer el Kitting. Se controla el valor de los componentes y se devuelven a stock.
8371	Issue	349	21	No
8375	Issue	349	25	EM
8376	Issue	349	26	None
8381	Issue	350	5	
8382	Issue	350	6	\N
8383	Issue	350	8	
8386	Issue	350	12	
8387	Issue	350	13	
8388	Issue	350	14	
8390	Issue	350	16	
8392	Issue	350	18	
8393	Issue	350	19	
8396	Issue	350	22	
8397	Issue	350	23	
8399	Issue	350	25	
8377	Issue	350	1	Diferencias en terminación de soldadura en el nuevo lote de FLUX DELTA
8378	Issue	350	2	Minor
8379	Issue	350	3	None
8380	Issue	350	4	None
8384	Issue	350	9	SBM-OBC-NC-00075
8385	Issue	350	10	2021-06-14
8389	Issue	350	15	No
8391	Issue	350	17	Rework / Redo / Return to Supplier
8394	Issue	350	20	 NRB 15/06/2021: Participantes: M.Ferrer, N.Atencio, M.Toledo, D.Prato, L.Minetti, M.Alvarez Bocco,   A.I. 1) Identificar en detalle en la documentación de compra y si llegaron certificados, el tipo de flux comprado (inf. técnica) realizando la comparativa, si es posible, con el mismo flux que se utilizó en SAOCOM (M.Campos)   22/06/2021: D.Prato informa por mail:  1. Melania me pasó copia de la orden de compra por caja chica que se hizo con respecto al último lote de flux, la adjunto en este correo, de allí se deduce claramente que el vendedor no recibe exigencias de detalles del tipo de flux, características técnicas, certificados, etc. Esto se debe a que directamente ellos trabajan con un solo tipo de Flux y no tienen un mecanismo de trazabilidad montado para ofrecernos tal información. 2. Envié una consulta al vendedor con una foto comparativa del lote de flux anterior y el actual donde se puede ver claramente la diferencia de coloración. El Lote 11764 es el actual y el 9870 es el que se compró para SAOCOM.                                                      3. El vendedor responde lo siguiente:   El producto flux a granel lo comercializamos hace muchos años que se comercializa en el rubro electrónico y no hemos tenido devoluciones   El producto es una mezcla de resina colofonia y alcohol isopropilico, y la resina que se compra es la que hay en el mercado, nunca hubo 2 partidas con el mismo color, con respecto a la densidad, el material que compraron en la vez anterior data de 2017 por lo que es muy probable que el alcohol vaya migrando (evaporándose)y a la fecha sea un producto más viscoso   Lo que les ofrezco es que me traigan el material y se les hace una formula algo mas viscosa, solo por única vez              Jorge  En la respuesta se evidencia claramente que el flux que estamos comprando es efectivamente ROL 0, ya que solo consiste de Resina Colofonia y alcohol Isopropílico, y también queda claro que no pueden mantener una constancia en la fórmula química ya que dependen de la materia prima disponible en el mercado.    A.I.2) Segregar identificándolo con el número de NC a este lote nuevo de flux comprado hasta que se defina esta NC (M.Campos)    A.I. 3) EN ámbito de SABIA-Mar hacer prueba de soldadura en la placa GPIO EM 2 etapa con la botella de flux de este lote nuevo entregado, que solamente se utilizó para preestañado, tarea en la cual no se detectaron anomalías en el proceso. ( M.Toledo)   22/06/2021: Se hicieron además las pruebas de soldadura probando ambos FLUX, donde se detecta claramente que el acabado utilizando el LOTE 9870 es más brillante, menos poroso y más facil de trabajar:  a) Componente trabajado con FLUX de LOTE: 9870                                           b)  Mismo tipo de componente trabajado con FLUX LOTE: 11764                                                                     A.I.4) Identificar condiciones previas de almacenamiento que tuvo este envío del flux hasta el ingreso al LIE.  (M.Campos)    NRB 23/06/2021  Propuestas a tratar  • Buscar un proveedor en el exterior que esté habituado a trabajar con empresas aeroespaciales, teniendo en cuenta la demora que esto genera debido a las restricciones en la importación de este tipo de elementos inflamables, etc. • Proponer a DELTA nos prepare un lote certificado con las mismas proporciones del FLUX que ya teníamos contratando ellos mismo a un laboratorio que nos entregue un histograma de los componentes de la solución. • Hacer una validación y certificación interna del FLUX que ya tenemos ya que nos quedan más de 7 litros y tenemos dentro de la empresa facilidades donde se podría emitir tal certificación.
8395	Issue	350	21	No
8400	Issue	350	26	None
8405	Issue	351	5	
8406	Issue	351	6	\N
8407	Issue	351	8	
8410	Issue	351	12	
8411	Issue	351	13	
8412	Issue	351	14	
8414	Issue	351	16	
8416	Issue	351	18	
8417	Issue	351	19	
8420	Issue	351	22	
8421	Issue	351	23	
8423	Issue	351	25	
8401	Issue	351	1	Cambio radio de empalme pieza A1002632 A1002697
8402	Issue	351	2	Minor
8403	Issue	351	3	None
8404	Issue	351	4	None
8408	Issue	351	9	SBM-OBC-NC-00074
8409	Issue	351	10	2021-06-11
8413	Issue	351	15	No
8415	Issue	351	17	Rework / Redo / Return to Supplier
8418	Issue	351	20	La modificación es aprobada, se actualizan los planos y modelos de las piezas involucras. Códigos de las piezas ya actualizados:  • SBM-OBC-DR-00014-C Long side cover B (power box) A1002632. • SBM-OBC-DR-00018-C Power box panel A1002697. • SBM-OBC-MD-00011-D Housing PM-OBC A1002600.
8419	Issue	351	21	No
8424	Issue	351	26	None
8429	Issue	352	5	
8430	Issue	352	6	\N
8431	Issue	352	8	
8434	Issue	352	12	
8435	Issue	352	13	
8436	Issue	352	14	
8438	Issue	352	16	
8440	Issue	352	18	
8441	Issue	352	19	
8444	Issue	352	22	
8445	Issue	352	23	
8447	Issue	352	25	
8425	Issue	352	1	 falta de información en plano pieza A1002643 y A1002604 - HOUSING PM-OBC
8426	Issue	352	2	Minor
8427	Issue	352	3	None
8428	Issue	352	4	None
8432	Issue	352	9	SBM-OBC-NC-00073
8433	Issue	352	10	2021-06-07
8437	Issue	352	15	No
8439	Issue	352	17	Rework / Redo / Return to Supplier
8442	Issue	352	20	Se actualizan los planos completando la información faltante, se liberaran ambos en versión B:  • SBM-OBC-DR-00015-B Central column A1002643. • SBM-OBC-DR-00011-B Slotted column A1002604.
8443	Issue	352	21	No
8448	Issue	352	26	None
8453	Issue	353	5	
8454	Issue	353	6	\N
8455	Issue	353	8	
8458	Issue	353	12	
8459	Issue	353	13	
8460	Issue	353	14	
8462	Issue	353	16	
8464	Issue	353	18	
8465	Issue	353	19	
8468	Issue	353	22	
8469	Issue	353	23	
8449	Issue	353	1	 modificación perforaciones pieza A1002632 - HOUSING PM OBC
8450	Issue	353	2	Minor
8451	Issue	353	3	None
8452	Issue	353	4	None
8456	Issue	353	9	SBM-OBC-NC-00072
8457	Issue	353	10	2021-06-03
8461	Issue	353	15	No
8463	Issue	353	17	Rework / Redo / Return to Supplier
8466	Issue	353	20	Se modifica en modelo 3D por lo indicado en el punto 2 y se actualiza el plano de la pieza A1002632 por lo mencionado en el punto 1 y 2 enviando la documentación actualizada al área de fabricaciones.  Códigos actualizados:  • SBM-OBC-DR-0014-B Long side cover B (power box) A1002632. • SBM-OBC-MD-00011-C Housing PM-OBC A1002600.
8467	Issue	353	21	No
10998	DmsfFolder	8	49	
11000	DmsfFileRevision	3	48	
11001	DmsfFileRevision	3	49	
11003	DmsfFolder	9	48	
11004	DmsfFolder	9	49	
11006	DmsfFileRevision	4	48	
11007	DmsfFileRevision	4	49	
11009	DmsfFolder	10	48	
11010	DmsfFolder	10	49	
11012	DmsfFolder	11	48	
11013	DmsfFolder	11	49	
11015	DmsfFolder	12	48	
11016	DmsfFolder	12	49	
8471	Issue	353	25	
8472	Issue	353	26	None
8477	Issue	354	5	
8478	Issue	354	6	\N
8479	Issue	354	8	
8482	Issue	354	12	
8483	Issue	354	13	
8484	Issue	354	14	
8486	Issue	354	16	
8487	Issue	354	17	
8488	Issue	354	18	
8489	Issue	354	19	
8490	Issue	354	20	
8492	Issue	354	22	
8493	Issue	354	23	
8495	Issue	354	25	
8473	Issue	354	1	DIFERENCIA DIMENSIONAL EN PIEZAS DEL HOUSING
8474	Issue	354	2	Minor
8475	Issue	354	3	None
8476	Issue	354	4	None
8480	Issue	354	9	SBM-OBC-NC-00069
8481	Issue	354	10	2021-05-21
8485	Issue	354	15	No
8491	Issue	354	21	No
8496	Issue	354	26	None
8501	Issue	355	5	
8503	Issue	355	8	
8506	Issue	355	12	
8507	Issue	355	13	
8508	Issue	355	14	
8510	Issue	355	16	
8511	Issue	355	17	
8512	Issue	355	18	
8513	Issue	355	19	
8516	Issue	355	22	
8517	Issue	355	23	
8519	Issue	355	25	
8497	Issue	355	1	No se pudo acceder al GRMON - el UT699 no responde
8498	Issue	355	2	Minor
8499	Issue	355	3	None
8500	Issue	355	4	None
8502	Issue	355	6	
8504	Issue	355	9	SBM-OBC-NC-00067
8505	Issue	355	10	2019-07-26
8509	Issue	355	15	No
8514	Issue	355	20	Se analiza la informacion del UT699 y se determina que es comportamiento normal del UT699 ya que solo ingresa en modo debug en ciertas condiciones (ver adjunto) por lo que deberia ser imposible acceder a los registros del UT699 y no esta claro el proceso y el mensaje de error que se obtuvieron. Para acceder se deberia presionar el boton Break y luego acceder desde el GRMon pero con las opciones que evita escritura de registros de configuracion ya que el UT699 ya tiene un software cargado (el bootloader) Se modifica la Consola agregando la opcion de generar un Break Now para poder detener al UT699 desde la consola y no desde un boton (el FM no tendra botones)  NRB 03/05/2021: CONAE: A.Alvarez, D.Fernandez, G.Gonzalez y VENG:  E.kunysz, A.Perez, N.Balbi, M.Alvarez Bocco. Se revisa la AC19 y la solución propuesta. Se explica que ya existe ya una solución propuesta e implementada en relación a esta anomalía por la cual se dejó disponible un Header de dos posiciones en reemplazo del botón DSU_BREAK S1A para el modelo de vuelo. Esto permite agregar de manera provisoria un botón externo para acceder al Break en caso de repetirse el problema que dio origen a esta AC. La propuesta presentada durante la reunión plantea, adicionalmente, una modificación en el PCB para disponer de estas señales sobre el puerto de servicio de la SBC. Por otro lado, se plantea que, para cuando se trabaje sobre el modelo de vuelo, la causa raíz de este problema debería ya ser clara. Adicionalmente, la manera de operar la PMOBC en esa instancia, debería ser tal que no permitiría corromper accidentalmente el  bootloader por estar desactivadas las señales de escritura de las EEPROM. En cuanto a la modificación del PCB, se plantea que rutear la señal de DSU_BREAK es relativamente simple pero que aún es necesario analizar qué hacer con el botón de RESET. Es necesario operar también esta señal para recuperar el UT699 aunque aún no se sabe si se requiere accionar directamente o si puede lograrse el mismo efecto con un “Power off/on” reset. Dado los riesgos de modificar el PCB y las limitaciónes de cronograma, se acuerda analizar con mayor detalle la relación riesgo/beneficio de implementar la modificación teniendo en consideración los puntos mencionados anteriormente. Para esto, debe terminar de definirse que hacer con respecto a la señal de RESET y, en caso de ser necesario rutearla hasta el puerto de servicio, evaluar la complejidad de la modificación. En cuanto al beneficio, debe tenerse en cuenta el modo de operación sobre el FM para verificar que existe el riesgo de corromper el bootloader y necesitar esta funcionalidad para recuperar al procesador. Adicionalmente, se comentó sobre la presencia de señales de 5V sobre pines de la FPGA (3.3V). Se ve necesidad de revisar este punto. Por lo conversado durante la reunión, la FPGA seria tolerante a estos niveles de 5V.  Acciones + VENG: analizar relación costo beneficio en la modificación en el PCB para disponer del BREAK y RESET en el puerto de servicio de la SBC.  • Definir si es necesario rutear también la señal de RESET. • Analizar la complejidad de la modificación a realizar (habiendo definido el punto anterior) • Evaluar los beneficios de disponer de esta funcionalidad siendo que la operación sobre el modelo de vuelo estaría libre del riesgo de corromper el bootloader.  + VENG: definir si es necesario hacer alguna modificación en el PCB respecto a las señales de 5V que están llegando a la FPGA.
8515	Issue	355	21	No
8520	Issue	355	26	None
8525	Issue	356	5	
8526	Issue	356	6	\N
8527	Issue	356	8	
8530	Issue	356	12	
8531	Issue	356	13	
8532	Issue	356	14	
8534	Issue	356	16	
8536	Issue	356	18	
8537	Issue	356	19	
8540	Issue	356	22	
8541	Issue	356	23	
8543	Issue	356	25	
8521	Issue	356	1	Errores  procedimiento de Bring up
8522	Issue	356	2	Minor
8523	Issue	356	3	None
8524	Issue	356	4	None
8528	Issue	356	9	SBM-OBC-NC-00065
8529	Issue	356	10	2021-04-28
8533	Issue	356	15	No
8535	Issue	356	17	Rework / Redo / Return to Supplier
8538	Issue	356	20	1) Se quita el resistor  conectado al retorno de la Fuente de 5V, para evitar forma un loop de corrientes en ground.  2) Se altera la secuencia de pasos.  NRB 03/05/2021 (A.Perez – M.Alvarez Bocco) Se define que deba actualizarse el procedimiento SBM-OBC-TP-00020-A IAB EM Power Bring-Up Test Procedure
8539	Issue	356	21	No
8544	Issue	356	26	None
8549	Issue	357	5	
8550	Issue	357	6	\N
8551	Issue	357	8	
8554	Issue	357	12	
8555	Issue	357	13	
8556	Issue	357	14	
8558	Issue	357	16	
8560	Issue	357	18	
8561	Issue	357	19	
8564	Issue	357	22	
8565	Issue	357	23	
8567	Issue	357	25	
8545	Issue	357	1	Resistor se cae al piso previo a ser integrado al PCB
8546	Issue	357	2	Minor
8547	Issue	357	3	None
8548	Issue	357	4	None
8552	Issue	357	9	SBM-OBC-NC-00063
8553	Issue	357	10	2021-04-14
8557	Issue	357	15	No
8559	Issue	357	17	Scrap / Dismiss / Abort
8562	Issue	357	20	se repone la resistencia por una nueva, provista por personal de storage.
8563	Issue	357	21	No
8568	Issue	357	26	None
8573	Issue	358	5	
8574	Issue	358	6	\N
8575	Issue	358	8	
8578	Issue	358	12	
8579	Issue	358	13	
8580	Issue	358	14	
8582	Issue	358	16	
8584	Issue	358	18	
8585	Issue	358	19	
11018	DmsfFolder	13	48	
11019	DmsfFolder	13	49	
8588	Issue	358	22	
8589	Issue	358	23	
8591	Issue	358	25	
11021	DmsfFolder	14	48	
8569	Issue	358	1	Error en cantidad de componentes dentro de la bolsa del kitting
8570	Issue	358	2	Minor
8571	Issue	358	3	None
8572	Issue	358	4	None
8576	Issue	358	9	SBM-OBC-NC-00061
8577	Issue	358	10	2021-04-12
8581	Issue	358	15	No
8583	Issue	358	17	Use as is / Continue / Accept
8587	Issue	358	21	No
11022	DmsfFolder	14	49	
11024	DmsfFolder	15	48	
11025	DmsfFolder	15	49	
8586	Issue	358	20	Se solicita a personal de storage completar el faltante, para tener el total solicitado por el procedimiento de integración
8592	Issue	358	26	None
8597	Issue	359	5	
8598	Issue	359	6	\N
8599	Issue	359	8	
8602	Issue	359	12	
8603	Issue	359	13	
8604	Issue	359	14	
8606	Issue	359	16	
8608	Issue	359	18	
8609	Issue	359	19	
8612	Issue	359	22	
8613	Issue	359	23	
8615	Issue	359	25	
8593	Issue	359	1	Resistencia con marca en pintura de la parte superior.
8594	Issue	359	2	Minor
8595	Issue	359	3	None
8596	Issue	359	4	None
8600	Issue	359	9	SBM-OBC-NC-00058
8601	Issue	359	10	2021-04-20
8605	Issue	359	15	No
8607	Issue	359	17	Scrap / Dismiss / Abort
8610	Issue	359	20	Se repone el componente por uno nuevo, provisto por storage
8611	Issue	359	21	No
8616	Issue	359	26	None
8621	Issue	360	5	
8622	Issue	360	6	\N
8623	Issue	360	8	
8626	Issue	360	12	
8627	Issue	360	13	
8628	Issue	360	14	
8630	Issue	360	16	
8632	Issue	360	18	
8633	Issue	360	19	
8636	Issue	360	22	
8637	Issue	360	23	
8639	Issue	360	25	
8617	Issue	360	1	Integracion de resistor en designador indicado como no integrar
8618	Issue	360	2	Minor
8619	Issue	360	3	None
8620	Issue	360	4	None
8624	Issue	360	9	SBM-OBC-NC-00057
8625	Issue	360	10	2021-04-09
8629	Issue	360	15	No
8631	Issue	360	17	Use as is / Continue / Accept
8634	Issue	360	20	se dispone dejar soldadas las resistencias anteriormente mencionadas, ya que en la proxima etapa de integracion van integradas y en este punto no interfieren con el resto de pasos de integracion. Reunirse con los operadores para tener feedback de porque la cpnfusion y poder mejorar el proceso
8635	Issue	360	21	No
8640	Issue	360	26	None
8645	Issue	361	5	
8646	Issue	361	6	\N
8647	Issue	361	8	
8650	Issue	361	12	
8651	Issue	361	13	
8652	Issue	361	14	
8654	Issue	361	16	
8656	Issue	361	18	
8657	Issue	361	19	
8660	Issue	361	22	
8661	Issue	361	23	
8663	Issue	361	25	
8641	Issue	361	1	Integracion de resistor en designador indicado como no integrar
8642	Issue	361	2	Minor
8643	Issue	361	3	None
8644	Issue	361	4	None
8648	Issue	361	9	SBM-OBC-NC-00056
8649	Issue	361	10	2021-04-09
8653	Issue	361	15	No
8655	Issue	361	17	Rework / Redo / Return to Supplier
8658	Issue	361	20	Se retira el componente soldado, y se solicita a storage reponer el item desoldado. Reunirse con los operadores para tener feedback de porque la cpnfusion y poder mejorar el proceso.
8659	Issue	361	21	No
8664	Issue	361	26	None
8669	Issue	362	5	
8670	Issue	362	6	\N
8671	Issue	362	8	
8674	Issue	362	12	
8675	Issue	362	13	
8676	Issue	362	14	
8678	Issue	362	16	
8680	Issue	362	18	
8681	Issue	362	19	
8684	Issue	362	22	
8685	Issue	362	23	
8687	Issue	362	25	
8665	Issue	362	1	Soldado de resistencias en designador incorrecto del PCB
8666	Issue	362	2	Minor
8667	Issue	362	3	None
8668	Issue	362	4	None
8672	Issue	362	9	SBM-OBC-NC-00055
8673	Issue	362	10	2021-04-09
8677	Issue	362	15	No
8679	Issue	362	17	Rework / Redo / Return to Supplier
8682	Issue	362	20	La imagen del paso de procedimiento no corresponde al componente a integrar, el operador integra los componentes guiandose por esta imagen y no por lo indicado en el paso. Se retiran las resistencias y se sueldan nuevas solicitadas a storage en los designadores indicados por el procedimiento.  Se debe corregir el procedimiento agregando la imagen correcta al paso.
8683	Issue	362	21	No
8688	Issue	362	26	None
8693	Issue	363	5	
8694	Issue	363	6	\N
8695	Issue	363	8	
8698	Issue	363	12	
8699	Issue	363	13	
8700	Issue	363	14	
8689	Issue	363	1	leds integrados con polaridad invertida
8690	Issue	363	2	Minor
8691	Issue	363	3	None
8692	Issue	363	4	None
8696	Issue	363	9	SBM-OBC-NC-00054
8697	Issue	363	10	2021-02-09
11027	DmsfFolder	16	48	
11028	DmsfFolder	16	49	
11030	DmsfFolder	17	48	
11031	DmsfFolder	17	49	
11033	DmsfFolder	18	48	
11034	DmsfFolder	18	49	
8702	Issue	363	16	
8704	Issue	363	18	
8705	Issue	363	19	
8708	Issue	363	22	
8709	Issue	363	23	
8711	Issue	363	25	
8701	Issue	363	15	No
8703	Issue	363	17	Rework / Redo / Return to Supplier
8706	Issue	363	20	Se dispone remover los 4 leds, y que se reemplacen por 4 leds nuevos para ser integrados
8707	Issue	363	21	No
8712	Issue	363	26	None
8717	Issue	364	5	
8718	Issue	364	6	\N
8719	Issue	364	8	
8722	Issue	364	12	
8723	Issue	364	13	
8724	Issue	364	14	
8726	Issue	364	16	
8728	Issue	364	18	
8729	Issue	364	19	
8732	Issue	364	22	
8733	Issue	364	23	
8735	Issue	364	25	
8713	Issue	364	1	Induccion de ruido en señales de medición de voltajes (Interface ASM)
8714	Issue	364	2	Minor
8715	Issue	364	3	None
8716	Issue	364	4	None
8720	Issue	364	9	SBM-GSE-NC-00009
8721	Issue	364	10	2021-03-30
8725	Issue	364	15	No
8727	Issue	364	17	Use as is / Continue / Accept
8730	Issue	364	20	NRB 31/03/2021: (E.Guitart – F.Aghemo – M.Alvarez)  Disposición 1: modificar las cajas para que el cableado de señales analógicas no utilice como medio de PCB. Para esto se dispone conectar directamente los pines ASM del conector de entrada (Lado DUT) a los pines del conector de salida (Lado usuario) utilizando cables separados por canal (trenzado y mallado). La disposición aplica a todas las señales ASM.   Resultado de disposición 1: El ruido disminuye pero no desaparece. La Figura 2 muestra los cables color blanco a la derecha de la fotografía.   NRB 13/04/21 ( E.Guitart – F.Aghemo – M.Alvarez Bocco)  Disposición 2:  Esta disposición se enfoca en realizar modificaciones en el software. La propuesta es modificar la lógica de adquisición de todas las señales analógicas de manera que se extienda el tiempo que se muestea entre canales. Con esto se pretende  darle mas tiempo al sistema de adaptación de la placa de National Instruments para que se descarguen las capacidades de entrada.  dejo un link de referencia creado por el fabricante  https://knowledge.ni.com/KnowledgeArticleDetails?id=kA03q000000YHy6CAG&l=es-AR Resultado de disposición 2: Se implementó un mecanismo de lectura en el que se puede controlar el tiempo en que se leen los canales. No se observaron cambios a pesar de establecer tiempos de 1 sec. entre canales.   NRB 14/04/21 ( E.Guitart – F.Aghemo – M.Alvarez Bocco)  Disposición 3: Como el comportamiento de esta falla se produce cuando el DUT no se encuentra conectado y, que además, los valores esperados están muy por debajo de lo que se mide cuando se presenta la condición de falla, se propone explicar esta anomalía en detalles en el manual de usuario y entregar el equipo en la condición actual.  Para demostrar que usando el DUT funciona se relevó el circuito de salida ASM del DUT, Figura 3 y se recreó una configuración similar, Figura 4. La prueba se realizó en el canal O_RX_AGC_LEVEL y el resultado fue el esperado. La Figura 5 muestra que el canal presenta un valor de voltaje de 2.54V    Resultado de la disposición 3: Se dejará el circuito diseñado originalmente con líneas ASM sobre PCB y se explicará en el manual de usuario como es el funcionamiento de la interface cuando no está presente el DUT.
8731	Issue	364	21	No
8736	Issue	364	26	None
8738	Issue	365	2	
8741	Issue	365	5	
8743	Issue	365	8	
8747	Issue	365	13	
8748	Issue	365	14	
8752	Issue	365	18	
8754	Issue	365	20	
8757	Issue	365	23	
8759	Issue	365	25	
8737	Issue	365	1	Olor no esperado al finalizar ensayo de TVAC de cupón de SA
8739	Issue	365	3	HW
8740	Issue	365	4	None
8742	Issue	365	6	
8744	Issue	365	9	NC-722
8745	Issue	365	10	2021-07-19
8746	Issue	365	12	In Process / Final Inspection / Test (non operational)
8749	Issue	365	15	No
8750	Issue	365	16	Contamination
8751	Issue	365	17	Correct / Repair / Fix
8753	Issue	365	19	Under Analysis
8755	Issue	365	21	No
8756	Issue	365	22	Cupón para calificación del proceso de pegado de las celdas solares (Cupón para TVAC)
8760	Issue	365	26	None
8767	Issue	366	8	
8770	Issue	366	12	
8771	Issue	366	13	
8772	Issue	366	14	
8774	Issue	366	16	
11036	DmsfFolder	19	48	
8780	Issue	366	22	
8781	Issue	366	23	
11037	DmsfFolder	19	49	
8761	Issue	366	1	Orden incorrecto de encendido de fuentes en Power Up
8762	Issue	366	2	Minor
8763	Issue	366	3	HW
8764	Issue	366	4	None
8765	Issue	366	5	SABIA.FS.EM.PM.PM-OBC.A.SBC
8766	Issue	366	6	
8768	Issue	366	9	SBM-OBC-NC-00086
8769	Issue	366	10	2021-06-24
8773	Issue	366	15	No
8775	Issue	366	17	Use as is / Continue / Accept
8776	Issue	366	18	Known Cause / Certain Corrective Action
8777	Issue	366	19	Procedure not implemented
8779	Issue	366	21	No
8783	Issue	366	25	EM
11039	DmsfFolder	20	48	
11040	DmsfFolder	20	49	
11042	DmsfFolder	21	48	
11043	DmsfFolder	21	49	
11045	DmsfFolder	22	48	
11046	DmsfFolder	22	49	
11048	DmsfFolder	23	48	
11049	DmsfFolder	23	49	
11051	DmsfFolder	24	48	
11052	DmsfFolder	24	49	
11054	DmsfFolder	25	48	
11055	DmsfFolder	25	49	
11057	DmsfFolder	26	48	
8778	Issue	366	20	La solución, además de seguir el procedimiento SIEMPRE, es colocar un cartel en el botón de estanby de la fuente que pregunte si esta encendida la otra fuente, el cartel se puede poner sobre el botón de stand by tapándolo y que sea necesario correrlo/desplazarlo. Se implementó en los procedimientos de la SBC y se mantiene abierta mientras se siga trabajando con alimentación externa en el modelo EM para asegurar la implementación en los próximos procedimientos 17/06/2021: (A.Ambrosino, A.Alvarez, M.Alvarez Bocco, D.Fernandez) Los procedimientos son claros en su paso a paso y la secuencia tanto de encendido como de apagado. Las fuentes están debidamente identificadas y de forma clara.  Se define de común acuerdo generar esta NC como seguimiento de esta situación durante toda la campaña EM de la PM-OBC. Finalizada la misma, se ciuerra esta NC.
8784	Issue	366	26	None
8791	Issue	367	8	
8792	Issue	367	9	
8795	Issue	367	13	
8799	Issue	367	17	
8800	Issue	367	18	
8801	Issue	367	19	
8802	Issue	367	20	
8805	Issue	367	23	
8785	Issue	367	1	Los actuadores Moog no cumplen los requerimientos de cargas mecánicas solicitados en la compra 
8786	Issue	367	2	Major
8787	Issue	367	3	HW
8788	Issue	367	4	None
8789	Issue	367	5	SABIA.FS.PFM.PM       
8790	Issue	367	6	
8793	Issue	367	10	2021-07-07
8794	Issue	367	12	In Process / Final Inspection / Test (non operational)
8796	Issue	367	14	P/N CC92275-001
8797	Issue	367	15	No
8798	Issue	367	16	Mechanical
8803	Issue	367	21	No
8804	Issue	367	22	Actuadores rotacionales de los calibradores de las camaras VIS-NIR y NIR-SWIR, PN CC92275-001
8807	Issue	367	25	PFM
8808	Issue	367	26	0965-SAGG-0GCEM-001-A Structure - L4 Requirements
8814	Issue	368	6	\N
8815	Issue	368	8	
8819	Issue	368	13	
8824	Issue	368	18	
8826	Issue	368	20	
8829	Issue	368	23	
8809	Issue	368	1	SABIAMAR - PCS - Solar Array - Calificación de pegado de celdas
8810	Issue	368	2	Minor
8811	Issue	368	3	HW
8812	Issue	368	4	None
8813	Issue	368	5	SABIA.FS.PFM.SM.PCS.SA
8816	Issue	368	9	0965PAQ0033
8817	Issue	368	10	2021-06-07
8818	Issue	368	12	Incoming Inspection / Test
8820	Issue	368	14	CLP-PPC-345
8821	Issue	368	15	No
8822	Issue	368	16	Material
8823	Issue	368	17	Use as is / Continue / Accept
8825	Issue	368	19	Under Analysis
8827	Issue	368	21	No
8828	Issue	368	22	Cupón para Calificación de pegado de celdas
8831	Issue	368	25	EM
8832	Issue	368	26	None
8838	Issue	369	6	\N
8839	Issue	369	8	
8843	Issue	369	13	
8844	Issue	369	14	
8848	Issue	369	18	
8849	Issue	369	19	
8850	Issue	369	20	
8853	Issue	369	23	
8833	Issue	369	1	Problemas en el soldado de torretas AVAB EM
8834	Issue	369	2	Minor
8835	Issue	369	3	HW
8836	Issue	369	4	None
8837	Issue	369	5	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01
8840	Issue	369	9	SBM-OBC-NC-00051
8841	Issue	369	10	2021-04-06
8842	Issue	369	12	In Process / Final Inspection / Test (non operational)
8845	Issue	369	15	No
8846	Issue	369	16	Soldering
8847	Issue	369	17	Rework / Redo / Return to Supplier
8851	Issue	369	21	No
8852	Issue	369	22	Torreta
8855	Issue	369	25	EM
8856	Issue	369	26	None
8862	Issue	370	6	\N
8863	Issue	370	8	
8865	Issue	370	10	
8866	Issue	370	12	
8867	Issue	370	13	
8872	Issue	370	18	
8874	Issue	370	20	
8876	Issue	370	22	
8877	Issue	370	23	
8857	Issue	370	1	Deformación de pones parte EEE enviada a conformar
8858	Issue	370	2	Minor
8859	Issue	370	3	HW
8860	Issue	370	4	None
8861	Issue	370	5	SABIA.FS.EM.PM.PM-OBC.A.TAB_01
8864	Issue	370	9	SBM-OBC-NC-00070
8868	Issue	370	14	0673-0666-0668
8869	Issue	370	15	No
8870	Issue	370	16	Provisioning/Purchasing
8871	Issue	370	17	Use as is / Continue / Accept
8873	Issue	370	19	Under Analysis
8875	Issue	370	21	No
8879	Issue	370	25	EM
8880	Issue	370	26	None
8881	Issue	371	1	4E CELL SELF-DISCHARGE
8882	Issue	371	2	Major
11058	DmsfFolder	26	49	
11060	DmsfFolder	27	48	
11061	DmsfFolder	27	49	
11063	DmsfFileRevision	5	48	
11064	DmsfFileRevision	5	49	
11066	DmsfFolder	28	48	
11067	DmsfFolder	28	49	
8887	Issue	371	8	
8889	Issue	371	10	
8891	Issue	371	13	
8894	Issue	371	16	
8895	Issue	371	17	
8896	Issue	371	18	
8898	Issue	371	20	
8883	Issue	371	3	None
8884	Issue	371	4	None
8885	Issue	371	5	SABIA.FS.PFM.SM.PCS.BAT
8888	Issue	371	9	S1300-21 issue 1
8890	Issue	371	12	In Process / Final Inspection / Test (non operational)
8892	Issue	371	14	8S8P VES16
8893	Issue	371	15	No
8897	Issue	371	19	Under Analysis
8899	Issue	371	21	No
8900	Issue	371	22	Bateria
8901	Issue	371	23	The root cause is under investigation.\r\nThe self-discharge of the 4e cell is too big to be compensated by the balancing from the SBS. The voltage spread will keep increasing until the cell is over discharged, and therefore the string will not be operating after several hundred or few thousands of cycles (depending on the kinetic evolution of the self-discharge). The battery module will become electrically 8S7P.\r\n
8903	Issue	371	25	PFM
8904	Issue	371	26	None
8911	Issue	372	8	
8914	Issue	372	12	
8915	Issue	372	13	
8916	Issue	372	14	
8920	Issue	372	18	
8922	Issue	372	20	
8905	Issue	372	1	Integracion de parte EEE MOSFET
8906	Issue	372	2	Major
8907	Issue	372	3	HW
8908	Issue	372	4	None
8909	Issue	372	5	SABIA.FS.EM.PM.PM-OBC.A.TCB_01
8910	Issue	372	6	
8912	Issue	372	9	SBM-OBC-NC-00071
8913	Issue	372	10	2021-05-27
8917	Issue	372	15	No
8918	Issue	372	16	Mechanical
8919	Issue	372	17	Rework / Redo / Return to Supplier
8921	Issue	372	19	Design Deficiency
8923	Issue	372	21	No
8924	Issue	372	22	parte EEE: MOSFET IRHNJ67130 para TCB y MOSFET IRHN9150 para PWR
8925	Issue	372	23	Falta de relief mecánico en Parte EEE
8927	Issue	372	25	EM
8928	Issue	372	26	None
8935	Issue	373	8	
8939	Issue	373	13	
8940	Issue	373	14	
8944	Issue	373	18	
8946	Issue	373	20	
8949	Issue	373	23	
8929	Issue	373	1	Diferencias de altura de componentes enviados a conformar
8930	Issue	373	2	Major
8931	Issue	373	3	HW
8932	Issue	373	4	None
8886	Issue	371	6	
8936	Issue	373	9	SBM-OBC-NC-00068
8937	Issue	373	10	2021-05-20
8938	Issue	373	12	In Process / Final Inspection / Test (non operational)
8941	Issue	373	15	No
8942	Issue	373	16	Dimensional
8943	Issue	373	17	Rework / Redo / Return to Supplier
8945	Issue	373	19	Under Analysis
8947	Issue	373	21	No
8948	Issue	373	22	Componentes listados en reporte de NC de placas GPIO EM, TAB EM y COMM EM
8951	Issue	373	25	EM
8952	Issue	373	26	None
8959	Issue	374	8	
8962	Issue	374	12	
8963	Issue	374	13	
8964	Issue	374	14	
8966	Issue	374	16	
8953	Issue	374	1	Discrepancias entre componentes y footprints
8954	Issue	374	2	Minor
8955	Issue	374	3	HW
8956	Issue	374	4	None
8933	Issue	373	5	SABIA.FS.EM.PM.PM-OBC.A.TAB_01SABIA.FS.EM.PM.PM-OBC.A.COMM_01
8960	Issue	374	9	SBM-OBC-NC-00064
8961	Issue	374	10	2021-04-15
8965	Issue	374	15	No
11069	DmsfFileRevision	6	48	
11070	DmsfFileRevision	6	49	
11072	DmsfFileRevision	7	48	
11073	DmsfFileRevision	7	49	
11075	DmsfFileRevision	8	48	
11076	DmsfFileRevision	8	49	
11078	DmsfFileRevision	9	48	
11079	DmsfFileRevision	9	49	
11081	DmsfFolder	29	48	
11082	DmsfFolder	29	49	
11084	DmsfFileRevision	10	48	
11085	DmsfFileRevision	10	49	
11087	DmsfFileRevision	11	48	
11088	DmsfFileRevision	11	49	
11090	DmsfFileRevision	12	48	
11091	DmsfFileRevision	12	49	
11093	DmsfFolder	30	48	
11094	DmsfFolder	30	49	
11096	DmsfFolder	31	48	
11097	DmsfFolder	31	49	
11099	DmsfFileRevision	13	48	
11100	DmsfFileRevision	13	49	
8934	Issue	373	6	
8968	Issue	374	18	
8970	Issue	374	20	
8972	Issue	374	22	
8973	Issue	374	23	
8967	Issue	374	17	Use as is / Continue / Accept
8969	Issue	374	19	Under Analysis
8971	Issue	374	21	No
8975	Issue	374	25	EM
8976	Issue	374	26	None
8983	Issue	375	8	
8986	Issue	375	12	
8987	Issue	375	13	
8988	Issue	375	14	
8990	Issue	375	16	
8992	Issue	375	18	
8997	Issue	375	23	
8977	Issue	375	1	Desplazamiento de thermagap una vez integrado el componente
8978	Issue	375	2	Minor
8979	Issue	375	3	HW
8980	Issue	375	4	None
8981	Issue	375	5	SABIA.FS.EM.PM.PM-OBC.A.GPIO_01 
8984	Issue	375	9	SBM-OBC-NC-00062
8985	Issue	375	10	2021-04-14
8989	Issue	375	15	No
8991	Issue	375	17	Rework / Redo / Return to Supplier
8993	Issue	375	19	Under Analysis
8994	Issue	375	20	Se dispone retrabajar desoldando los componentes anteriormente mencionados y reemplazando el therm-a-gap por uno nuevo.  Se dispone realizar una revisión del procedimiento de aplicación del therm-a-gap (SBM-OBC-PR-0004-B y SBM-OBC-PR-00006-B) para mejorar y definir las maneras más efectivas de aplicación.
8995	Issue	375	21	No
8996	Issue	375	22	Therm-a-gap 
8999	Issue	375	25	EM
9000	Issue	375	26	None
9007	Issue	376	8	
9010	Issue	376	12	
9011	Issue	376	13	
9012	Issue	376	14	
9014	Issue	376	16	
9016	Issue	376	18	
9021	Issue	376	23	
9001	Issue	376	1	Dificultad para soldar capacitor ceramico dentro de valores de temperatura indicados por norma
9002	Issue	376	2	Minor
9003	Issue	376	3	HW
9004	Issue	376	4	None
9005	Issue	376	5	SABIA.FS.EM.PM.PM-OBC.A.GPIO_01
9008	Issue	376	9	SBM-OBC-NC-00060
9009	Issue	376	10	2021-04-12
9013	Issue	376	15	No
9015	Issue	376	17	Use as is / Continue / Accept
9017	Issue	376	19	Under Analysis
9018	Issue	376	20	Se dispone no retrabajar este item, dejando acentado que para los próximos capacitores de ceramico se utilizara como temperatura limite 280° pre calentando la placa con pre heater.
9019	Issue	376	21	No
9020	Issue	376	22	Therm-a-gap 
9023	Issue	376	25	EM
9024	Issue	376	26	None
9031	Issue	377	8	
9034	Issue	377	12	
9035	Issue	377	13	
9036	Issue	377	14	
9038	Issue	377	16	
9040	Issue	377	18	
9044	Issue	377	22	
9045	Issue	377	23	
9025	Issue	377	1	Footprint en PCB de tamaño diferente respecto al componente
9026	Issue	377	2	Minor
9027	Issue	377	3	HW
9028	Issue	377	4	None
9029	Issue	377	5	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01 
9032	Issue	377	9	SBM-OBC-NC-00059
9033	Issue	377	10	2021-04-09
9037	Issue	377	15	No
9039	Issue	377	17	Use as is / Continue / Accept
9041	Issue	377	19	Under Analysis
9042	Issue	377	20	No poblar el componente.  Se debe determinar con CONAE los pasos a seguir. 
9043	Issue	377	21	No
9047	Issue	377	25	EM
9048	Issue	377	26	None
9055	Issue	378	8	
9058	Issue	378	12	
9059	Issue	378	13	
9060	Issue	378	14	
9062	Issue	378	16	
9064	Issue	378	18	
9066	Issue	378	20	
9069	Issue	378	23	
9049	Issue	378	1	Pines de conectores d-SUB no pasan al lado Bottom
9050	Issue	378	2	Minor
9051	Issue	378	3	HW
9052	Issue	378	4	None
9030	Issue	377	6	
9056	Issue	378	9	SBM-OBC-NC-00053
9057	Issue	378	10	2021-04-07
9061	Issue	378	15	No
9063	Issue	378	17	Use as is / Continue / Accept
9065	Issue	378	19	Under Analysis
9067	Issue	378	21	No
9068	Issue	378	22	conectores DB 
9071	Issue	378	25	EM
9072	Issue	378	26	None
9073	Issue	379	1	Platina de alineación para conectores DB con agujeros pequeños AVAB EM y GPIO EM
9074	Issue	379	2	Minor
11102	DmsfFileRevision	14	48	
11103	DmsfFileRevision	14	49	
11105	DmsfFileRevision	15	48	
11106	DmsfFileRevision	15	49	
11108	DmsfFolder	32	48	
11109	DmsfFolder	32	49	
9006	Issue	376	6	
8982	Issue	375	6	
9079	Issue	379	8	
9082	Issue	379	12	
9083	Issue	379	13	
9084	Issue	379	14	
9086	Issue	379	16	
9088	Issue	379	18	
9090	Issue	379	20	
9093	Issue	379	23	
9075	Issue	379	3	HW
9076	Issue	379	4	None
9080	Issue	379	9	SBM-OBC-NC-00052
9081	Issue	379	10	2021-04-07
9085	Issue	379	15	No
9087	Issue	379	17	Use as is / Continue / Accept
9089	Issue	379	19	Under Analysis
9091	Issue	379	21	No
9092	Issue	379	22	Platina de alineación para conectores DB 
9095	Issue	379	25	EM
9096	Issue	379	26	None
9103	Issue	380	8	
9106	Issue	380	12	
9107	Issue	380	13	
9108	Issue	380	14	
9110	Issue	380	16	
9112	Issue	380	18	
9114	Issue	380	20	
9117	Issue	380	23	
9097	Issue	380	1	Falta de información para colocación de Therm-a-gap y componentes en altura
9098	Issue	380	2	Minor
9099	Issue	380	3	HW
9100	Issue	380	4	None
9077	Issue	379	5	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01SABIA.FS.EM.PM.PM-OBC.A.GPIO_01
9104	Issue	380	9	SBM-OBC-NC-00066
9105	Issue	380	10	2021-05-03
9109	Issue	380	15	No
9111	Issue	380	17	Use as is / Continue / Accept
9113	Issue	380	19	Under Analysis
9115	Issue	380	21	No
9116	Issue	380	22	Componentes en altura y Therm-a-gap
9119	Issue	380	25	EM
9120	Issue	380	26	None
9127	Issue	381	8	
9128	Issue	381	9	
9130	Issue	381	12	
9131	Issue	381	13	
9132	Issue	381	14	
9134	Issue	381	16	
9136	Issue	381	18	
9137	Issue	381	19	
9143	Issue	381	25	
9121	Issue	381	1	Inconsistencias entre los diferentes documentos de fabricación de Assemblies de PM-OBC EM
9122	Issue	381	2	Major
9123	Issue	381	3	Documentation
9124	Issue	381	4	None
9125	Issue	381	5	SABIA.FS.EM.PM.PM-OBC
9129	Issue	381	10	2018-07-12
9133	Issue	381	15	No
9135	Issue	381	17	Use as is / Continue / Accept
9138	Issue	381	20	1.\tEn el caso del modelo Backplane EM, para corregir la información y proseguir con las actividades de populado se procedió a: ?\tSe genero la version B del documento de kitting pero sin modificar los materiales y cantidades, simplemente se agregaron columna con información adicional a saber: a.\tLot Number b.\tSupplier c.\tManufacturer d.\tModel\t e.\tSerial Number  ?\tSe incorporó en el propio ?ARR - Summary - Populado Backplane A EM - 12-07-18? el listado de resistencias a popular y cuáles no, el LIE modificaría el procedimiento de populado acorde ?\tPara el caso del procedimiendo de inspección visual y pasivo del Backplane a EM, el procedimiento no se modificara, se agregaran las red lines en el as run con los pasos modificados/agregados  2.\tA futuro, en el caso del modelo Backplane FM se debe ?\tCorregir el documento con el listado de resistencias a popular y cuáles no, ?\tCorregir el documento del procedimiento de inspección visual y pasivo del Backplane   3.\tPara el resto de las placas del modelo EM y FM se debe generar un capitulo para incorporar al MAIT Plan e implementar a partir de la placa SBC EM (la siguiente) con el fin de describir el proceso necesario para ?\tRevisar la documentación de populado antes de pasársela al LIE, para que se establezca claramente que componentes se deben popular y cuales no y que ensayos visuales y pasivos se realizaran luego del populado ?\tRecepcion de materiales y manejo de stock ?\tGeneracion de documentación del kitting, confeccion, inspección del mismo antes de enviarlo al LIE (VER EL PROCESO DETALLADO EN EL DOCUMENTO ADJUNTO)  Respecto a la recepción de materiales y control de Stock, QA de proyecto realizara una visita a STI en donde se muestre el proceso de recepción de materiales, lugar de almacenamiento y recepción de componentes. STI debere entregar o generar el documento correspondiente donde se explique el proceso que siguen para estas actividades. Acomodar la fecha de visita previa a la entrega de la documentación que respalda dicho proceso.  QA del proyecto auditara periódicamente estas actividades
9139	Issue	381	21	No
9140	Issue	381	22	PM-OBC Engineering Model - Backplane Side A 
9141	Issue	381	23	Se revisó a documentación asociada al Workmanship al interactuar con la facilidad y se detectaron las anomalías sobre dicha documentación las cuales se describen en el adjunto. \r\n\r\nDurante el ARR se notificó y aclararon las mismas y se decidió avanzar sobre el modelo EM. 
9144	Issue	381	26	None
9151	Issue	382	8	
9154	Issue	382	12	
9158	Issue	382	16	
11111	DmsfFolder	33	48	
9160	Issue	382	18	
11112	DmsfFolder	33	49	
9162	Issue	382	20	
11114	DmsfFileRevision	16	48	
9165	Issue	382	23	
11115	DmsfFileRevision	16	49	
9167	Issue	382	25	
9145	Issue	382	1	PCS - PMDU - Placa EL-1586 - Módulo N&TA - Seguimiento de retrabajos en placas V-B335-001 y V-B335-002
9146	Issue	382	2	Minor
9147	Issue	382	3	HW
9148	Issue	382	4	None
9149	Issue	382	5	SABIA.FS.EM.SM.PCS.PMDU.N&TA - EM Nea & Thruster Actuator
9150	Issue	382	6	
9152	Issue	382	9	0965PAQ0025
9153	Issue	382	10	2020-11-05
9155	Issue	382	13	NA
9156	Issue	382	14	V-B335-001 y V-B335-002
9157	Issue	382	15	No
11117	DmsfFileRevision	17	48	
11118	DmsfFileRevision	17	49	
11120	DmsfFileRevision	18	48	
11121	DmsfFileRevision	18	49	
11123	DmsfFolder	34	48	
9102	Issue	380	6	
9078	Issue	379	6	
9159	Issue	382	17	Rework / Redo / Return to Supplier
9161	Issue	382	19	Under Analysis
9163	Issue	382	21	No
9164	Issue	382	22	Placa EL-1586 - Módulo N&TA
9168	Issue	382	26	None
9172	Issue	383	4	
9175	Issue	383	8	
9178	Issue	383	12	
9179	Issue	383	13	
9182	Issue	383	16	
9184	Issue	383	18	
9186	Issue	383	20	
9189	Issue	383	23	
9191	Issue	383	25	
9169	Issue	383	1	PCS - PMDU - Placa EL-1519 - Módulo de regulación - Seguimiento de retrabajos en placas V-B343-001 y V-B343-002
9170	Issue	383	2	Minor
9171	Issue	383	3	HW
9173	Issue	383	5	SABIA.FS.EM.SM.PCS.PMDU.dS3R
9174	Issue	383	6	
9176	Issue	383	9	0965PAQ0024
9177	Issue	383	10	2020-10-20
9180	Issue	383	14	V-B343-001 y V-B343-002
9181	Issue	383	15	No
9183	Issue	383	17	Rework / Redo / Return to Supplier
9185	Issue	383	19	Under Analysis
9187	Issue	383	21	No
9188	Issue	383	22	Placa EL-1519 - Módulo de regulación
9192	Issue	383	26	None
9199	Issue	384	8	
9202	Issue	384	12	
9203	Issue	384	13	
9208	Issue	384	18	
9210	Issue	384	20	
9213	Issue	384	23	
9193	Issue	384	1	Falla en la ejecución de SW Aplicativo cargado por el Bootloader (Ensayo de desempeño de SBC EM)
9194	Issue	384	2	Major
9195	Issue	384	3	SW
9196	Issue	384	4	None
9197	Issue	384	5	SABIA.FS.EM.PM.PM-OBC.A.SBC
9200	Issue	384	9	SBM-OBC-NC-00031
9201	Issue	384	10	2021-01-15
9204	Issue	384	14	SBC-EM-001
9205	Issue	384	15	No
9206	Issue	384	16	Software Code
9207	Issue	384	17	Rework / Redo / Return to Supplier
9209	Issue	384	19	Under Analysis
9211	Issue	384	21	No
9212	Issue	384	22	Placa SBM EM-01 (SABIA.FS.EM.PM.PM-OBC.A.SBC)
9215	Issue	384	25	EM
9216	Issue	384	26	None
9222	Issue	385	6	\N
9223	Issue	385	8	
9226	Issue	385	12	
9227	Issue	385	13	
9228	Issue	385	14	
9230	Issue	385	16	
9231	Issue	385	17	
9232	Issue	385	18	
9236	Issue	385	22	
9237	Issue	385	23	
9239	Issue	385	25	
9217	Issue	385	1	Analisis listado de partes EEE placa  TCB PMOBC
9218	Issue	385	2	Minor
9219	Issue	385	3	None
9220	Issue	385	4	None
9221	Issue	385	5	SABIA.FS.EM.PM.PM-OBC.A.TCB
9224	Issue	385	9	SBM-OBC-NC-00050
9225	Issue	385	10	2021-03-17
9229	Issue	385	15	No
9233	Issue	385	19	Under Analysis
9234	Issue	385	20	"De este análisis se encuentra que es necesario resolver los distintos ítems de acción que se van actualizando en las reuniones períodicas con CONAE para su análisis.  NRB 17/03/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1. 8 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00050 de VENG. 
9235	Issue	385	21	No
9240	Issue	385	26	None
9246	Issue	386	6	\N
9247	Issue	386	8	
9250	Issue	386	12	
9251	Issue	386	13	
9252	Issue	386	14	
9254	Issue	386	16	
9255	Issue	386	17	
9256	Issue	386	18	
9260	Issue	386	22	
9261	Issue	386	23	
9263	Issue	386	25	
9241	Issue	386	1	Analisis listado de partes EEE placa  TAB PMOBC
9242	Issue	386	2	Minor
9243	Issue	386	3	None
9244	Issue	386	4	None
9245	Issue	386	5	SABIA.FS.EM.PM.PM-OBC.A.TAB
9248	Issue	386	9	SBM-OBC-NC-00049
9249	Issue	386	10	2021-03-17
9253	Issue	386	15	No
9257	Issue	386	19	Under Analysis
9258	Issue	386	20	"De este análisis se encuentra que es necesario resolver los distintos ítems de acción que se van actualizando en las reuniones períodicas con CONAE para su análisis.  NRB 17/03/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1. 8 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00049 de VENG. 
9259	Issue	386	21	No
9264	Issue	386	26	None
9265	Issue	387	1	Analisis listado de partes EEE placa  AVAB PMOBC
9266	Issue	387	2	Minor
9267	Issue	387	3	None
11124	DmsfFolder	34	49	
11126	DmsfFileRevision	19	48	
11127	DmsfFileRevision	19	49	
11129	DmsfFileRevision	20	48	
11130	DmsfFileRevision	20	49	
9198	Issue	384	6	
9270	Issue	387	6	\N
9271	Issue	387	8	
9274	Issue	387	12	
9275	Issue	387	13	
9276	Issue	387	14	
9278	Issue	387	16	
9279	Issue	387	17	
9280	Issue	387	18	
9284	Issue	387	22	
9285	Issue	387	23	
9287	Issue	387	25	
9268	Issue	387	4	None
9269	Issue	387	5	SABIA.FS.EM.PM.PM-OBC.A.AVAB
9272	Issue	387	9	SBM-OBC-NC-00048
9273	Issue	387	10	2021-03-11
9277	Issue	387	15	No
9281	Issue	387	19	Under Analysis
9282	Issue	387	20	"De este análisis se encuentra que es necesario resolver los distintos ítems de acción que se van actualizando en las reuniones períodicas con CONAE para su análisis.  NRB 10/03/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1. 7 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00048 de VENG. NRB 17/03/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1. 8 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00048 de VENG. 
9283	Issue	387	21	No
9288	Issue	387	26	None
9294	Issue	388	6	\N
9295	Issue	388	8	
9298	Issue	388	12	
9299	Issue	388	13	
9300	Issue	388	14	
9302	Issue	388	16	
9303	Issue	388	17	
9304	Issue	388	18	
9306	Issue	388	20	
9308	Issue	388	22	
9309	Issue	388	23	
9311	Issue	388	25	
9289	Issue	388	1	Error en documentación
9290	Issue	388	2	Minor
9291	Issue	388	3	None
9292	Issue	388	4	None
9293	Issue	388	5	SABIA.FS.EM.PM.PM-OBC.A.PWR
9296	Issue	388	9	SBM-OBC-NC-00047
9297	Issue	388	10	2021-02-08
9301	Issue	388	15	No
9305	Issue	388	19	Under Analysis
9307	Issue	388	21	No
9312	Issue	388	26	None
9318	Issue	389	6	\N
9319	Issue	389	8	
9322	Issue	389	12	
9323	Issue	389	13	
9324	Issue	389	14	
9326	Issue	389	16	
9328	Issue	389	18	
9332	Issue	389	22	
9333	Issue	389	23	
9335	Issue	389	25	
9313	Issue	389	1	Defecto en componente a integrar
9314	Issue	389	2	Minor
9315	Issue	389	3	None
9316	Issue	389	4	None
9317	Issue	389	5	SABIA.FS.EM.PM.PM-OBC.A.PWR
9320	Issue	389	9	SBM-OBC-NC-00046
9321	Issue	389	10	2021-02-05
9325	Issue	389	15	No
9327	Issue	389	17	Scrap / Dismiss / Abort
9329	Issue	389	19	Under Analysis
9330	Issue	389	20	Se dispone cambiar el componente por uno nuevo
9331	Issue	389	21	No
9336	Issue	389	26	None
9342	Issue	390	6	\N
9343	Issue	390	8	
9346	Issue	390	12	
9347	Issue	390	13	
9348	Issue	390	14	
9350	Issue	390	16	
9352	Issue	390	18	
9356	Issue	390	22	
9357	Issue	390	23	
9359	Issue	390	25	
9337	Issue	390	1	Cambio en procedimientos de integración
9338	Issue	390	2	Minor
9339	Issue	390	3	None
9340	Issue	390	4	None
9341	Issue	390	5	SABIA.FS.EM.PM.PM-OBC.A.COMM\r\nSABIA.FS.EM.PM.PM-OBC.A.PWR
9344	Issue	390	9	SBM-OBC-NC-00045
9345	Issue	390	10	2021-02-05
9349	Issue	390	15	No
9351	Issue	390	17	Use as is / Continue / Accept
9353	Issue	390	19	Under Analysis
9354	Issue	390	20	se dispone soldar todos los componentes que requieren altuea segun el documento sin la misma.
9355	Issue	390	21	No
9360	Issue	390	26	None
9366	Issue	391	6	\N
9367	Issue	391	8	
9370	Issue	391	12	
9371	Issue	391	13	
9372	Issue	391	14	
9374	Issue	391	16	
9375	Issue	391	17	
9376	Issue	391	18	
9378	Issue	391	20	
9380	Issue	391	22	
9361	Issue	391	1	Error de procedimiento de poblado de componente
9362	Issue	391	2	Minor
9363	Issue	391	3	None
9364	Issue	391	4	None
9365	Issue	391	5	SABIA.FS.EM.PM.PM-OBC.A.COMM
9368	Issue	391	9	SBM-OBC-NC-00044
9369	Issue	391	10	2021-02-04
9373	Issue	391	15	No
9377	Issue	391	19	Under Analysis
9379	Issue	391	21	No
11132	DmsfFileRevision	21	48	
11133	DmsfFileRevision	21	49	
11135	DmsfFolder	35	48	
11136	DmsfFolder	35	49	
11138	DmsfFolder	36	48	
11139	DmsfFolder	36	49	
9381	Issue	391	23	
9383	Issue	391	25	
9384	Issue	391	26	None
9390	Issue	392	6	\N
9391	Issue	392	8	
9394	Issue	392	12	
9395	Issue	392	13	
9396	Issue	392	14	
9398	Issue	392	16	
9400	Issue	392	18	
9404	Issue	392	22	
9405	Issue	392	23	
9407	Issue	392	25	
9385	Issue	392	1	Defecto en componente a integrar
9386	Issue	392	2	Minor
9387	Issue	392	3	None
9388	Issue	392	4	None
9389	Issue	392	5	SABIA.FS.EM.PM.PM-OBC.A.COMM
9392	Issue	392	9	SBM-OBC-NC-00043
9393	Issue	392	10	2021-02-04
9397	Issue	392	15	No
9399	Issue	392	17	Scrap / Dismiss / Abort
9401	Issue	392	19	Under Analysis
9402	Issue	392	20	se dispone reemplazar la resistencia por una nueva.
9403	Issue	392	21	No
9408	Issue	392	26	None
9415	Issue	393	8	
9418	Issue	393	12	
9419	Issue	393	13	
9420	Issue	393	14	
9422	Issue	393	16	
9424	Issue	393	18	
9428	Issue	393	22	
9429	Issue	393	23	
9431	Issue	393	25	
9409	Issue	393	1	Error en componente para su integración
9410	Issue	393	2	Minor
9411	Issue	393	3	None
9412	Issue	393	4	None
9413	Issue	393	5	SABIA.FS.EM.PM.PM-OBC.A.PWR
9416	Issue	393	9	SBM-OBC-NC-00042
9417	Issue	393	10	2021-02-04
9421	Issue	393	15	No
9423	Issue	393	17	Scrap / Dismiss / Abort
9425	Issue	393	19	Under Analysis
9426	Issue	393	20	se dispone no integrar y regresar el componente a storage y continuar la integracion.
9427	Issue	393	21	No
9432	Issue	393	26	None
9438	Issue	394	6	\N
9439	Issue	394	8	
9442	Issue	394	12	
9443	Issue	394	13	
9444	Issue	394	14	
9446	Issue	394	16	
9448	Issue	394	18	
9452	Issue	394	22	
9453	Issue	394	23	
9455	Issue	394	25	
9433	Issue	394	1	Error en poblado de componente
9434	Issue	394	2	Minor
9435	Issue	394	3	None
9436	Issue	394	4	None
9437	Issue	394	5	SABIA.FS.EM.PM.PM-OBC.A.PWR
9440	Issue	394	9	SBM-OBC-NC-00041
9441	Issue	394	10	2021-02-04
9445	Issue	394	15	No
9447	Issue	394	17	Rework / Redo / Return to Supplier
9449	Issue	394	19	Under Analysis
9450	Issue	394	20	se dispone retirar la resitencia y colocar la misma en el designador correcto R12D
9451	Issue	394	21	No
9456	Issue	394	26	None
9462	Issue	395	6	\N
9463	Issue	395	8	
9466	Issue	395	12	
9467	Issue	395	13	
9468	Issue	395	14	
9470	Issue	395	16	
9472	Issue	395	18	
9476	Issue	395	22	
9477	Issue	395	23	
9457	Issue	395	1	Insumo de producción fuera de fecha de vencimiento
9458	Issue	395	2	Minor
9459	Issue	395	3	None
9460	Issue	395	4	None
9461	Issue	395	5	SABIA.FS.EM.PM.PM-OBC.A.COMM\r\nSABIA.FS.EM.PM.PM-OBC.A.PWR
9464	Issue	395	9	SBM-OBC-NC-00040
9465	Issue	395	10	2021-02-02
9469	Issue	395	15	No
9471	Issue	395	17	Use as is / Continue / Accept
9473	Issue	395	19	Under Analysis
9474	Issue	395	20	Se dispone utilizar el insumo con conocimiento de su vencimiento, ya que e en dicha etapa (EM) no afecta su utilización .
9475	Issue	395	21	No
11141	DmsfFolder	37	48	
11142	DmsfFolder	37	49	
11144	DmsfFolder	38	48	
11145	DmsfFolder	38	49	
11147	DmsfFolder	39	48	
11148	DmsfFolder	39	49	
11150	DmsfFolder	40	48	
11151	DmsfFolder	40	49	
11153	DmsfFolder	41	48	
11154	DmsfFolder	41	49	
9414	Issue	393	6	
11292	Issue	377	7	
11293	Issue	377	11	
11296	Issue	375	7	
11297	Issue	375	11	
11361	Issue	367	75	MOOG
11362	Issue	371	75	SAFT
11363	Issue	415	75	SAFT
11364	Issue	358	7	\N
11365	Issue	358	11	\N
11366	Issue	358	75	VENG
11367	Issue	359	7	\N
11368	Issue	359	11	\N
11369	Issue	359	75	VENG
11370	Issue	360	7	\N
11371	Issue	360	11	\N
9479	Issue	395	25	
9480	Issue	395	26	None
9486	Issue	396	6	\N
9487	Issue	396	8	
9490	Issue	396	12	
9491	Issue	396	13	
9492	Issue	396	14	
9494	Issue	396	16	
9496	Issue	396	18	
9500	Issue	396	22	
9501	Issue	396	23	
9503	Issue	396	25	
9481	Issue	396	1	Rotura de componente durante integración
9482	Issue	396	2	Minor
9483	Issue	396	3	None
9484	Issue	396	4	None
9485	Issue	396	5	SABIA.FS.EM.PM.PM-OBC.A.PWR
9488	Issue	396	9	SBM-OBC-NC-00039
9489	Issue	396	10	2021-02-01
9493	Issue	396	15	No
9495	Issue	396	17	Rework / Redo / Return to Supplier
9497	Issue	396	19	Under Analysis
9498	Issue	396	20	"Se dispone remover la torreta mal colocada y cambiar el metodo de integracion de las mismas a forma manual sinayuda de la herramienta ( M22520/5-01 HX4 ) ReferenceDocuments Attachments No"
9499	Issue	396	21	No
9504	Issue	396	26	None
9510	Issue	397	6	\N
9511	Issue	397	8	
9514	Issue	397	12	
9515	Issue	397	13	
9516	Issue	397	14	
9518	Issue	397	16	
9520	Issue	397	18	
9524	Issue	397	22	
9525	Issue	397	23	
9527	Issue	397	25	
9505	Issue	397	1	Faltante de componente en bolsa de kitting
9506	Issue	397	2	Minor
9507	Issue	397	3	None
9508	Issue	397	4	None
9509	Issue	397	5	SABIA.FS.EM.PM.PM-OBC.A.PWR
9512	Issue	397	9	SBM-OBC-NC-00038
9513	Issue	397	10	2021-02-01
9517	Issue	397	15	No
9519	Issue	397	17	Rework / Redo / Return to Supplier
9521	Issue	397	19	Under Analysis
9522	Issue	397	20	se dispone retirar las 4 resistencias codigo m55342e06b20b0rts de storage para reponer las faltantes.
9523	Issue	397	21	No
9528	Issue	397	26	None
9535	Issue	398	8	
9538	Issue	398	12	
9539	Issue	398	13	
9540	Issue	398	14	
9542	Issue	398	16	
9543	Issue	398	17	
9544	Issue	398	18	
9546	Issue	398	20	
9548	Issue	398	22	
9549	Issue	398	23	
9551	Issue	398	25	
9529	Issue	398	1	Largo de pines  incorrecto
9530	Issue	398	2	Minor
9531	Issue	398	3	None
9532	Issue	398	4	None
9533	Issue	398	5	SABIA.FS.EM.PM.PM-OBC.A.COMM
9536	Issue	398	9	SBM-OBC-NC-00037
9537	Issue	398	10	2021-02-03
9541	Issue	398	15	No
9545	Issue	398	19	Under Analysis
9547	Issue	398	21	No
9552	Issue	398	26	None
9558	Issue	399	6	\N
9559	Issue	399	8	
9562	Issue	399	12	
9563	Issue	399	13	
9564	Issue	399	14	
9566	Issue	399	16	
9568	Issue	399	18	
9569	Issue	399	19	
9572	Issue	399	22	
9573	Issue	399	23	
9575	Issue	399	25	
9553	Issue	399	1	Error de kitting de PCB
9554	Issue	399	2	Minor
9555	Issue	399	3	None
9556	Issue	399	4	None
9557	Issue	399	5	SABIA.FS.EM.PM.PM-OBC.A.PWR
9560	Issue	399	9	SBM-OBC-NC-00036
9561	Issue	399	10	2021-02-03
9565	Issue	399	15	No
9567	Issue	399	17	Scrap / Dismiss / Abort
9570	Issue	399	20	El PCB entregado junto con el Kitting es PWR_B este no coincide con el solicitado por la lista de partes, que es la placa version PWR_A
9571	Issue	399	21	No
9576	Issue	399	26	None
9582	Issue	400	6	\N
9583	Issue	400	8	
9586	Issue	400	12	
9587	Issue	400	13	
9588	Issue	400	14	
9590	Issue	400	16	
9591	Issue	400	17	
9592	Issue	400	18	
9594	Issue	400	20	
9596	Issue	400	22	
9597	Issue	400	23	
11156	DmsfFolder	42	48	
9577	Issue	400	1	Analisis listado de partes EEE placa  GPIO PMOBC
9578	Issue	400	2	Minor
9579	Issue	400	3	None
9580	Issue	400	4	None
9581	Issue	400	5	SABIA.FS.EM.PM.PM-OBC.A.GPIO
9584	Issue	400	9	SBM-OBC-NC-00035
9585	Issue	400	10	2021-01-14
9589	Issue	400	15	No
9593	Issue	400	19	Under Analysis
11157	DmsfFolder	42	49	
11159	DmsfFolder	43	48	
11160	DmsfFolder	43	49	
9534	Issue	398	6	
11294	Issue	376	7	
11295	Issue	376	11	
9599	Issue	400	25	
9595	Issue	400	21	No
9600	Issue	400	26	None
9605	Issue	401	5	
9606	Issue	401	6	\N
9607	Issue	401	8	
9610	Issue	401	12	
9611	Issue	401	13	
9612	Issue	401	14	
9614	Issue	401	16	
9615	Issue	401	17	
9616	Issue	401	18	
9618	Issue	401	20	
9620	Issue	401	22	
9621	Issue	401	23	
9623	Issue	401	25	
9601	Issue	401	1	Control de versiones de PCBs
9602	Issue	401	2	Minor
9603	Issue	401	3	None
9604	Issue	401	4	None
9608	Issue	401	9	SBM-OBC-NC-00034
9609	Issue	401	10	2021-02-05
9613	Issue	401	15	No
9617	Issue	401	19	Under Analysis
9619	Issue	401	21	No
9624	Issue	401	26	None
9630	Issue	402	6	\N
9631	Issue	402	8	
9634	Issue	402	12	
9635	Issue	402	13	
9636	Issue	402	14	
9638	Issue	402	16	
9640	Issue	402	18	
9644	Issue	402	22	
9645	Issue	402	23	
9647	Issue	402	25	
9625	Issue	402	1	Serigrafías incorrectas en placas EWC29 y EWC30
9626	Issue	402	2	Minor
9627	Issue	402	3	None
9628	Issue	402	4	None
9629	Issue	402	5	SABIA.GSE.EGSE.PM-OBC.EGSE2
9632	Issue	402	9	SBM-GSE-NC-00008
9633	Issue	402	10	2021-01-25
9637	Issue	402	15	No
9639	Issue	402	17	Rework / Redo / Return to Supplier
9641	Issue	402	19	Under Analysis
9642	Issue	402	20	Reemplazar las serigrafías con etiquetas y cubrir con cinta de Kapton para protegerlas.
9643	Issue	402	21	No
9648	Issue	402	26	None
9654	Issue	403	6	\N
9655	Issue	403	8	
9658	Issue	403	12	
9659	Issue	403	13	
9660	Issue	403	14	
9662	Issue	403	16	
9663	Issue	403	17	
9664	Issue	403	18	
9668	Issue	403	22	
9669	Issue	403	23	
9671	Issue	403	25	
9649	Issue	403	1	Analisis listado de partes EEE placa  PWR PMOBC
9650	Issue	403	2	Minor
9651	Issue	403	3	None
9652	Issue	403	4	None
9653	Issue	403	5	SABIA.FS.EM.PM.PM-OBC.A.PWR
9656	Issue	403	9	SBM-OBC-NC-00030
9657	Issue	403	10	2020-12-17
9661	Issue	403	15	No
9665	Issue	403	19	Under Analysis
9666	Issue	403	20	"NRB 17/12/2020: (D.Navas, D.Fernandez, M.Sanahuja, M.Alvarez por CONAE y  A.Perez, N.Balbi, M.Alvarez Bocco por VENG.   Se realiza análisis de los listados vs stock y se disponen acciones.  Ver listado de seguimiento de acciones SBM-OBC-NC-00030. NRB 23/12/2020: (D.Navas, D.Fernandez, M.Sanahuja, M.Alvarez por CONAE y  A.Perez, N.Balbi, M.Alvarez Bocco por VENG.   Se realiza seguimiento del listado de seguimiento de acciones SBM-OBC-NC-00030 NRB 14/01/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1.3 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00030 de VENG.  NRB 04/02/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1.4 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00030 de VENG.  NRB 10/02/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1.5 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00030 de VENG.  NRB 17/02/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1. 6 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00030 de VENG. NRB 24/02/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1. 6 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00030 de VENG. NRB 10/03/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1. 7 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00030 de VENG. NRB 17/03/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1. 8 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00030 de VENG."
9667	Issue	403	21	No
9672	Issue	403	26	None
9678	Issue	404	6	\N
9679	Issue	404	8	
9683	Issue	404	13	
9684	Issue	404	14	
9686	Issue	404	16	
9687	Issue	404	17	
9688	Issue	404	18	
9692	Issue	404	22	
9693	Issue	404	23	
11161	Issue	366	7	
9695	Issue	404	25	
9673	Issue	404	1	Analisis listado de partes EEE placa  COMM PM OBC
9674	Issue	404	2	Minor
9675	Issue	404	3	None
9676	Issue	404	4	None
9677	Issue	404	5	SABIA.FS.EM.PM.PM-OBC.A.COMM
9680	Issue	404	9	SBM-OBC-NC-00029
9681	Issue	404	10	2020-12-17
9682	Issue	404	12	Incoming Inspection / Test
9685	Issue	404	15	No
9689	Issue	404	19	Under Analysis
9691	Issue	404	21	No
11162	Issue	366	11	
8957	Issue	374	5	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01SABIA.FS.EM.PM.PM-OBC.A.GPIO_01
8958	Issue	374	6	
11298	Issue	374	7	
11299	Issue	374	11	
11372	Issue	360	75	VENG
11373	Issue	361	7	\N
11374	Issue	361	11	\N
11375	Issue	361	75	VENG
11376	Issue	362	7	\N
11377	Issue	362	11	\N
11378	Issue	362	75	VENG
11379	Issue	363	7	\N
11380	Issue	363	11	\N
11381	Issue	363	75	VENG
11382	Issue	364	7	\N
11383	Issue	364	11	\N
11384	Issue	364	75	VENG
11385	Issue	366	75	VENG
11386	Issue	369	7	\N
11387	Issue	369	11	\N
11388	Issue	369	75	VENG
11389	Issue	370	7	\N
11390	Issue	370	11	\N
11391	Issue	370	75	VENG
11392	Issue	372	75	VENG
11393	Issue	373	75	VENG
9690	Issue	404	20	"NRB 10/12/20 y 17/12/2020: (D.Navas, D.Fernandez, M.Sanahuja, M.Alvarez por CONAE y  A.Perez, N.Balbi, M.Alvarez Bocco por VENG.   Se realiza análisis de los listados vs stock y se disponen acciones.  Ver listado de seguimiento de acciones SBM-OBC-NC-00029. NRB 23/12/2020: (D.Navas, D.Fernandez, M.Sanahuja, M.Alvarez por CONAE y  A.Perez, N.Balbi, M.Alvarez Bocco por VENG.   Se realiza seguimiento del listado de seguimiento de acciones SBM-OBC-NC-00029  NRB 14/01/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1.3 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00029 de VENG.  NRB 22/01/2020 en reunión técnica de poblado de placas PWR y COMM EM (D.Navas, D.Fernandez, M.Sanahuja, A. Ambrosino por CONAE y A.Perez, M. Ferrer, M. Lopez Ricci y M. García por VENG).  Se toman las siguientes definiciones: . Resistencia M55342E06B330BR: Se necesita cambiar esta resistencia por una de 330 ohms. El part number correcto es “M55342E06B330GRTS”. Se cambiará en el procedimiento de poblado SBM-OBC-PR-00005-A y en donde corresponda. 2. Diodo 1N5822U02BLCC-2. A. Perez confirma con CONAE el uso de esta parte. 3. Jumper de masa 1553, P552725A. Se tiene en stock el P567586A, este PN no es el correcto pero es aceptable su utilización para las placas EM. M. Lopez R., M. Ferrer y A. Perez revisarán la parte P567586. 4. Conector Positronic Sub-D 37 “SND37S5R7NT6G-S1681”. Se utilizará éste PN, por su combinación de tornillos. 5. Estos son los componentes que discrepan en la terminación (S2,TS,BS y WB). Estas terminaciones hacen referencia al empaquetado y no afectan a la funcionalidad del mismo 28/01/21: Email D. Fernández post IRR poblado parcial placa COMM EM: • Resistencia M55342E06B330BR: Se necesita cambiar esta resistencia por una de 330 ohms. El part number correcto es “M55342E06B330GRTS""  OK PARA POBLAR • Diodo 1N5822U02BLCC-2.  OK PARA POBLAR • Jumper de masa 1553. (Entendemos que hay un error en la sección “5 - Disposición”. Ver NC adjunta con comentarios) PREFERIMOS NO POBLAR. ESPERAR EL ARRIBO DEL COMPONENTE “P567586A” EXCEPTO QUE SEA MANDATORIO PARA ESTA FASE POR WORKMANSHIP • Conector Positronic Sub-D 37 “SND37S5R7NT6G-S1681”. Ver comentarios en NC adjunta POBLAR SOLO SI CUMPLE CON LA TERMINACION “S1681”  NRB 04/02/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1.4 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00029 de VENG.  NRB 10/02/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1.5 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00029 de VENG.  NRB 17/02/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1. 6 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00029 de VENG. NRB 24/02/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1. 6 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00029 de VENG. NRB 10/03/2021: Se realiza junto a CONAE el seguimiento de acciones, CONAE actualiza  su listado Componentes PM-OBC a  la versión v1. 7 en base a la cual se actualiza el listado de seguimiento de acciones SBM-OBC-NC-00029 de VENG.  "
9696	Issue	404	26	None
9702	Issue	405	6	\N
9703	Issue	405	8	
9706	Issue	405	12	
9707	Issue	405	13	
9708	Issue	405	14	
9710	Issue	405	16	
9711	Issue	405	17	
9712	Issue	405	18	
9714	Issue	405	20	
9716	Issue	405	22	
9717	Issue	405	23	
9719	Issue	405	25	
9697	Issue	405	1	Puesta en marcha reducida EGSE PM OBC Side B – 16301002
9698	Issue	405	2	Minor
9699	Issue	405	3	None
9700	Issue	405	4	None
9701	Issue	405	5	SABIA.GSE.EGSE.PM-OBC.EGSE2
9704	Issue	405	9	SBM-GSE-NC-00007
9705	Issue	405	10	2020-11-20
9709	Issue	405	15	No
9713	Issue	405	19	Under Analysis
9715	Issue	405	21	No
9720	Issue	405	26	None
9726	Issue	406	6	\N
9727	Issue	406	8	
9730	Issue	406	12	
9731	Issue	406	13	
9732	Issue	406	14	
9734	Issue	406	16	
9735	Issue	406	17	
9736	Issue	406	18	
9738	Issue	406	20	
9740	Issue	406	22	
9741	Issue	406	23	
9743	Issue	406	25	
9721	Issue	406	1	Diferencia en los valores de RTD puesta en marcha reducida EGSE PM OBC Side A – 163401001
9722	Issue	406	2	Minor
9723	Issue	406	3	None
9724	Issue	406	4	None
9725	Issue	406	5	SABIA.GSE.EGSE.PM-OBC.EGSE1
9728	Issue	406	9	SBM-GSE-NC-00006
9729	Issue	406	10	2020-11-02
9733	Issue	406	15	No
9737	Issue	406	19	Under Analysis
9739	Issue	406	21	No
9744	Issue	406	26	None
9749	Issue	407	5	
9750	Issue	407	6	\N
9751	Issue	407	8	
9754	Issue	407	12	
9755	Issue	407	13	
9756	Issue	407	14	
9758	Issue	407	16	
9760	Issue	407	18	
9764	Issue	407	22	
9765	Issue	407	23	
9767	Issue	407	25	
9745	Issue	407	1	Montaje incorrecto de conector en placa extender
9746	Issue	407	2	Minor
9747	Issue	407	3	None
9748	Issue	407	4	None
9752	Issue	407	9	SBM-OBC-NC-00027
9753	Issue	407	10	2020-11-16
9757	Issue	407	15	No
9759	Issue	407	17	Rework / Redo / Return to Supplier
9761	Issue	407	19	Under Analysis
9762	Issue	407	20	" NRB 12/11/2020 Participantes: NBalbi, M.Lopez Ricci, M.Campos, M.Ferrer, A.Perez, M.Alvarez Bocco. 1) Conector incorrecto integrado en placa:    a) Mel debe consultar stock para ver disponibilidad de spare de los conectores que se soldaron ( b) Nico B / A.Perez: analizar uso de estos conectores ya soldados para ver si con el stock disponible se puede cubrir trabajos a futuro. c) Se define armar una nueva placa ya que se disponen todos los componentes en el LIE. (M.Lopez Ricci) Conectores recuperados: J8, J15 (faltan agregar) d) Incluir en el pedido de PCBs de placa adaptadora que va realizar Marcos, incluir la compra de 2 PCB de extender. (TBD) e) Agregar en el procedimiento de poblado un detalle del conector (foto) para completar la información que se entrega al operador. Indicar polaridad. 2) Se define usar reemplazo disponible en LIE: 1502-3 (son prácticamente iguales). Solicitar compra de torretas 1502-4   3) Se gestiona compra local, llegarían el Miércoles 18/11 4) Se modificaria el porta fusible cortando pines para soldarlo SMD.   Solicitar compra de porta fusibles código:   Acciones generales: • Para poder realizar el kitting en storage , se debe contar con el BOM y cantidad exacta de cada componente para evitar errores e incovenientes en el kitting.  (M.Lopez Ricci) • Gestionar compra de los componentes solicitados entre 1 y 4 (M.Lopez Ricci) "
9763	Issue	407	21	No
9768	Issue	407	26	None
9769	Issue	408	1	Error en procedimiento TEST CONTINUIDAD FLASH CURRENT PATCH
9770	Issue	408	2	Minor
11163	Issue	455	7	\N
11164	Issue	455	11	\N
11169	Issue	372	7	\N
11170	Issue	372	11	\N
11167	Issue	371	7	
11168	Issue	371	11	
11165	Issue	367	7	
11166	Issue	367	11	
9773	Issue	408	5	
9775	Issue	408	8	
9777	Issue	408	10	
9778	Issue	408	12	
9779	Issue	408	13	
9780	Issue	408	14	
9782	Issue	408	16	
9784	Issue	408	18	
9785	Issue	408	19	
9788	Issue	408	22	
9789	Issue	408	23	
9791	Issue	408	25	
9792	Issue	408	26	
9771	Issue	408	3	None
9772	Issue	408	4	NR-00095
9774	Issue	408	6	
9776	Issue	408	9	SBM-OBC-NC-00005
9781	Issue	408	15	No
9783	Issue	408	17	Rework / Redo / Return to Supplier
9786	Issue	408	20	Actualizar procedimiento de ensayo
9787	Issue	408	21	No
9799	Issue	409	8	
9803	Issue	409	13	
9804	Issue	409	14	
9813	Issue	409	23	
9815	Issue	409	25	
9816	Issue	409	26	
9793	Issue	409	1	El Harness de TM&TC RS422 del GS-GSE no cumple con las especificaciones de SABIA-Mar
9794	Issue	409	2	Major
9795	Issue	409	3	HW
9796	Issue	409	4	None
9797	Issue	409	5	SABIA.GS.
9798	Issue	409	6	
9800	Issue	409	9	NCR SAB 5339
9801	Issue	409	10	2021-02-01
9802	Issue	409	12	Incoming Inspection / Test
9805	Issue	409	15	No
9806	Issue	409	16	Provisioning/Purchasing
9807	Issue	409	17	Use as is / Continue / Accept
9808	Issue	409	18	Known Cause / Uncertainty in Corrective Action
9809	Issue	409	19	Under Analysis
9810	Issue	409	20	No se genera acción de remediación, la disposición que se usara es “use as is” generando el respectivo RFD o RFW. Esta medida fue validada por el grupo de SE de la misión.
9811	Issue	409	21	No
9812	Issue	409	22	GS-GSE-EM_v1.2
9823	Issue	410	8	
9827	Issue	410	13	
9828	Issue	410	14	
9831	Issue	410	17	
9834	Issue	410	20	
9837	Issue	410	23	
9839	Issue	410	25	
9840	Issue	410	26	
9817	Issue	410	1	Componentes COTS del GS-GSE no cumplen con certificación CE
9818	Issue	410	2	Major
9819	Issue	410	3	HW
9820	Issue	410	4	None
9821	Issue	410	5	SABIA.GS.
9822	Issue	410	6	
9824	Issue	410	9	NCR SAB 5340
9825	Issue	410	10	2021-02-01
9826	Issue	410	12	Internal Audit
9829	Issue	410	15	No
9830	Issue	410	16	Provisioning/Purchasing
9832	Issue	410	18	Known Cause / Uncertainty in Corrective Action
9833	Issue	410	19	Under Analysis
9835	Issue	410	21	No
9836	Issue	410	22	GS-GSE-EM_v1.2
9847	Issue	411	8	
9852	Issue	411	14	
9858	Issue	411	20	
9860	Issue	411	22	
9861	Issue	411	23	
9863	Issue	411	25	
9864	Issue	411	26	
9841	Issue	411	1	Diodo caliente en SBC
9842	Issue	411	2	Minor
9843	Issue	411	3	HW
9844	Issue	411	4	None
9845	Issue	411	5	SABIA.FS.EM.PM.PM-OBC.A.SBC
9846	Issue	411	6	
9848	Issue	411	9	SBM-OBC-NC-00028
9849	Issue	411	10	2020-12-10
9850	Issue	411	12	In Process / Final Inspection / Test (non operational)
9851	Issue	411	13	SABIA.FS.EM.PM.PM-OBC.A.SBC_01
9853	Issue	411	15	No
9854	Issue	411	16	Electronic / Electrical
9855	Issue	411	17	Rework / Redo / Return to Supplier
9856	Issue	411	18	Known Cause / Certain Corrective Action
9857	Issue	411	19	Design Deficiency
9859	Issue	411	21	No
9871	Issue	412	8	
9879	Issue	412	17	
9884	Issue	412	22	
9885	Issue	412	23	
9865	Issue	412	1	Faltante de componentes para poblado de placa PWR EM
9866	Issue	412	2	Minor
9867	Issue	412	3	HW
9868	Issue	412	4	None
9869	Issue	412	5	SABIA.FS.EM.PM.PM-OBC.A.PWR_01
9870	Issue	412	6	
9872	Issue	412	9	SBM-OBC-NC-00033
9873	Issue	412	10	2021-01-25
9874	Issue	412	12	Others
9875	Issue	412	13	SABIA.FS.EM.PM.PM-OBC.A.PWR_01
9876	Issue	412	14	PWR-EM-01
9877	Issue	412	15	No
11187	Issue	414	7	\N
11188	Issue	414	11	\N
11197	Issue	424	7	
11198	Issue	424	11	
11191	Issue	418	7	
11192	Issue	418	11	
11189	Issue	415	7	
11190	Issue	415	11	
11185	Issue	413	7	
11183	Issue	412	7	
11184	Issue	412	11	
11173	Issue	381	7	
11174	Issue	381	11	
9887	Issue	412	25	
9888	Issue	412	26	
9878	Issue	412	16	Material
9880	Issue	412	18	Known Cause / Certain Corrective Action
9881	Issue	412	19	Under Analysis
9882	Issue	412	20	No poblar los componentes faltantes. No poblar aquellos componentes que puedan afectar el futuro poblado de los faltantes actuales.  28/01/21 Email de D. Fernández post IRR poblado placa PWR EM •\tEl opto acoplador (66266-001) necesita conformado pero aún no arribo según la información con la que contamos. Entendemos que debería estar como faltante en la NC SBM-OBC-NC-00033.  En el documento “Componentes Conformados.doc” figura como disponible y conformado.       NO POBLAR. Deberían estar como faltantes y sin conformar. CONFIRMAR con LIE. Por qué no figura como faltante? •\tDCDCs. Del reporte “Componentes Conformados.doc” se entiende que los DCDCs están disponibles y conformados. M3GB2803R3S/EM Hybrid Hi-Rel Rad-Hard DC-DC Converter  M3GB280512T/EM Hybrid Hi-Rel Rad-Hard DC-DC Converter Están disponibles? Ya están conformados? NO POBLAR. Aclarar si están en stock. Indicar si están conformados. •\tLos siguientes componentes nos figuran como faltantes pero no los vemos en la NC. Llegarían el 05/2021. Recomendamos no poblar hasta aclarar la discrepancia. FLTM/C/47 Capacitive 10 Amp. Feed-thru Panel Mount  FLTM/P/5000 LC Pi - 10 Amp. Feedthru Panel Mount NO POBLAR •\tRES SMD 100K OHM 0.1% 1/8W 0805 M55342E06B100BR. Entendemos que está en Stock el equivalente M55342E06B100BRWS. REVISAR. SE PODRIA POBLAR
9883	Issue	412	21	No
9895	Issue	413	8	
9903	Issue	413	17	
9904	Issue	413	18	
9908	Issue	413	22	
9909	Issue	413	23	
9911	Issue	413	25	
9912	Issue	413	26	
9889	Issue	413	1	Faltante de componentes para poblado de placa COMM EM
9890	Issue	413	2	Minor
9891	Issue	413	3	HW
9892	Issue	413	4	None
9893	Issue	413	5	SABIA.FS.EM.PM.PM-OBC.A.COMM_01
9894	Issue	413	6	
9896	Issue	413	9	SBM-OBC-NC-00032
9897	Issue	413	10	2021-01-25
9898	Issue	413	12	Others
9899	Issue	413	13	SABIA.FS.EM.PM.PM-OBC.A.COMM_01 
9900	Issue	413	14	COMM-EM-01
9901	Issue	413	15	No
9902	Issue	413	16	Material
9905	Issue	413	19	Under Analysis
9906	Issue	413	20	No poblar los componentes faltantes. No poblar aquellos componentes que puedan afectar el futuro poblado de los faltantes actuales.  28/01/21 Email de D. Fernández, post IRR de poblado parcial placa COMM EM: •\tHS9G-26C31RH/PROTO   A nosotros nos figura que el componente "HS9G-26C31RH/PROTO" no arribó y que necesita conformado. Entendemos que debería figurar en la NC “SBM-OBC-NC-00032”.  Tampoco lo identificaron en el listado de “Componentes Conformados.doc” como componente que requiera conformado.  PEDIMOS NO POBLAR HASTA ACLARAR
9907	Issue	413	21	No
9919	Issue	414	8	
9923	Issue	414	13	
9935	Issue	414	25	
9936	Issue	414	26	
9913	Issue	414	1	Cortex Telecommand bit rate limited
9914	Issue	414	2	Major
9915	Issue	414	3	SW
9916	Issue	414	4	OC: 1515/19     
9917	Issue	414	5	  \r\nSABIA.GSE.GS-GSE.Phase1                           \r\n  
9918	Issue	414	6	
9920	Issue	414	9	SAB-797
9921	Issue	414	10	2018-04-24
9922	Issue	414	12	Supplier Audit Customer Complaint
9924	Issue	414	14	CONAE 14966  
9925	Issue	414	15	No
9926	Issue	414	16	Software Code
9927	Issue	414	17	Correct / Repair / Fix
9928	Issue	414	18	Known Cause / Certain Corrective Action
9929	Issue	414	19	Equipment Malfunction
9930	Issue	414	20	The needed license to cover the requirement was purchased and was updated in the hardware. See the attached report.
9931	Issue	414	21	No
9932	Issue	414	22	Cortex Zodiac INSNEC (F)
9933	Issue	414	23	An equipment that hasn't been selected according to SABIAMAR mission needs was used, so the requirement wasn't completely covered, in this case a reused equipment (cortex) from another mission (SAC D) was used.
9943	Issue	415	8	
9944	Issue	415	9	
9945	Issue	415	10	
9946	Issue	415	12	
9947	Issue	415	13	
9950	Issue	415	16	
9952	Issue	415	18	
9953	Issue	415	19	
9960	Issue	415	26	
9937	Issue	415	1	7E CELL OUT OF CRITERIA DURING CHARGE RETENTION TEST AFTER VIBRATION
9938	Issue	415	2	Major
9939	Issue	415	3	HW
9940	Issue	415	4	224/17      
9941	Issue	415	5	SABIA.FS.FM.SM.PCS.BAT
9948	Issue	415	14	8S8P VES16       
9949	Issue	415	15	No
9951	Issue	415	17	Rework / Redo / Return to Supplier
9954	Issue	415	20	Anyway, in order to confirm the flightworthiness of the battery, it is proposed to perform a 2-day mission cycling with individual cell voltage monitoring in order to confirm good cells electrical behaviour and the way the string unbalance decrease.These results will be described to the customer for its approbation.Then, if an agreement is found between the two parties. It is proposed to take advantage of the late time of battery delivery to keep the battery in storage in Saft facilities in order to observe spread evolution and determine the periodicity necessary for maintenance.Saft considers the battery flightworthy and acceptable for Sabia-Mar mission, providing successful 2-day mission cycling test. Frequency of light maintenance must be increased up to every 2-3 months.De : Javier Marin <jmarin@conae.gov.ar> Envoyé : jeudi 12 décembre 2019 20:32À : CHOCINSKI David <David.CHOCINSKI@saftbatteries.com>; 'Edgardo Roggero' <roggero@conae.gov.ar>Cc : PATHE Francoise <Francoise.PATHE@saftbatteries.com>; CLEMENTE Jacky <jacky.clemente@saftbatteries.com>; BONNET Laurent <Laurent.BONNET@saftbatteries.com>Objet : RE: Sabia-Mar - Non-conformance during acceptance test of FM Dear David, Regarding Non-conformance report N° S3316-19 and taking into account that: -          The variation in the self-discharge before and after the vibration test is significant and does not meet the pass/fail criteria (increasing the self-discharge unlike other cells whose self-discharge decreases), so it is inferred a degradation in the cell.-          Root cause of the NC was not clearly identified: Saft indicate that could be the presence of microscopic particles that after vibration are deposited on a non-desirable place which causes this permanent phenomena in this particular cell.-          It is not guaranteed that the degradation does not get worsen with the following vibrations at system tests and during flight.-          The increase in maintenance from 2 to 3 times the nominal amount per year (instead 1 every 6 months) increases maintenance costs for CONAE.-          The failed battery was submitted to acceptance vibration levels which were lower than the original level requested on requirement 38 of the SOW: CONAE has accept this initial reduction, assuming a risk but according to req N° 31, the battery  shall withstand the test levels without failure or degradation.-          Additional battery capacity is a margin that we shall keep for system tests and/or flight, the battery shall be provided without any degradation or failure. For the above reasons, CONAE Consider that requirement 31 of the SOW was not compliant, so the failed battery is not acceptable for flight.Following MRB meeting on 05/12/2020 and CONAE e-mail dated 12/12/2019, a new battery will be manufactured to replace this one.For that, the current FM battery will be dismantled in order to re-use? Flanges and connector bearers? Harnesses including thermostats? The two covers? The eight PCBAsAll these parts will be cleaned after dismounting and inspectedNew parts have been ordered to allow the manufacturing of the new battery? Heaters & thermistors? Base plate and top plates? Cells? Screws, washers, connections, ......New FM battery manufactured. See Battery MIP report before test Ref S1727-20.
9955	Issue	415	21	No
9956	Issue	415	22	Battery
9959	Issue	415	25	FM
10055	Issue	419	25	
10056	Issue	419	26	
11193	Issue	422	7	\N
11194	Issue	422	11	\N
11195	Issue	423	7	
9942	Issue	415	6	
11179	Issue	410	7	
11180	Issue	410	11	
11177	Issue	409	7	
11178	Issue	409	11	
11175	Issue	384	7	
11176	Issue	384	11	
11181	Issue	411	7	
11182	Issue	411	11	
9957	Issue	415	23	This kind of cell behaviour has been observed several times by SAFT in previous program such as Iridium Next. The most probable reason is the presence of a microscopic particle revealed by vibrations which involve self-discharge increase.\r\n\r\nNo impact on performance of the battery is to consider as per capacity and internal resistance measurement. It worth remind the battery is sized to comply with one string loss anyway.\r\n\r\nThe only consequence for the customer is to plan more recurrent light maintenance procedure as described in the User Manual S1574-18, §10.3.2 (roughly assessed at every 2-3 months instead of every 6 months).
9967	Issue	416	8	
9969	Issue	416	10	
9970	Issue	416	12	
9971	Issue	416	13	
9974	Issue	416	16	
9975	Issue	416	17	
9976	Issue	416	18	
9977	Issue	416	19	
9981	Issue	416	23	
9983	Issue	416	25	
9984	Issue	416	26	
9961	Issue	416	1	Cable Camera Link incorrecto - OEM Alivness Test
9962	Issue	416	2	Minor
9963	Issue	416	3	None
9964	Issue	416	4	None
9965	Issue	416	5	SABIA.FS.PFM.PM.INST.NS.OB
9966	Issue	416	6	
9968	Issue	416	9	0965PAQ0005
9972	Issue	416	14	-
9973	Issue	416	15	No
9978	Issue	416	20	Consultar a INVAP Córdoba si tiene un cable SDR-SDR para poder ejecutar el procedimiento 0965-PMNI-3PCEO-001-A.
9979	Issue	416	21	No
9980	Issue	416	22	OEM
9991	Issue	417	8	
9993	Issue	417	10	
9994	Issue	417	12	
9995	Issue	417	13	
9998	Issue	417	16	
9999	Issue	417	17	
10000	Issue	417	18	
10001	Issue	417	19	
10005	Issue	417	23	
10007	Issue	417	25	
10008	Issue	417	26	
9985	Issue	417	1	Imposibilidad Envío de Comandos a OEM Alivness Test
9986	Issue	417	2	Minor
9987	Issue	417	3	None
9988	Issue	417	4	None
9989	Issue	417	5	SABIA.FS.PFM.PM.INST.NS.OB
9990	Issue	417	6	
9992	Issue	417	9	0965PAQ0006
9996	Issue	417	14	1542S9568
9997	Issue	417	15	No
10002	Issue	417	20	Cumplimentar el procedimiento 0965-PMNI-3PCEO-001-A Procedimiento PEM GA1280JS-12.5-OEM-NIR, con la aplicación de Sw de comunicación complementario.
10003	Issue	417	21	No
10004	Issue	417	22	OEM
10015	Issue	418	8	
10019	Issue	418	13	
10031	Issue	418	25	
10032	Issue	418	26	
10009	Issue	418	1	Componente dañado starter kit OEM Nº3
10010	Issue	418	2	Major
10011	Issue	418	3	HW
10012	Issue	418	4	OC 162/15. Rotulo CONAE: 23634   
10013	Issue	418	5	SABIA.FS.EM.PM.VISNIR.OEM 
10014	Issue	418	6	
10016	Issue	418	9	0965CT0001
10017	Issue	418	10	2017-02-10
10018	Issue	418	12	Incoming Inspection / Test
10020	Issue	418	14	1542S9568
10021	Issue	418	15	No
10022	Issue	418	16	Damage
10023	Issue	418	17	Use as is / Continue / Accept
10024	Issue	418	18	Known Cause / Certain Corrective Action
10025	Issue	418	19	Procedure Inadequate
10026	Issue	418	20	De acuerdo con la recomendación del proveedor y con la necesidad de iniciar el ensayo, se colocó rtv 566 sobre el componente dañado con el fin de asegurar su estabilidad mecánica e impedir movimientos durante el armado de setup dentro de la cámara de termovacio.
10027	Issue	418	21	No
10028	Issue	418	22	GA1280JS-12.5-NIR OEM Camera #3 / Starter Kit OEM #3
10029	Issue	418	23	Se utilizó el procedimiento estándar de integración de termocuplas. Este procedimiento indica utilizar pinza de Bruselas para pegar la termocuplas a la superficie correspondiente. Esta operación daño un componente ya que la pinza es relativamente mas grande, e impidió observar el componente.
10039	Issue	419	8	
10041	Issue	419	10	
10042	Issue	419	12	
10043	Issue	419	13	
10046	Issue	419	16	
10048	Issue	419	18	
10049	Issue	419	19	
10053	Issue	419	23	
10033	Issue	419	1	SABIAMAR - Payload - NIR - SWIR - OEM #3 - Falla en despresurización en la CTVO
10034	Issue	419	2	Minor
10035	Issue	419	3	None
10036	Issue	419	4	None
10037	Issue	419	5	SABIA.FS.PFM.PM.INST.NS.OB
10038	Issue	419	6	
10040	Issue	419	9	0965PAQ0008
10044	Issue	419	14	154259568
10045	Issue	419	15	No
10047	Issue	419	17	Correct / Repair / Fix
10051	Issue	419	21	No
10052	Issue	419	22	OEM
11215	Issue	442	7	\N
11216	Issue	442	11	\N
11221	Issue	445	7	
11222	Issue	445	11	
11209	Issue	439	7	
11205	Issue	428	7	
11206	Issue	428	11	
11203	Issue	427	7	
11204	Issue	427	11	
11201	Issue	426	7	
11202	Issue	426	11	
11211	Issue	440	7	
11212	Issue	440	11	
10050	Issue	419	20	Se detectó que la imposibilidad de lograr alto vacio estaba determinada en una fuga en el pasante del cable del OEM. La solución propuesta esta utilizar otro pasante, tapar (Tapa ciega) el agujero del pasante actual, para lo cual se debe colocar todo el tramo de cable dentro de la cámara CTVO.
10063	Issue	420	8	
10065	Issue	420	10	
10066	Issue	420	12	
10067	Issue	420	13	
10077	Issue	420	23	
10080	Issue	420	26	
10057	Issue	420	1	Recepcion Emuladores y PC - No correspondencia con S/N y documentación.
10058	Issue	420	2	Minor
10059	Issue	420	3	HW
10060	Issue	420	4	None
10061	Issue	420	5	SABIA.GSE.EGSE
10062	Issue	420	6	
10064	Issue	420	9	0965PAQ0012
10068	Issue	420	14	162101001/162101003/162101004
10069	Issue	420	15	No
10070	Issue	420	16	Identification
10071	Issue	420	17	Correct / Repair / Fix
10072	Issue	420	18	Unknown Cause / Certain Corrective Action
10073	Issue	420	19	Cause Unknown
10074	Issue	420	20	Como solución propuesta se acuerda realizar sobre  los equipos en poder de INVAP (CIE3, CIE4 y SSRIE) la misma acción que se realizó sobre el CIE2 en el CETT. La acción aplicada se encuentra detallada en el archivo Solucion propuesta NC 0965PAQ0012.rar. Se deben cambiar la etiquetas de PN y SN del CIE3, CIE4 y SSRIE para que queden de acuerdo a la documentación vigente.
10075	Issue	420	21	No
10076	Issue	420	22	Emuladores y PC
10079	Issue	420	25	EM
10087	Issue	421	8	
10089	Issue	421	10	
10090	Issue	421	12	
10091	Issue	421	13	
10094	Issue	421	16	
10096	Issue	421	18	
10097	Issue	421	19	
10101	Issue	421	23	
10103	Issue	421	25	
10104	Issue	421	26	
10081	Issue	421	1	Recepcion OEM SN 1542S9569 - GA1280JS-12.5 SN 1540S9499 / Suciedad en las lentes
10082	Issue	421	2	Minor
10083	Issue	421	3	None
10084	Issue	421	4	None
10085	Issue	421	5	SABIA.FS.PFM.PM.INST.NS.OB
10086	Issue	421	6	
10088	Issue	421	9	0965PAQ0013
10092	Issue	421	14	OEM SN 1542S9569 - GA1280JS-12.5 SN 1540S9499
10093	Issue	421	15	No
10095	Issue	421	17	Use as is / Continue / Accept
10098	Issue	421	20	Usar como está, acondicionar para su entrada a cuarto limpio de óptica. Limpiar el maletín..
10099	Issue	421	21	No
10100	Issue	421	22	OEM
10110	Issue	422	6	\N
10111	Issue	422	8	
10120	Issue	422	18	
10121	Issue	422	19	
10125	Issue	422	23	
10127	Issue	422	25	
10128	Issue	422	26	
10105	Issue	422	1	SABIAMAR - Lentes Prototipo de NIR-SWIR - Fallas en la aplicación de pintura negra
10106	Issue	422	2	Major
10107	Issue	422	3	HW
10108	Issue	422	4	465430 (INVAP)
10109	Issue	422	5	SABIA.FS.EM.PM.INST.VN.OB
10112	Issue	422	9	0965PAQ0014
10113	Issue	422	10	2018-08-28
10114	Issue	422	12	Incoming Inspection / Test
10115	Issue	422	13	NA
10116	Issue	422	14	18004IC04000190J
10117	Issue	422	15	No
10118	Issue	422	16	Finish
10119	Issue	422	17	Use as is / Continue / Accept
10122	Issue	422	20	Se propone dar curso a la tercer alternativa discutida en la minuta.Proyecto SABIA-MAr sugiere tomar la siguiente accion:Atento a que: ·         El proveedor de los cristales del Modelo de Desarrollo del OEM de la NIR-SWIR, no cumplió con los estándares de calidad esperados.·         Los cristales de este modelo ya fueron adquiridos.·         Invap propuso varias alternativas para manejar esta situación.  Se decidió:·         Reemplazar al proveedor de los cristales para los modelos siguientes.·         Continuar con el plan vigente de integración y ensayos de este modelo de desarrollo utilizando los cristales defectuosos.·         Luego de finalizar los ensayos previstos sobre este modelo, se decidirá sobre la necesidad de realizar algún otro modelo de desarrollo adicional que incluya lentes del nuevo proveedor.
10123	Issue	422	21	No
10124	Issue	422	22	Lentes Prototipo NIR-SWIR
10135	Issue	423	8	
10137	Issue	423	10	
10144	Issue	423	18	
10129	Issue	423	1	SABIAMAR, Magnetómetros C-0965-002 y C-0965-003, canal R con bobina desconectada
10130	Issue	423	2	Major
10131	Issue	423	3	HW
10132	Issue	423	4	TBC
10133	Issue	423	5	SABIA.FS.PFM.SM.AOCS.TAM
10134	Issue	423	6	
10136	Issue	423	9	0965SIE0424
10138	Issue	423	12	Incoming Inspection / Test
10139	Issue	423	13	NA
10140	Issue	423	14	C-0965-002 y C-0965-003
10141	Issue	423	15	No
10142	Issue	423	16	Soldering
11233	Issue	456	7	\N
11234	Issue	456	11	\N
11235	Issue	457	7	\N
11236	Issue	457	11	\N
11219	Issue	444	7	
11220	Issue	444	11	
11217	Issue	443	7	
11218	Issue	443	11	
11213	Issue	441	7	
11214	Issue	441	11	
11171	Issue	373	7	
11172	Issue	373	11	
11394	Issue	374	75	VENG
10149	Issue	423	23	
10151	Issue	423	25	
10152	Issue	423	26	
10143	Issue	423	17	Rework / Redo / Return to Supplier
10145	Issue	423	19	Under Analysis
10146	Issue	423	20	En el procedimiento de armado de los TAM se colocará una recomendación para la etapa de Poteado de cabezales con Scotchweld.
10147	Issue	423	21	No
10148	Issue	423	22	Three Axis Magnetometer
10159	Issue	424	8	
10162	Issue	424	12	
10168	Issue	424	18	
10169	Issue	424	19	
10173	Issue	424	23	
10175	Issue	424	25	
10176	Issue	424	26	
10153	Issue	424	1	Desprendimiento de coating en probetas para ensayos de fretting
10154	Issue	424	2	Major
10155	Issue	424	3	HW
10156	Issue	424	4	None
10157	Issue	424	5	SABIA.FS.PFM.SM.PCS.SA.R&R
10158	Issue	424	6	
10160	Issue	424	9	0965E&M0011
10161	Issue	424	10	2019-05-06
10163	Issue	424	13	NA
10164	Issue	424	14	N/A
10165	Issue	424	15	No
10166	Issue	424	16	Conformal Coating
10167	Issue	424	17	Rework / Redo / Return to Supplier
10170	Issue	424	20	Debido a la indisponibilidad de la máquina que realiza el recubrimiento y a la imposibilidad de garantizar que dicho recubrimiento cumple con los requerimientos de las piezas, se decide NO utilizar este recubrimiento ni esta máquina para dichas piezas. En su lugar las piezas utilizaran un recubrimiento distinto acordado entre las partes, que es realizado por otra máquina.Se descartan las probetas.Se analizará en conjunto con CONAE otras alternativas.
10171	Issue	424	21	No
10172	Issue	424	22	Restrain Releases
10183	Issue	425	8	
10184	Issue	425	9	
10185	Issue	425	10	
10187	Issue	425	13	
10190	Issue	425	16	
10192	Issue	425	18	
10193	Issue	425	19	
10197	Issue	425	23	
10199	Issue	425	25	
10200	Issue	425	26	
10177	Issue	425	1	Durante los ensayso de inspeccion electricos de la SBC A EM, se dobla un pin del U1LL Level traslator
10178	Issue	425	2	Major
10179	Issue	425	3	HW
10180	Issue	425	4	None
10181	Issue	425	5	SABIA.FS.EM.PM.PM-OBC.A.SBC      
10182	Issue	425	6	
10186	Issue	425	12	In Process / Final Inspection / Test (non operational)
10188	Issue	425	14	SBC_EM_001      
10189	Issue	425	15	No
10191	Issue	425	17	Use as is / Continue / Accept
10194	Issue	425	20	Ya que este inconveniente surgio sobre una addenda de inspeccion de la reparacion que hubo de realizarse sobre el PCB de acuerdo a la NCR6 y no se debera ejecutar sobre el FM, dicha adenda al procedimiente en cuestion no se volvera a ejecutar y no requiere actualizacion, sin embargo se deberan verificar los procedimeintos de inspeccion de todas las placas para ver en aquellos casos donde se mida continuidad sobre algun IC especificar q se haga en el pad de soldadura o, en caso que no sea factible, eliminar esa medicion del procedimientoSe realizo la inspeccion sobre la IAB A EM sin inconvenientes, no se midio sobre ningun pin, la medicion de la la SBC fue debida a la reparacion requerida
10195	Issue	425	21	No
10196	Issue	425	22	Placa Single Board Computer de la PM-OBC EM
10207	Issue	426	8	
10208	Issue	426	9	
10209	Issue	426	10	
10211	Issue	426	13	
10214	Issue	426	16	
10216	Issue	426	18	
10217	Issue	426	19	
10221	Issue	426	23	
10223	Issue	426	25	
10224	Issue	426	26	
10201	Issue	426	1	Durante el MIP se cae la SBC EM del soporte, se golpea y doblan los terminales del transistor Q2P
10202	Issue	426	2	Major
10203	Issue	426	3	HW
10204	Issue	426	4	None
10205	Issue	426	5	SABIA.FS.EM.PM.PM-OBC.A.SBC                       
10206	Issue	426	6	
10210	Issue	426	12	In Process / Final Inspection / Test (non operational)
10212	Issue	426	14	SBC_EM_001            
10213	Issue	426	15	No
10215	Issue	426	17	Use as is / Continue / Accept
10218	Issue	426	20	Se debera modificar el soporte de forma tal que quede el PCB fijo en el mismo sin posibilidad de deslizarseSe fabrico un soporte para sostener los PCBs durante su inspeccion y pueta en marcha como se observa en las figuras adjuntas.El mismo fue utilizado durante la puesta en marcha de la SBC sin inconvenientes
10219	Issue	426	21	No
10220	Issue	426	22	Placa Single Board Computer de la PM-OBC EM
10231	Issue	427	8	
10232	Issue	427	9	
10233	Issue	427	10	
10234	Issue	427	12	
10235	Issue	427	13	
10225	Issue	427	1	Problemas en montado de torretas en PCBs de PM-OBC EM
10226	Issue	427	2	Major
10227	Issue	427	3	HW
10228	Issue	427	4	None
10229	Issue	427	5	SABIA.FS.EM.PM.PM-OBC
10230	Issue	427	6	
11229	Issue	453	7	\N
11230	Issue	453	11	\N
11231	Issue	454	7	
11232	Issue	454	11	
11227	Issue	448	7	
11228	Issue	448	11	
11225	Issue	447	7	
11226	Issue	447	11	
11301	DmsfFolder	47	48	
10236	Issue	427	14	
10238	Issue	427	16	
10240	Issue	427	18	
10241	Issue	427	19	
10245	Issue	427	23	
10247	Issue	427	25	
10248	Issue	427	26	
10237	Issue	427	15	No
10239	Issue	427	17	Use as is / Continue / Accept
10242	Issue	427	20	Se tomaron acciones para revisar todas los PCBs de la PM-OBC no solo para el caso de las torretas sino para todos los casos de thruholes de partes cuyos agujeros sean no estándar.Para el caso del PCB del modelo EM de la PM-OBCs la disposición será ?use as is? utilizando el siguiente procedimiento.Pasos:1) "Remachado" de Turret con la herramienta correspondiente antes de posicionar en la placa (sin montar en el PCB)2) Montaje de Turret sobre el PCB (insertando por Bottom)3) Soldado de Turret (image005.jpg)Se implemento esta solucion en la placa EM sin inconvenientes:(image006.jpg)Para el caso de la PM-OBC FM, se rediseñará el PCB utilizando agujeros de 2,29mm para arreglar el problema.Con respecto al resto de los PCBs de la PM-OBC, se rediseñarán no solo el Backplane sino también los PCBs de Power lado A y B y el Extender Board ya que tienen el mismo inconveniente. El resto de las placas (SBC, IAB, GPIO, TAB, AVAB, COMM, TCB) no se rediseñarán ya que, si bien tienen este inconveniente, las torretas en dichas placas se utilizarían para alimentar la placa stand alone, cosa q es factible hacer también con el extender por lo que para los ensayos se utilizara el extender para alimentar los diferentes PCBs populados y las torretas no se popularan Se verifican los gerber de final de fase C y se observa que se corrigió el plano de fabricaciónPower A y B:(image007.jpg)Backplane A y B:(image008.jpg)
10243	Issue	427	21	No
10244	Issue	427	22	PM-OBC Engineering Model - Backplane Side A 
10255	Issue	428	8	
10260	Issue	428	14	
10269	Issue	428	23	
10271	Issue	428	25	
10272	Issue	428	26	
10249	Issue	428	1	DESCONEXION GRMON ENSAYO FLASH COMPLETO
10250	Issue	428	2	Major
10251	Issue	428	3	HW
10252	Issue	428	4	None
10253	Issue	428	5	SABIA.FS.EM.PM.PM-OBC.A.SBC
10254	Issue	428	6	
10256	Issue	428	9	SBM-OBC-NC-00026
10257	Issue	428	10	2020-09-29
10258	Issue	428	12	Others
10259	Issue	428	13	SABIA.FS.EM.PM.PM-OBC.A.SBC_01
10261	Issue	428	15	No
10262	Issue	428	16	Electronic / Electrical
10263	Issue	428	17	Rework / Redo / Return to Supplier
10264	Issue	428	18	Known Cause / Certain Corrective Action
10265	Issue	428	19	Under Analysis
10266	Issue	428	20	El estado y seguimiento de las acciones derivadas de las NRB se detallan en la lista de seguimiento SBM-OBC-NC-00026 Listado_Seguimiento_No_Conformidad_Desconexion_GRMON_Ensayo_Flash_completo NRB 30/09/2020 y 02/10/2020 Participantes: L.Garategaray, D.Carusso, G.Wiman, D.Fernandez, M.Buczyner, NBalbi, A.Alvarez, M.Alvarez Bocco, F.Finochio, E.Kunysz, A.perez, E.Brac, J.Iñigo, E.Roggero 1.    Revisar el setup en general, BoB. 2.    Revisar cable Db50-Db15 3.    Fallo de ejecución “hello world” (desconexión GRMON) 3.1    Realizar el borrado de las memorias de Bootloader. Se debe redactar procedimiento. 3.2    Intentar repetir la falla. Generar un procedimiento (Hay que generar el procedimiento), sin realizar ningún cambio en el setup, respecto al ensayo donde se detecta la falla. 3.3    Posteriormente, realizar el ensayo con las siguientes modificaciones:     Ejecutar hello world     Utilizar fuente con capacidad de logear.. Se dispone de fuentes 1kW, salida simple, rackebles. Son necesarias dos (5v y 3v3, tenemos 4 disponibles). Tener en cuenta como se complica la logística del setup con fuentes de ese tamaño.   Osciloscopio en jumper J1L, lado FPGA, single sweep, trigger flanco negativo en 3V   Osciloscopio en 2.5 V del UT699.   Ver de implementar algún método o acción que permita identificar el origen del supuesto reset del procesador.                  3.3 Realizar verificación pasiva en jumpes de la placa y verificar su conexión. 4.    Acciones en paralelo: 4.1    Consultar en foros el significado del mensaje de desconexión de GRMON durante la ejecución de código. VENG VE. 4.2 Ver de qué manera, una falla tanto en la fuente de 3V como en la de 5V, podría afectar el funcionamiento en las memorias. VENG A. Perez. 4.3    Interacción formal CONAE-Gaisler. NRB 08/10/2020 y 09/10/2020 Participantes: L.Garategaray, D.Carusso, G.Wiman, D.Fernandez, NBalbi, A.Alvarez, M.Alvarez Bocco, F.Finochio, E.Kunysz, A.perez, E.Brac, J.Iñigo, A.Ambrosino Se verificó que existen consumos próximos al limite de corriente con el que esta seteada la fuente de 5V de 1,6 A que son los que generen la desconexión del GRMON, por lo que al incrementar el limite de corriente en la fuente de 5V de 1,6A a 2,4 A, desaparece la falla. 5.    Revisar as run del ensayo del 02/03/2020 en Balcarce donde M.Buczyner y G.Gonzalez tuvieron inconvenientes en el seteo de la fuente de 5 V, donde lo elevaron de 1,6 A a 2,4 A 6.    Hacer análisis de los CFI obtenido en el ensayo de GRMON. / flash completo. Además de todos los logs generados en los ensayos, verificando que se obtuvo lo que se planificaba. (prioridad alta) 7.    Analizar el evento de que una vez conectada la SBC, en 3,3V cae la tensión.
10267	Issue	428	21	No
10268	Issue	428	22	Placa SBM EM-01 
10277	Issue	429	5	
10279	Issue	429	8	
10281	Issue	429	10	
10282	Issue	429	12	
10283	Issue	429	13	
10284	Issue	429	14	
10286	Issue	429	16	
10287	Issue	429	17	
10288	Issue	429	18	
10290	Issue	429	20	
10292	Issue	429	22	
10293	Issue	429	23	
10295	Issue	429	25	
10296	Issue	429	26	
10273	Issue	429	1	Faltante de tornillos platina 1553  placa COMM
10274	Issue	429	2	Minor
10275	Issue	429	3	None
10276	Issue	429	4	None
10278	Issue	429	6	
10280	Issue	429	9	SBM-STO-NC-00005
10285	Issue	429	15	No
10289	Issue	429	19	Under Analysis
10291	Issue	429	21	No
10301	Issue	430	5	
10303	Issue	430	8	
10305	Issue	430	10	
10306	Issue	430	12	
10307	Issue	430	13	
10308	Issue	430	14	
10297	Issue	430	1	CAJAS DE TRANSPORTE ABIERTAS EN OC 14/19
10298	Issue	430	2	Minor
10299	Issue	430	3	None
10300	Issue	430	4	None
10302	Issue	430	6	
10304	Issue	430	9	SBM-STO-NC-00004
11238	DmsfFolder	44	48	
11239	DmsfFolder	44	49	
11241	DmsfFolder	45	48	
11242	DmsfFolder	45	49	
10310	Issue	430	16	
10312	Issue	430	18	
10314	Issue	430	20	
10316	Issue	430	22	
10317	Issue	430	23	
10319	Issue	430	25	
10320	Issue	430	26	
10309	Issue	430	15	No
10311	Issue	430	17	Use as is / Continue / Accept
10313	Issue	430	19	Under Analysis
10315	Issue	430	21	No
10325	Issue	431	5	
10327	Issue	431	8	
10329	Issue	431	10	
10330	Issue	431	12	
10331	Issue	431	13	
10332	Issue	431	14	
10334	Issue	431	16	
10336	Issue	431	18	
10338	Issue	431	20	
10340	Issue	431	22	
10341	Issue	431	23	
10343	Issue	431	25	
10344	Issue	431	26	
10321	Issue	431	1	RECEPCIÓN DE MODULOS DE ENERGIA
10322	Issue	431	2	Minor
10323	Issue	431	3	None
10324	Issue	431	4	None
10326	Issue	431	6	
10328	Issue	431	9	SBM-STO-NC-00003
10333	Issue	431	15	No
10335	Issue	431	17	Use as is / Continue / Accept
10337	Issue	431	19	Under Analysis
10339	Issue	431	21	No
10349	Issue	432	5	
10351	Issue	432	8	
10353	Issue	432	10	
10354	Issue	432	12	
10355	Issue	432	13	
10356	Issue	432	14	
10358	Issue	432	16	
10360	Issue	432	18	
10362	Issue	432	20	
10364	Issue	432	22	
10365	Issue	432	23	
10367	Issue	432	25	
10368	Issue	432	26	
10345	Issue	432	1	RECEPCIÓN DE MATERIALES SABIAMAR
10346	Issue	432	2	Minor
10347	Issue	432	3	None
10348	Issue	432	4	None
10350	Issue	432	6	
10352	Issue	432	9	SBM-STO-NC-00002
10357	Issue	432	15	No
10359	Issue	432	17	Use as is / Continue / Accept
10361	Issue	432	19	Under Analysis
10363	Issue	432	21	No
10373	Issue	433	5	
10375	Issue	433	8	
10377	Issue	433	10	
10378	Issue	433	12	
10379	Issue	433	13	
10380	Issue	433	14	
10382	Issue	433	16	
10383	Issue	433	17	
10384	Issue	433	18	
10386	Issue	433	20	
10388	Issue	433	22	
10389	Issue	433	23	
10391	Issue	433	25	
10392	Issue	433	26	
10369	Issue	433	1	TEST REDUCIDO PUESTA EN MARCHA EGSE PM OBC SIDE A HARDWARE
10370	Issue	433	2	Minor
10371	Issue	433	3	None
10372	Issue	433	4	None
10374	Issue	433	6	
10376	Issue	433	9	SBM-GSE-NC-00005
10381	Issue	433	15	No
10385	Issue	433	19	Under Analysis
10387	Issue	433	21	No
10397	Issue	434	5	
10399	Issue	434	8	
10401	Issue	434	10	
10402	Issue	434	12	
10403	Issue	434	13	
10404	Issue	434	14	
10406	Issue	434	16	
10407	Issue	434	17	
10408	Issue	434	18	
10410	Issue	434	20	
10412	Issue	434	22	
10413	Issue	434	23	
10415	Issue	434	25	
10416	Issue	434	26	
10393	Issue	434	1	TEST REDUCIDO PUESTA EN MARCHA EGSE PM OBC SIDE B HARDWARE 
10394	Issue	434	2	Minor
10395	Issue	434	3	None
10396	Issue	434	4	None
10398	Issue	434	6	
10400	Issue	434	9	SBM-GSE-NC-00004
10405	Issue	434	15	No
10409	Issue	434	19	Under Analysis
10411	Issue	434	21	No
10421	Issue	435	5	
10423	Issue	435	8	
10425	Issue	435	10	
10426	Issue	435	12	
10427	Issue	435	13	
10428	Issue	435	14	
10430	Issue	435	16	
10431	Issue	435	17	
10432	Issue	435	18	
10434	Issue	435	20	
10436	Issue	435	22	
10437	Issue	435	23	
10440	Issue	435	26	
10417	Issue	435	1	TEST REDUCIDO PUESTA EN MARCHA  EGSE PM OBC SIDE B SOFTWARE
10418	Issue	435	2	Minor
10419	Issue	435	3	None
10420	Issue	435	4	None
10422	Issue	435	6	
10424	Issue	435	9	SBM-GSE-NC-00003
10429	Issue	435	15	No
10433	Issue	435	19	Under Analysis
11247	DmsfFileRevision	23	48	
11248	DmsfFileRevision	23	49	
11302	DmsfFolder	47	49	
10435	Issue	435	21	No
10439	Issue	435	25	EM
10445	Issue	436	5	
10447	Issue	436	8	
10449	Issue	436	10	
10450	Issue	436	12	
10451	Issue	436	13	
10452	Issue	436	14	
10454	Issue	436	16	
10456	Issue	436	18	
10457	Issue	436	19	
10458	Issue	436	20	
10460	Issue	436	22	
10461	Issue	436	23	
10463	Issue	436	25	
10464	Issue	436	26	
10441	Issue	436	1	Cableado de EGSE Com.  Con derretimiento en aislación
10442	Issue	436	2	Minor
10443	Issue	436	3	None
10444	Issue	436	4	None
10446	Issue	436	6	
10448	Issue	436	9	SBM-GSE-NC-00002
10453	Issue	436	15	No
10455	Issue	436	17	Rework / Redo / Return to Supplier
10459	Issue	436	21	No
10469	Issue	437	5	
10471	Issue	437	8	
10473	Issue	437	10	
10474	Issue	437	12	
10475	Issue	437	13	
10476	Issue	437	14	
10478	Issue	437	16	
10480	Issue	437	18	
10482	Issue	437	20	
10484	Issue	437	22	
10485	Issue	437	23	
10487	Issue	437	25	
10488	Issue	437	26	
10465	Issue	437	1	Encapsulado NC componente en placa de medio EGSE PM OBC
10466	Issue	437	2	Minor
10467	Issue	437	3	None
10468	Issue	437	4	None
10470	Issue	437	6	
10472	Issue	437	9	SBM-GSE-NC-00001
10477	Issue	437	15	No
10479	Issue	437	17	Scrap / Dismiss / Abort
10481	Issue	437	19	Under Analysis
10483	Issue	437	21	No
10495	Issue	438	8	
10497	Issue	438	10	
10499	Issue	438	13	
10509	Issue	438	23	
10511	Issue	438	25	
10512	Issue	438	26	
10489	Issue	438	1	Fallas de diseño en el JTAG y Reset de los PCBs de la PM-OBC EM (parcial LIE-10K_NC_1803)
10490	Issue	438	2	Major
10491	Issue	438	3	HW
10492	Issue	438	4	LIE-10K_NC_1803
10493	Issue	438	5	SABIA.FS.EM.PM.PM-OBC.A
10494	Issue	438	6	
10496	Issue	438	9	SBM-OBC-NC-00025
10498	Issue	438	12	Incoming Inspection / Test
10500	Issue	438	14	Placas SBC, IAB, TAB, AVAB, TCB, COMM, GPIO de la PM-OBC EM
10501	Issue	438	15	No
10502	Issue	438	16	Electronic / Electrical
10503	Issue	438	17	Rework / Redo / Return to Supplier
10504	Issue	438	18	Known Cause / Certain Corrective Action
10505	Issue	438	19	Design Deficiency
10506	Issue	438	20	Para el caso del EM, se realizar un cable adaptador para no conectar PROG_MODE y VJTAG conectarla a 3.3V. Ademas se realizar un header con las Rs de 1K para TRST y TCK de forma tal que luego de programar la FPGA se conecte este header al JTAGVPUMP a GND no es requerido ya que el modelo EM no necesita robustes al TIDVJTAG se puede dejar a 3.3V para el EMPara el modelo EM de la IAB el problema en el SW de Reset fue detectado y retrabajado como se observa en la NCR LIE-10K_NC_1803. El modelo EM de la SBC se debe retrabajar para implementar una solucion similar en el circuito de Reset y en el Break. Para el resto de los PCB se implementara la misma solucion de la IAB durante el pobladoPara el modelo FM se redisenara el PCB para incorporar los cambios de la figura adjunta y el footprint correspondiente al Switch de Reset. En el caso de la Rs para TRST y TCK se observa que en el resto de los PCBs estan conectados pero con una R de 2.7K por lo que se debe aclarar que ese valor es valido si se coneccta el Daisy Chain, sino dichas Rs se deben cambiar a 1KSe generara un set de nueva documentacion: Esquematico (si aplica), pcbDoc y Gerber, BOM y lista de poblado (si aplica), mapa de poblado (si aplica)Se retrabajaron los Switch de Reset y Break de la placa SBC EM,ver adjunto 
10507	Issue	438	21	No
10508	Issue	438	22	PCBS placas FM de la PM –OBC, excepto placa PWR
10519	Issue	439	8	
10524	Issue	439	14	
11223	Issue	446	7	
11224	Issue	446	11	
11210	Issue	439	11	
11207	Issue	438	7	
11208	Issue	438	11	
11304	DmsfFileRevision	34	48	
10533	Issue	439	23	
11305	DmsfFileRevision	34	49	
10535	Issue	439	25	
10536	Issue	439	26	
10513	Issue	439	1	Al soldar un Header de 2 pines en la SBC EM se levanto el pad del PCB 
10514	Issue	439	2	Major
10515	Issue	439	3	HW
10516	Issue	439	4	LIE-10K_NC 1794
10517	Issue	439	5	SABIA.FS.EM.PM.PM-OBC.A.SBC
10518	Issue	439	6	
10520	Issue	439	9	SBM-OBC-NC-00024
10521	Issue	439	10	2019-03-19
10522	Issue	439	12	In Process / Final Inspection / Test (non operational)
10523	Issue	439	13	SABIA.FS.EM.PM.PM-OBC.A.SBC_01
10525	Issue	439	15	No
10526	Issue	439	16	Soldering
11307	DmsfFileRevision	35	48	
11308	DmsfFileRevision	35	49	
11395	Issue	375	75	VENG
11396	Issue	376	75	VENG
11397	Issue	377	75	VENG
11398	Issue	378	75	VENG
11399	Issue	379	75	VENG
10527	Issue	439	17	Correct / Repair / Fix
10528	Issue	439	18	Known Cause / Certain Corrective Action
10529	Issue	439	19	Design Deficiency
10530	Issue	439	20	Se modificara el diseno de los planos termicos y de tierra de acuerdo a la NCR 5 para disminuir el el tiempo de preheating, adicionalmente se revera la necesidad de los jumpers y Rs de 0ohms en el modelo de vuelo que sirven para la puesta en marcha incremental
10531	Issue	439	21	No
10532	Issue	439	22	Placa Single Board Computer de la PM-OBC EM
10543	Issue	440	8	
10548	Issue	440	14	
10557	Issue	440	23	
10559	Issue	440	25	
10560	Issue	440	26	
10537	Issue	440	1	Problema de alineado de conectores cPCI de la placa SBC EM de la PM-OBC 
10538	Issue	440	2	Major
10539	Issue	440	3	HW
10540	Issue	440	4	LIE-10K_NC 1791
10541	Issue	440	5	SABIA.FS.EM.PM.PM-OBC.A.SBC
10542	Issue	440	6	
10544	Issue	440	9	SBM-OBC-NC-00023
10545	Issue	440	10	2019-01-18
10546	Issue	440	12	Internal Audit
10547	Issue	440	13	SABIA.FS.EM.PM.PM-OBC.A.SBC_01
10549	Issue	440	15	No
10550	Issue	440	16	Dimensional
10551	Issue	440	17	Rework / Redo / Return to Supplier
10552	Issue	440	18	Known Cause / Certain Corrective Action
10553	Issue	440	19	Design Deficiency
10554	Issue	440	20	Para la SBC EM se alinearan los conectores sin utilizar la herramienta, para as futuras placas se mecanizara la herramienta para rebajarle los laterales
10555	Issue	440	21	No
10556	Issue	440	22	Placa Single Board Computer de la PM-OBC EM
10567	Issue	441	8	
10572	Issue	441	14	
10581	Issue	441	23	
10583	Issue	441	25	
10584	Issue	441	26	
10561	Issue	441	1	Fallas de diseño en el PCB de la IAB EM de la PM-OBC
10562	Issue	441	2	Major
10563	Issue	441	3	HW
10564	Issue	441	4	LIE-10K_NC 1803
10565	Issue	441	5	SABIA.FS.EM.PM.PM-OBC.A.IAB
10566	Issue	441	6	
10568	Issue	441	9	SBM-OBC-NC-00022
10569	Issue	441	10	2019-01-15
10570	Issue	441	12	Internal Audit
10571	Issue	441	13	SABIA.FS.EM.PM.PM-OBC.A.IAB_01
10573	Issue	441	15	No
10574	Issue	441	16	Electronic / Electrical
10575	Issue	441	17	Rework / Redo / Return to Supplier
10576	Issue	441	18	Known Cause / Certain Corrective Action
10577	Issue	441	19	Design Deficiency
10578	Issue	441	20	Para el modelo EM se utilizara la placa como esta a que la misma fue fabricada, se genero un documeto de reparacion para el proceso de workmanship.Para el modelo FM se corregira el PCB con el footprint correspondienteSe generara un set de nueva documentacion: pcbDoc y Gerber, mapa de poblado (si aplica)
10579	Issue	441	21	No
10580	Issue	441	22	Placa IAB A del modelo de ingenieria de la PM-OBC
10591	Issue	442	8	
10596	Issue	442	14	
10605	Issue	442	23	
10607	Issue	442	25	
10608	Issue	442	26	
10585	Issue	442	1	Incumplimiento de requerimientos de calidad y funcionales del Bootloader 2.3 de la PM-OBC
10586	Issue	442	2	Major
10587	Issue	442	3	SW
10588	Issue	442	4	None
10589	Issue	442	5	SABIA.FS.EM.PM.PM-OBC.BL 
10590	Issue	442	6	
10592	Issue	442	9	SBM-OBC-NC-00021
10593	Issue	442	10	2019-09-23
10594	Issue	442	12	Incoming Inspection / Test
10595	Issue	442	13	SABIA.FS.EM.PM.PM-OBC.A.SBC_01
10597	Issue	442	15	No
10598	Issue	442	16	Electronic / Electrical
10599	Issue	442	17	Rework / Redo / Return to Supplier
10600	Issue	442	18	Known Cause / Certain Corrective Action
10601	Issue	442	19	Design Deficiency
10602	Issue	442	20	Se rechaza el codigo fuente del Bootloader v2.3, en el adjunto "SB-050403-MM-00100-B SABIA-Mar Memo - PM-OBC Analisis del Driver de la Flash y EEPROM del Bootloader (y del BSW) BL 2.0 y BL 2.3 23-09-2019" se presenta una solucion integral para la codificación.Hasta la fecha el riesgo que representa el proveedor sigue en WATCH sin mitigacion alguna dispuesta por parte del proyecto
10603	Issue	442	21	No
10604	Issue	442	22	PM-OBC Bootloader v2.3
10615	Issue	443	8	
10620	Issue	443	14	
10609	Issue	443	1	Fallas de diseño e la memoria de EDAC de los bancos Flash de la PM-OBC EM
10610	Issue	443	2	Major
10611	Issue	443	3	SW
10612	Issue	443	4	None
10613	Issue	443	5	SABIA.FS.EM.PM.PM-OBC.A.SBC 
10614	Issue	443	6	
10616	Issue	443	9	SBM-OBC-NC-00020
10617	Issue	443	10	2019-09-12
10618	Issue	443	12	Incoming Inspection / Test
10619	Issue	443	13	SABIA.FS.EM.PM.PM-OBC.A.SBC_01
11199	Issue	425	7	
11200	Issue	425	11	
11196	Issue	423	11	
11310	DmsfFolder	48	48	
11311	DmsfFolder	48	49	
11313	DmsfFileRevision	36	48	
11314	DmsfFileRevision	36	49	
11316	DmsfFileRevision	37	48	
10629	Issue	443	23	
10631	Issue	443	25	
10632	Issue	443	26	
10621	Issue	443	15	No
10622	Issue	443	16	Electronic / Electrical
10623	Issue	443	17	Use as is / Continue / Accept
10624	Issue	443	18	Known Cause / Certain Corrective Action
10625	Issue	443	19	Design Deficiency
10626	Issue	443	20	En el caso del modelo EM, se desahilitara el EDAC en la zona PROM al inicio del BL (ver codigo adjunto), LUEGO de probar el driver de la EEPROM con el EDAC activo. En el caso del driver de la flash no se podra probar con el EDAC y se diferira la prueba en el modelo FM. En el modelo FM se debe modificar el PCB para que la memoria Flash quede configurada en 16bits tal cual las otras dos de forma tal que se mapeen de igual modo. Ver adjunto Se generara un set de nueva documentacion: Esquematico (si aplica), pcbDoc y Gerber, BOM y lista de poblado (si aplica), mapa de poblado (si aplica)
10627	Issue	443	21	No
10628	Issue	443	22	Placa Single Board Computer de la PM-OBC EM bancos de memoria Flash SAFE, CURRENT y PATCH, memoria que almacena el EDAC
10639	Issue	444	8	
10644	Issue	444	14	
10653	Issue	444	23	
10655	Issue	444	25	
10656	Issue	444	26	
10633	Issue	444	1	Problemas en mapeado de pin out harness de EGSE PM-OBC contra ICDs
10634	Issue	444	2	Major
10635	Issue	444	3	HW
10636	Issue	444	4	None
10637	Issue	444	5	SABIA.GSE.EGSE.PM-OBC.EGSE
10638	Issue	444	6	
10640	Issue	444	9	SBM-OBC-NC-00019
10641	Issue	444	10	2019-02-14
10642	Issue	444	12	Internal Audit
10643	Issue	444	13	SABIA.GSE.EGSE.PM-OBC.EGSE1.HAR_01 
10645	Issue	444	15	No
10646	Issue	444	16	Electronic / Electrical
10647	Issue	444	17	Rework / Redo / Return to Supplier
10648	Issue	444	18	Unknown Cause / Certain Corrective Action
10649	Issue	444	19	Others
10650	Issue	444	20	Se revisara todo el harness del EGSE contra los ICDs y se retrabajaran los que presenten inconvenientes. En el adjunto "Estado Revision Harness EGSE Sabia-mar" se actualizara el resumen del estado de cada Harness
10651	Issue	444	21	No
10652	Issue	444	22	Harness de interconexion de EGSE con PM-OBC
10663	Issue	445	8	
10668	Issue	445	14	
10677	Issue	445	23	
10679	Issue	445	25	
10680	Issue	445	26	
10657	Issue	445	1	Problema de diseño de PCB para disipacion termica en la SBC EM e IAB EM
10658	Issue	445	2	Major
10659	Issue	445	3	HW
10660	Issue	445	4	None
10661	Issue	445	5	SABIA.FS.EM.PM.PM-OBC
10662	Issue	445	6	
10664	Issue	445	9	SBM-OBC-NC-00018
10665	Issue	445	10	2019-01-02
10666	Issue	445	12	Internal Audit
10667	Issue	445	13	 SABIA.FS.EM.PM.PM-OBC.A.SBC_01 e SABIA.FS.EM.PM.PM-OBC.A.IAB_01
10669	Issue	445	15	No
10670	Issue	445	16	Finish
10671	Issue	445	17	Rework / Redo / Return to Supplier
10672	Issue	445	18	Known Cause / Certain Corrective Action
10673	Issue	445	19	Design Deficiency
10674	Issue	445	20	Rediseño de PCBs
10675	Issue	445	21	No
10676	Issue	445	22	Placa Single Board Computer e Instrument Acquisition Board de la PM-OBC EM
10687	Issue	446	8	
10691	Issue	446	13	
10692	Issue	446	14	
10681	Issue	446	1	No cumplimiento de estandars de workmanship en largo de pines de conector cPCI de la placa SBC EM
10682	Issue	446	2	Major
10683	Issue	446	3	HW
10684	Issue	446	4	None
10685	Issue	446	5	SABIA.FS.EM.PM.PM-OBC.A.SBC
10686	Issue	446	6	
10688	Issue	446	9	SBM-OBC-NC-00017
10689	Issue	446	10	2018-11-20
10690	Issue	446	12	Others
10693	Issue	446	15	No
10694	Issue	446	16	Soldering
10695	Issue	446	17	Correct / Repair / Fix
11186	Issue	413	11	
11249	Issue	398	7	
11250	Issue	398	11	
11317	DmsfFileRevision	37	49	
11319	DmsfFileRevision	38	48	
11320	DmsfFileRevision	38	49	
11400	Issue	380	75	VENG
11401	Issue	381	75	VENG
11402	Issue	384	75	VENG
11403	Issue	385	7	\N
11404	Issue	385	11	\N
11405	Issue	385	75	VENG
11406	Issue	386	7	\N
11407	Issue	386	11	\N
11408	Issue	386	75	VENG
11409	Issue	387	7	\N
11410	Issue	387	11	\N
11411	Issue	387	75	VENG
11412	Issue	388	7	\N
11413	Issue	388	11	\N
11414	Issue	388	75	VENG
11415	Issue	389	7	\N
11416	Issue	389	11	\N
11417	Issue	389	75	VENG
11418	Issue	390	7	\N
11419	Issue	390	11	\N
11420	Issue	390	75	VENG
11421	Issue	391	7	\N
11422	Issue	391	11	\N
11423	Issue	391	75	VENG
11424	Issue	392	7	\N
11425	Issue	392	11	\N
11426	Issue	392	75	VENG
10696	Issue	446	18	
10698	Issue	446	20	
10701	Issue	446	23	
10703	Issue	446	25	
10704	Issue	446	26	
10697	Issue	446	19	Under Analysis
10699	Issue	446	21	No
10700	Issue	446	22	Placa Single Board Computer de la PM-OBC EM
10711	Issue	447	8	
10716	Issue	447	14	
10725	Issue	447	23	
10727	Issue	447	25	
10728	Issue	447	26	
10705	Issue	447	1	Fallas de diseño en el PCB de la SBC EM de la PM-OBC
10706	Issue	447	2	Major
10707	Issue	447	3	HW
10708	Issue	447	4	None
10709	Issue	447	5	SABIA.FS.EM.PM.PM-OBC.A.SBC
10710	Issue	447	6	
10712	Issue	447	9	SBM-OBC-NC-00016
10713	Issue	447	10	2018-09-03
10714	Issue	447	12	Internal Audit
10715	Issue	447	13	SABIA.FS.EM.PM.PM-OBC.A.SBC_01
10717	Issue	447	15	No
10718	Issue	447	16	Electronic / Electrical
10719	Issue	447	17	Correct / Repair / Fix
10720	Issue	447	18	Known Cause / Certain Corrective Action
10721	Issue	447	19	Design Deficiency
10722	Issue	447	20	Para el modelo EM se especifica como reparar el PCB en un documento especifico "SBM-STI-OBC-PR-00037-A Procedimiento de Reparación para SBC EM".Para el modelo de vuelo se debera modificar el PCB para incorporar estas reparacionesSe generara un set de nueva documentacion: Esquematico (si aplica), pcbDoc y Gerber, BOM y lista de poblado (si aplica), mapa de poblado (si aplica)Adicionalmente, se decidió a nivel proyecto, proceder con la fabricacion del modelo EM, registrar todos los problemas detectados en cada placa, impactar las correcciones en los disenos y luego de actualizados proceder con la adquisicion de los PCB FM
10723	Issue	447	21	No
10724	Issue	447	22	Placa Single Board Computer de la PM-OBC EM
10735	Issue	448	8	
10740	Issue	448	14	
10749	Issue	448	23	
10752	Issue	448	26	
10729	Issue	448	1	Anomalias en diseño en pads de PCBs de PM-OBC EM que imposibiltan el soldado thruhole
10730	Issue	448	2	Major
10731	Issue	448	3	HW
10732	Issue	448	4	None
10733	Issue	448	5	SABIA.FS.EM.PM.PM-OBC
10734	Issue	448	6	
10736	Issue	448	9	SBM-OBC-NC-00015
10737	Issue	448	10	2018-07-16
10738	Issue	448	12	Incoming Inspection / Test
10739	Issue	448	13	SABIA.FS.EM.PM.PM-OBC.A.BKP_01
10741	Issue	448	15	No
10742	Issue	448	16	Welding / Welds
10743	Issue	448	17	Use as is / Continue / Accept
10744	Issue	448	18	Known Cause / Certain Corrective Action
10745	Issue	448	19	Design Deficiency
10746	Issue	448	20	Se tomaron acciones para rediseñar todos los PCBs de la PM-OBC comenzando con los que faltan adquirir para finalizar el modelo EM:- COMM- TAB- TCB- AVAB- GPIO- POWER A y POWER BSe rediseñarán luego los PCB para el FM q actualmente ya han sido adquiridos para el EM:- SBC- Backplane A y B (el B actualmente no se utilizará en el modelo EM)- IABSe generara un set de nueva documentacion: Esquematico (si aplica), pcbDoc y Gerber, BOM y lista de poblado (si aplica), mapa de poblado (si aplica)Cada entrega de PCB diseñado será revisada en conjunto con la facilidad de Workmanship para tratar de detectar anomalías antes de realizar la adquisición de las mismasSe adquirirán solo los modelos EMUna vez populada cada placa EM se actualizarán los diseños para el FM si se detectan anomalías adicionales.
10747	Issue	448	21	No
10748	Issue	448	22	PM-OBC Engineering Model
10751	Issue	448	25	EM
10759	Issue	449	8	
10761	Issue	449	10	
10762	Issue	449	12	
10763	Issue	449	13	
10764	Issue	449	14	
10766	Issue	449	16	
10753	Issue	449	1	ISSUE EGSE ENSAYOS PM OBC (led titilante)
10754	Issue	449	2	Minor
10755	Issue	449	3	None
10756	Issue	449	4	None
10757	Issue	449	5	#¡REF!
10758	Issue	449	6	
10760	Issue	449	9	SBM-OBC-NC-00011
10765	Issue	449	15	No
10767	Issue	449	17	Rework / Redo / Return to Supplier
11251	Issue	393	7	
11252	Issue	393	11	
9126	Issue	381	6	
9101	Issue	380	5	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01SABIA.FS.EM.PM.PM-OBC.A.GPIO_01
11253	Issue	380	7	
11254	Issue	380	11	
11322	DmsfFolder	49	48	
11323	DmsfFolder	49	49	
11325	DmsfFileRevision	39	48	
11326	DmsfFileRevision	39	49	
11327	Issue	409	75	ASCENTIO
11328	Issue	410	75	ASCENTIO
11329	Issue	414	75	ASCENTIO
11330	Issue	365	7	\N
11331	Issue	365	11	\N
11332	Issue	365	75	CNEA
11333	Issue	368	7	\N
11334	Issue	368	11	\N
11335	Issue	368	75	INVAP
11336	Issue	382	7	\N
11337	Issue	382	11	\N
11338	Issue	382	75	INVAP
11339	Issue	383	7	\N
11340	Issue	383	11	\N
11341	Issue	383	75	INVAP
11342	Issue	416	7	\N
11343	Issue	416	11	\N
11344	Issue	416	75	INVAP
11345	Issue	417	7	\N
11346	Issue	417	11	\N
10768	Issue	449	18	
10770	Issue	449	20	
10772	Issue	449	22	
10773	Issue	449	23	
10775	Issue	449	25	
10776	Issue	449	26	
10769	Issue	449	19	Under Analysis
10771	Issue	449	21	No
10783	Issue	450	8	
10785	Issue	450	10	
10786	Issue	450	12	
10787	Issue	450	13	
10788	Issue	450	14	
10790	Issue	450	16	
10791	Issue	450	17	
10792	Issue	450	18	
10794	Issue	450	20	
10796	Issue	450	22	
10797	Issue	450	23	
10799	Issue	450	25	
10800	Issue	450	26	
10777	Issue	450	1	Ringing en señal de control de memorias
10778	Issue	450	2	Minor
10779	Issue	450	3	None
10780	Issue	450	4	None
10781	Issue	450	5	#¡REF!
10782	Issue	450	6	
10784	Issue	450	9	SBM-OBC-NC-00010
10789	Issue	450	15	No
10793	Issue	450	19	Under Analysis
10795	Issue	450	21	No
10807	Issue	451	8	
10809	Issue	451	10	
10810	Issue	451	12	
10811	Issue	451	13	
10812	Issue	451	14	
10814	Issue	451	16	
10816	Issue	451	18	
10818	Issue	451	20	
10820	Issue	451	22	
10821	Issue	451	23	
10823	Issue	451	25	
10824	Issue	451	26	
10801	Issue	451	1	Correcciones del Bootloader
10802	Issue	451	2	Minor
10803	Issue	451	3	None
10804	Issue	451	4	NR-00098
10805	Issue	451	5	#¡REF!
10806	Issue	451	6	
10808	Issue	451	9	SBM-OBC-NC-00008
10813	Issue	451	15	No
10815	Issue	451	17	Rework / Redo / Return to Supplier
10817	Issue	451	19	Under Analysis
10819	Issue	451	21	No
10831	Issue	452	8	
10833	Issue	452	10	
10834	Issue	452	12	
10835	Issue	452	13	
10836	Issue	452	14	
10838	Issue	452	16	
10840	Issue	452	18	
10842	Issue	452	20	
10844	Issue	452	22	
10845	Issue	452	23	
10847	Issue	452	25	
10848	Issue	452	26	
10825	Issue	452	1	Problemas con VHDL en la SBC
10826	Issue	452	2	Minor
10827	Issue	452	3	None
10828	Issue	452	4	NR-00097
10829	Issue	452	5	#¡REF!
10830	Issue	452	6	
10832	Issue	452	9	SBM-OBC-NC-00007
10837	Issue	452	15	No
10839	Issue	452	17	Rework / Redo / Return to Supplier
10841	Issue	452	19	Under Analysis
10843	Issue	452	21	No
10855	Issue	453	8	
10866	Issue	453	20	
10869	Issue	453	23	
10871	Issue	453	25	
10872	Issue	453	26	
10849	Issue	453	1	DEFORMACIÓN EN PINES Y TORRETA 
10850	Issue	453	2	Minor
10851	Issue	453	3	HW
10852	Issue	453	4	NR-00096
10853	Issue	453	5	SABIA.FS.EM.PM.PM-OBC.A.SBC 
10854	Issue	453	6	
10856	Issue	453	9	SBM-OBC-NC-00006
10857	Issue	453	10	2019-10-30
10858	Issue	453	12	Others
10859	Issue	453	13	SABIA.FS.EM.PM.PM-OBC.A.SBC_01
10860	Issue	453	14	SBC-EM-001     
10861	Issue	453	15	No
10862	Issue	453	16	Damage
10863	Issue	453	17	Use as is / Continue / Accept
10864	Issue	453	18	Known Cause / Certain Corrective Action
10865	Issue	453	19	Others
10867	Issue	453	21	No
10868	Issue	453	22	Placa Single Board Computer de la PM-OBC EM
10879	Issue	454	8	
10883	Issue	454	13	
10884	Issue	454	14	
10888	Issue	454	18	
10873	Issue	454	1	Perdida de trazabilidad de los Proyectos de PCB
10874	Issue	454	2	Major
10875	Issue	454	3	SW
10876	Issue	454	4	None
10877	Issue	454	5	SABIA.FS.FM.PM.PM-OBC
10878	Issue	454	6	
10880	Issue	454	9	SBM-OBC-NC-00004
10881	Issue	454	10	2019-09-30
10882	Issue	454	12	Others
10885	Issue	454	15	No
10886	Issue	454	16	Documentation
10887	Issue	454	17	Rework / Redo / Return to Supplier
11255	Issue	379	7	
11256	Issue	379	11	
11347	Issue	417	75	INVAP
11348	Issue	418	75	INVAP
11349	Issue	419	7	\N
11350	Issue	419	11	\N
11351	Issue	419	75	INVAP
11352	Issue	420	7	\N
11353	Issue	420	11	\N
11354	Issue	420	75	INVAP
11355	Issue	421	7	\N
11356	Issue	421	11	\N
10890	Issue	454	20	
10896	Issue	454	26	
10889	Issue	454	19	Others
10891	Issue	454	21	No
10892	Issue	454	22	Placas FM PM-OBC
10893	Issue	454	23	Deficiencia en Control de Configuración 
10895	Issue	454	25	PFM
10903	Issue	455	8	
10905	Issue	455	10	
10906	Issue	455	12	
10907	Issue	455	13	
10908	Issue	455	14	
10910	Issue	455	16	
10912	Issue	455	18	
10913	Issue	455	19	
10914	Issue	455	20	
10916	Issue	455	22	
10917	Issue	455	23	
10919	Issue	455	25	
10920	Issue	455	26	
10897	Issue	455	1	Problemas en ejecucion de software
10898	Issue	455	2	Minor
10899	Issue	455	3	None
10900	Issue	455	4	NR-00090
10901	Issue	455	5	#¡REF!
10902	Issue	455	6	
10904	Issue	455	9	SBM-OBC-NC-00002
10909	Issue	455	15	No
10911	Issue	455	17	Rework / Redo / Return to Supplier
10915	Issue	455	21	No
10927	Issue	456	8	
10928	Issue	456	9	
10929	Issue	456	10	
10930	Issue	456	12	
10931	Issue	456	13	
10932	Issue	456	14	
10935	Issue	456	17	
10936	Issue	456	18	
10938	Issue	456	20	
10944	Issue	456	26	
10921	Issue	456	1	Diferencias entre Footprint de SDRAM y pads de PCB en placa SBC
10922	Issue	456	2	Major
10923	Issue	456	3	HW
10924	Issue	456	4	None
10925	Issue	456	5	SABIA.FS.EM.PM.PM-OBC.A.SBC 
10926	Issue	456	6	
10933	Issue	456	15	No
10934	Issue	456	16	Soldering
10937	Issue	456	19	Others
10939	Issue	456	21	No
10940	Issue	456	22	Placa SBC EM - PMOBC
10941	Issue	456	23	Error en el pedido de compra de parte EEE
10943	Issue	456	25	EM
10951	Issue	457	8	
10953	Issue	457	10	
10960	Issue	457	18	
10965	Issue	457	23	
10968	Issue	457	26	
10945	Issue	457	1	Fallas de integracion en Bastidor y Backplane de la PM-OBC EM / Unidad PM-OBC EM, integracion de Bastidor con Backplane A
10946	Issue	457	2	Major
10947	Issue	457	3	HW
10948	Issue	457	4	NR-00089
10949	Issue	457	5	SABIA.FS.EM.PM.PM-OBC.A 
10950	Issue	457	6	
10952	Issue	457	9	SBM-OBC-NC-00001
10954	Issue	457	12	Incoming Inspection / Test
10955	Issue	457	13	None
10956	Issue	457	14	None
10957	Issue	457	15	No
10958	Issue	457	16	Soldering
10959	Issue	457	17	Rework / Redo / Return to Supplier
10961	Issue	457	19	Inadequate Training / Certification
10962	Issue	457	20	Se dispuso para los retrabajos que el personal de VENG del LIE-CETT se haga cargo de los mismos ya que cuentan con la experiencia del proyecto SAOCOM Se retrabajo la PM-OBC EM y se solucionaron los inconevneintes, se adjunta el reporte del trabajo
10963	Issue	457	21	No
10964	Issue	457	22	PM-OBC EM / Backplane Side A
10967	Issue	457	25	EM
9053	Issue	378	5	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01 SABIA.FS.EM.PM.PM-OBC.A.GPIO_01
9054	Issue	378	6	
11257	Issue	378	7	
11258	Issue	378	11	
11260	DmsfFolder	46	48	
11261	DmsfFolder	46	49	
11263	DmsfFileRevision	24	48	
11264	DmsfFileRevision	24	49	
11266	DmsfFileRevision	25	48	
11267	DmsfFileRevision	25	49	
11269	DmsfFileRevision	26	48	
11270	DmsfFileRevision	26	49	
11272	DmsfFileRevision	27	48	
11273	DmsfFileRevision	27	49	
11275	DmsfFileRevision	28	48	
11276	DmsfFileRevision	28	49	
11278	DmsfFileRevision	29	48	
11279	DmsfFileRevision	29	49	
11281	DmsfFileRevision	30	48	
11282	DmsfFileRevision	30	49	
11284	DmsfFileRevision	31	48	
11285	DmsfFileRevision	31	49	
11287	DmsfFileRevision	32	48	
11288	DmsfFileRevision	32	49	
11290	DmsfFileRevision	33	48	
11291	DmsfFileRevision	33	49	
11357	Issue	421	75	INVAP
11358	Issue	422	75	INVAP
11359	Issue	423	75	INVAP
11360	Issue	424	75	INVAP
11427	Issue	393	75	VENG
11428	Issue	394	7	\N
11429	Issue	394	11	\N
11430	Issue	394	75	VENG
11431	Issue	395	7	\N
11432	Issue	395	11	\N
11433	Issue	395	75	VENG
11434	Issue	396	7	\N
11435	Issue	396	11	\N
11436	Issue	396	75	VENG
11437	Issue	397	7	\N
11438	Issue	397	11	\N
11439	Issue	397	75	VENG
11440	Issue	398	75	VENG
11441	Issue	399	7	\N
11442	Issue	399	11	\N
11443	Issue	399	75	VENG
11444	Issue	400	7	\N
11445	Issue	400	11	\N
11446	Issue	400	75	VENG
11447	Issue	401	7	\N
11448	Issue	401	11	\N
11449	Issue	401	75	VENG
11450	Issue	402	7	\N
11451	Issue	402	11	\N
11452	Issue	402	75	VENG
11453	Issue	403	7	\N
11454	Issue	403	11	\N
11455	Issue	403	75	VENG
11456	Issue	404	7	\N
11457	Issue	404	11	\N
11458	Issue	404	75	VENG
11459	Issue	405	7	\N
11460	Issue	405	11	\N
11461	Issue	405	75	VENG
11462	Issue	406	7	\N
11463	Issue	406	11	\N
11464	Issue	406	75	VENG
11465	Issue	407	7	\N
11466	Issue	407	11	\N
11467	Issue	407	75	VENG
11468	Issue	408	7	\N
11469	Issue	408	11	\N
11470	Issue	408	75	VENG
11471	Issue	411	75	VENG
11472	Issue	412	75	VENG
11473	Issue	413	75	VENG
11474	Issue	425	75	VENG
11475	Issue	426	75	VENG
11476	Issue	427	75	VENG
11477	Issue	428	75	VENG
11478	Issue	429	7	\N
11479	Issue	429	11	\N
11480	Issue	429	75	VENG
11481	Issue	430	7	\N
11482	Issue	430	11	\N
11483	Issue	430	75	VENG
11484	Issue	431	7	\N
11485	Issue	431	11	\N
11486	Issue	431	75	VENG
11487	Issue	432	7	\N
11488	Issue	432	11	\N
11489	Issue	432	75	VENG
11490	Issue	433	7	\N
11491	Issue	433	11	\N
11492	Issue	433	75	VENG
11493	Issue	434	7	\N
11494	Issue	434	11	\N
11495	Issue	434	75	VENG
11496	Issue	435	7	\N
11497	Issue	435	11	\N
11498	Issue	435	75	VENG
11499	Issue	436	7	\N
11500	Issue	436	11	\N
11501	Issue	436	75	VENG
11502	Issue	437	7	\N
11503	Issue	437	11	\N
11504	Issue	437	75	VENG
11505	Issue	438	75	VENG
11506	Issue	439	75	VENG
11507	Issue	440	75	VENG
11508	Issue	441	75	VENG
11509	Issue	442	75	VENG
11510	Issue	443	75	VENG
11511	Issue	444	75	VENG
11512	Issue	445	75	VENG
11513	Issue	446	75	VENG
11514	Issue	447	75	VENG
11515	Issue	448	75	VENG
11516	Issue	449	7	\N
11517	Issue	449	11	\N
11518	Issue	449	75	VENG
11519	Issue	450	7	\N
11520	Issue	450	11	\N
11521	Issue	450	75	VENG
11522	Issue	451	7	\N
11523	Issue	451	11	\N
11524	Issue	451	75	VENG
11525	Issue	452	7	\N
11526	Issue	452	11	\N
11527	Issue	452	75	VENG
11528	Issue	453	75	VENG
11529	Issue	454	75	VENG
11530	Issue	455	75	VENG
11531	Issue	456	75	VENG
11532	Issue	457	75	VENG
11533	Issue	336	7	\N
11534	Issue	336	11	\N
11535	Issue	336	75	VENG
11536	Issue	337	7	\N
11537	Issue	337	11	\N
11538	Issue	337	75	VENG
11539	Issue	338	7	\N
11540	Issue	338	11	\N
11541	Issue	338	75	VENG
11542	Issue	339	7	\N
11543	Issue	339	11	\N
11544	Issue	339	75	VENG
11545	Issue	340	7	\N
11546	Issue	340	11	\N
11547	Issue	340	75	VENG
11548	Issue	341	7	\N
11549	Issue	341	11	\N
11550	Issue	341	75	VENG
11551	Issue	342	7	\N
11552	Issue	342	11	\N
11553	Issue	342	75	VENG
11554	Issue	343	7	\N
11555	Issue	343	11	\N
11556	Issue	343	75	VENG
11557	Issue	344	7	\N
11558	Issue	344	11	\N
11559	Issue	344	75	VENG
11560	Issue	345	7	\N
11561	Issue	345	11	\N
11562	Issue	345	75	VENG
11563	Issue	346	7	\N
11564	Issue	346	11	\N
11565	Issue	346	75	VENG
11566	Issue	347	7	\N
11567	Issue	347	11	\N
11568	Issue	347	75	VENG
11569	Issue	348	7	\N
11570	Issue	348	11	\N
11571	Issue	348	75	VENG
11572	Issue	349	7	\N
11573	Issue	349	11	\N
11574	Issue	349	75	VENG
11575	Issue	350	7	\N
11576	Issue	350	11	\N
11577	Issue	350	75	VENG
11578	Issue	351	7	\N
11579	Issue	351	11	\N
11580	Issue	351	75	VENG
11581	Issue	352	7	\N
11582	Issue	352	11	\N
11583	Issue	352	75	VENG
11584	Issue	353	7	\N
11585	Issue	353	11	\N
11586	Issue	353	75	VENG
11587	Issue	354	7	\N
11588	Issue	354	11	\N
11589	Issue	354	75	VENG
11590	Issue	355	7	\N
11591	Issue	355	11	\N
11592	Issue	355	75	VENG
11593	Issue	356	7	\N
11594	Issue	356	11	\N
11595	Issue	356	75	VENG
11596	Issue	357	7	\N
11597	Issue	357	11	\N
11598	Issue	357	75	VENG
11600	DmsfFolder	50	48	
11601	DmsfFolder	50	49	
11603	DmsfFolder	51	48	
11604	DmsfFolder	51	49	
11606	DmsfFolder	52	48	
11607	DmsfFolder	52	49	
11609	DmsfFolder	53	48	
11610	DmsfFolder	53	49	
11612	DmsfFolder	54	48	
11613	DmsfFolder	54	49	
11615	DmsfFileRevision	40	48	SB-020100-RQ-00100
11616	DmsfFileRevision	40	49	Requirement
11618	DmsfFolder	55	48	
11619	DmsfFolder	55	49	
11627	DmsfFolder	58	48	
11628	DmsfFolder	58	49	
11630	DmsfFolder	59	48	
11631	DmsfFolder	59	49	
11633	DmsfFolder	60	48	
11634	DmsfFolder	60	49	
11645	DmsfFolder	64	48	
11646	DmsfFolder	64	49	
11648	DmsfFolder	65	48	
11649	DmsfFolder	65	49	
11651	DmsfFolder	66	48	
11652	DmsfFolder	66	49	
11654	DmsfFileRevision	41	48	SB-020100-RQ-00100
11655	DmsfFileRevision	41	49	Requirement
11657	DmsfFileRevision	42	48	
11658	DmsfFileRevision	42	49	
11660	DmsfFileRevision	43	48	SB-020100-RQ-00200
11661	DmsfFileRevision	43	49	Requirement
11663	DmsfFileRevision	44	48	SB-030000-RQ-00100
11664	DmsfFileRevision	44	49	Requirement
11666	DmsfFileRevision	45	48	
11667	DmsfFileRevision	45	49	
11669	DmsfFileRevision	46	48	
11670	DmsfFileRevision	46	49	
11672	DmsfFileRevision	47	48	
11673	DmsfFileRevision	47	49	
11675	DmsfFileRevision	48	48	
11676	DmsfFileRevision	48	49	
11678	DmsfFileRevision	49	48	
11679	DmsfFileRevision	49	49	
11681	DmsfFileRevision	50	48	
11682	DmsfFileRevision	50	49	
11684	DmsfFolder	67	48	
11685	DmsfFolder	67	49	
11703	Issue	463	60	Hardware
11704	Issue	463	59	Fabricado
11705	Issue	463	58	SABIAMAR MISSION
11702	Issue	463	4	
11706	Issue	464	4	
11707	Issue	464	60	Hardware
11708	Issue	464	59	Fabricado
11709	Issue	464	58	Flight Segment - Proto-Flight Model
11710	Issue	465	4	
11711	Issue	465	60	Hardware
11712	Issue	465	59	Fabricado
11713	Issue	465	58	Service Module
11714	Issue	466	4	
11715	Issue	466	60	Hardware
11716	Issue	466	59	Fabricado
11717	Issue	466	58	Service Module Structures and Mechanisms
11718	Issue	467	4	SABIA.FS.PFM.SM.S&M
11719	Issue	467	60	Hardware
11720	Issue	467	59	Fabricado
11721	Issue	467	58	Panels
11722	Issue	468	4	
11723	Issue	468	60	Hardware
11724	Issue	468	59	Fabricado
11726	Issue	469	4	
11725	Issue	468	58	Panel-X
11730	Issue	470	4	
11731	Issue	470	60	Hardware
11732	Issue	470	59	Fabricado
11733	Issue	470	58	Panel-Y
11727	Issue	469	60	Hardware
11728	Issue	469	59	Fabricado
11729	Issue	469	58	 Panel+Y
11734	Issue	471	4	
11735	Issue	471	60	Hardware
11736	Issue	471	59	Fabricado
11737	Issue	471	58	Panel+Z
11738	Issue	472	4	
11739	Issue	472	60	Hardware
11740	Issue	472	59	Fabricado
11741	Issue	472	58	Panel-Z
11742	Issue	473	4	
11743	Issue	473	60	Hardware
11744	Issue	473	59	Fabricado
11745	Issue	473	58	Panel-Z+X
11746	Issue	474	4	
11747	Issue	474	60	Hardware
11748	Issue	474	59	Fabricado
11749	Issue	474	58	Panel-Z-X
11750	Issue	475	4	
11751	Issue	475	60	Hardware
11752	Issue	475	59	Fabricado
11753	Issue	475	58	Panel-Z Reinforce
11754	Issue	476	4	
11755	Issue	476	60	Hardware
11756	Issue	476	59	Fabricado
11757	Issue	476	58	Nodes
11758	Issue	477	4	
11759	Issue	477	60	Hardware
11760	Issue	477	59	Fabricado
11761	Issue	477	58	Node+Y+Z
11762	Issue	478	4	
11763	Issue	478	60	Hardware
11764	Issue	478	59	Fabricado
11765	Issue	478	58	Node-Y+Z
11766	Issue	479	159	Flight Segment
11767	Issue	480	159	Flight Segment
11768	Issue	481	159	
11769	Issue	482	159	
11770	Issue	483	159	
11771	Issue	462	61	
11772	Issue	462	56	
11773	Issue	462	55	
11774	Issue	462	54	
11775	Issue	462	53	
11776	Issue	462	52	
11777	Issue	462	51	
11778	Issue	462	50	
11780	DmsfFolder	68	48	
11781	DmsfFolder	68	49	
11783	DmsfFolder	69	48	
11784	DmsfFolder	69	49	
11786	DmsfFileRevision	51	48	
11787	DmsfFileRevision	51	49	
12017	DmsfFolder	70	48	
12018	DmsfFolder	70	49	
12024	DmsfFolder	71	48	
12025	DmsfFolder	71	49	
12031	DmsfFolder	72	48	
12032	DmsfFolder	72	49	
12038	DmsfFolder	73	48	
12039	DmsfFolder	73	49	
12045	DmsfFolder	74	48	
12046	DmsfFolder	74	49	
12052	DmsfFolder	75	48	
12053	DmsfFolder	75	49	
12059	DmsfFolder	76	48	
12060	DmsfFolder	76	49	
12066	DmsfFolder	77	48	
12067	DmsfFolder	77	49	
12073	DmsfFolder	78	48	
12074	DmsfFolder	78	49	
12080	DmsfFolder	79	48	
12081	DmsfFolder	79	49	
12087	DmsfFolder	80	48	
12088	DmsfFolder	80	49	
12094	DmsfFolder	81	48	
12095	DmsfFolder	81	49	
12101	DmsfFolder	82	48	
12102	DmsfFolder	82	49	
12108	DmsfFolder	83	48	
12109	DmsfFolder	83	49	
12115	DmsfFolder	84	48	
12116	DmsfFolder	84	49	
12122	DmsfFolder	85	48	
12123	DmsfFolder	85	49	
12129	DmsfFolder	86	48	
12130	DmsfFolder	86	49	
12136	DmsfFolder	87	48	
12137	DmsfFolder	87	49	
12143	DmsfFolder	88	48	
12144	DmsfFolder	88	49	
12150	DmsfFolder	89	48	
12151	DmsfFolder	89	49	
12157	DmsfFolder	90	48	
12158	DmsfFolder	90	49	
12164	DmsfFolder	91	48	
12165	DmsfFolder	91	49	
12171	DmsfFolder	92	48	
12172	DmsfFolder	92	49	
12178	DmsfFolder	93	48	
12179	DmsfFolder	93	49	
12185	DmsfFolder	94	48	
12186	DmsfFolder	94	49	
12192	DmsfFolder	95	48	
12193	DmsfFolder	95	49	
12199	DmsfFolder	96	48	
12200	DmsfFolder	96	49	
12206	DmsfFolder	97	48	
12207	DmsfFolder	97	49	
12213	DmsfFolder	98	48	
12214	DmsfFolder	98	49	
12220	DmsfFolder	99	48	
12221	DmsfFolder	99	49	
12227	DmsfFolder	100	48	
12228	DmsfFolder	100	49	
12234	DmsfFolder	101	48	
12235	DmsfFolder	101	49	
12241	DmsfFolder	102	48	
12242	DmsfFolder	102	49	
12248	DmsfFolder	103	48	
12249	DmsfFolder	103	49	
12255	DmsfFolder	104	48	
12256	DmsfFolder	104	49	
12262	DmsfFolder	105	48	
12263	DmsfFolder	105	49	
12269	DmsfFolder	106	48	
12270	DmsfFolder	106	49	
12276	DmsfFolder	107	48	
12277	DmsfFolder	107	49	
12283	DmsfFolder	108	48	
12284	DmsfFolder	108	49	
12290	DmsfFolder	109	48	
12291	DmsfFolder	109	49	
12297	DmsfFolder	110	48	
12298	DmsfFolder	110	49	
12304	DmsfFolder	111	48	
12305	DmsfFolder	111	49	
12311	DmsfFolder	112	48	
12312	DmsfFolder	112	49	
12318	DmsfFolder	113	48	
12319	DmsfFolder	113	49	
12325	DmsfFolder	114	48	
12326	DmsfFolder	114	49	
12332	DmsfFolder	115	48	
12333	DmsfFolder	115	49	
12339	DmsfFolder	116	48	
12340	DmsfFolder	116	49	
12346	DmsfFolder	117	48	
12347	DmsfFolder	117	49	
12353	DmsfFolder	118	48	
12354	DmsfFolder	118	49	
12360	DmsfFolder	119	48	
12361	DmsfFolder	119	49	
12367	DmsfFolder	120	48	
12368	DmsfFolder	120	49	
12374	DmsfFolder	121	48	
12375	DmsfFolder	121	49	
12381	DmsfFolder	122	48	
12382	DmsfFolder	122	49	
12388	DmsfFolder	123	48	
12389	DmsfFolder	123	49	
12395	DmsfFolder	124	48	
12396	DmsfFolder	124	49	
12402	DmsfFolder	125	48	
12403	DmsfFolder	125	49	
12409	DmsfFolder	126	48	
12410	DmsfFolder	126	49	
12416	DmsfFolder	127	48	
12417	DmsfFolder	127	49	
12423	DmsfFolder	128	48	
12424	DmsfFolder	128	49	
12430	DmsfFolder	129	48	
12431	DmsfFolder	129	49	
12437	DmsfFolder	130	48	
12438	DmsfFolder	130	49	
12444	DmsfFolder	131	48	
12445	DmsfFolder	131	49	
12572	Issue	509	1	Project Management
12573	Issue	509	37	1.1
12587	Issue	511	164	This WP includes the following tasks:Verify and control Mission Requirements as well as constraints.Refine Project Planning in all levels in the customer-supplier chain.Confirm the Mission Statement.Verify availability to develop new technologies.Define communication and reporting tools.
12588	Issue	511	165	SABIA-Mar Sattfing PlanSABIA-Mar Descope PlanSABIA-Mar Mission Reports 
12577	Issue	509	166	CONAE-GPS-PM 
12580	Issue	510	35	
12578	Issue	510	1	Risk Managemet
12579	Issue	510	37	1.2
12593	Issue	512	164	This WP includes generate  and organize the reviews milestone that will be conducted during the mission lifecycle acording to the SABIA- Mar Mission Review Plan
12594	Issue	512	165	Phase A Final ReportPhase B Final ReportPhase C Final ReportPhase D Final Report 
12583	Issue	510	166	CONAE-GPS-PM 
12586	Issue	511	35	
12556	Issue	506	35	
12558	Issue	506	165	
12554	Issue	506	1	Project Management
12555	Issue	506	37	1
12557	Issue	506	164	Grouper
12559	Issue	506	166	CONAE-GPS-PM 
12562	Issue	507	35	
12564	Issue	507	165	
12560	Issue	507	1	System Engineering
12561	Issue	507	37	2
12563	Issue	507	164	Grouper
12565	Issue	507	166	CONAE-GPS-MSE
12568	Issue	508	35	
12570	Issue	508	165	
12571	Issue	508	166	
12566	Issue	508	1	Safety & Mission Assurance
12567	Issue	508	37	3
12569	Issue	508	164	Grouper
12574	Issue	509	35	
12584	Issue	511	1	Project Planning
12585	Issue	511	37	1.3
12581	Issue	510	164	This WP includes the following tasks:Develop and control the Risk Management Plan.Identify Risks and monitoring them.Plan Risk Responses.Perform Quality Risk Analysis.
12582	Issue	510	165	Risk Management Plan Critical Items List
12589	Issue	511	166	CONAE-GPS-PM 
12592	Issue	512	35	
12590	Issue	512	1	Project Reviews
12591	Issue	512	37	1.4
12611	Issue	515	164	This WP includes the following tasks:Coordinate all Work Packages of the System Engineering branch.Manage and Control System Engineering meetings and approve proposed alternatives of implementation of each equipment/assembly.Update design definition for the selected system.Prepare the next level specification.Initiate development work on critical technologies to reduce the development risks.Prepare technical requirements at system levelPrepare interface requirements at system and subsystems levelEstablish high level function, product and specification trees
12617	Issue	516	164	This WP includes the following tasks:Refine orbit analysesRefine analyses for the data generation of each instrument on-boardRefine analyses for the required on-board storage capability and data downlink requirements.Update RF contactsGenerate the Mission Plan
12595	Issue	512	166	CONAE-GPS-PM 
12598	Issue	513	35	
12596	Issue	513	1	Cost & Schedule
12597	Issue	513	37	1.5
12601	Issue	513	166	CONAE-GPS-PM 
12604	Issue	514	35	
12602	Issue	514	1	Logistics & Facilities
12603	Issue	514	37	1.6
12605	Issue	514	164	\nThis work package includes:\nDefine and generate plans related to logistics and facilities that will be used to carry out all the necessary tasks of the Mission\nManage all instances of the purchasing process that are required for the acquisition of necessary goods and services throughout the project life cycle.\n
12606	Issue	514	165	Facilities Status Reports\nTransportation Plan\nREC-DEL Reports\n
12607	Issue	514	166	CONAE-GPS-PM 
12610	Issue	515	35	
12608	Issue	515	1	System Engineering Management
12609	Issue	515	37	2.1
12618	Issue	516	165	SABIA-Mar Mission PlanSABIA-Mar Mission Analisys and ScenariosSABIA-Mar Collision Avoidance PlanSABIA-Mar Orbit Determination and Maintenance Plan
12599	Issue	513	164	This WP includes the following tasks:Confirm the entire project life cycle cost and schedule.Determine Budget.Control cost and scheduleBuild a data base with estimates of cost for each subsystem, instrument, assembly, as result of the heritage from previous satellite missions developed in each country.Define and update the Project Integrated Schedule.
12613	Issue	515	166	CONAE-GPS-MSE
12616	Issue	516	35	
12614	Issue	516	1	Mission Design
12615	Issue	516	37	2.2
12600	Issue	513	165	Mission Cost EvaluationBudget updateIntegrated Project Schedule
12619	Issue	516	166	CONAE-GPS-MSE
12620	Issue	517	1	Software Engineering
12621	Issue	517	37	2.3
12576	Issue	509	165	Mission Concept and Feasibility PhaseSABIA-Mar Model Philosophy PlanSABIA-Mar Work Breakdown StructureProject Management Plan
12622	Issue	517	35	
12629	Issue	518	164	This WP includes the following tasks:Apply logical decompositionAllocate requirements and establish traceabilityDefine V&V planAnalyze and maintain the architectureIdentify interfaces and interactions between systemelements (including human elements of the system) and with external and enabling system
12624	Issue	517	165	 SABIA-Mar Software Specifications
12625	Issue	517	166	CONAE-GPS-MSE
12628	Issue	518	35	
12626	Issue	518	1	Project Verification & Validation
12627	Issue	518	37	2.4
12636	Issue	519	165	SABIA-Mar L2B Safety And Mission Assurance RequirementsSABIA-Mar Mission Assurance PlanSABIA-Mar Review Plan
12641	Issue	520	164	Provide spacecraft and payload systems safety engineering to the project. Includes monitoring subcontractors and payload providers; launch campaign; system safety facility surveys; etc.. Products include initial and follow-on hazard analysis for the SABIAMAR Spacecraft and payloads.
12631	Issue	518	166	CONAE-GPS-MSE
12634	Issue	519	35	
12632	Issue	519	1	SMA Management
12633	Issue	519	37	3.1
12647	Issue	521	164	Provide support in all stages of the project to ensure compliance with the requirements defined in the SABIAMAR Environmental Requirements Document (ERD).
12654	Issue	522	165	Single Failure Point ListsSABIAMAR Reliability PlanSABIAMAR Reliability Matrix
12637	Issue	519	166	CONAE-GPS-SMA
12640	Issue	520	35	
12638	Issue	520	1	System Safety
12639	Issue	520	37	3.2
12659	Issue	523	164	Provide support in electrical, electronic and electromechanical (EEE) parts engineering to internal project agents (CONAE) and contractors. Its activities include the validation of the reception, inspection, storage and management processes of EEE parts to the project, whether carried out by CONAE or in the facilities of the contractors / suppliers; define and manage the process of analyzing the use of non-standard EEE parts (NSEPAR); participate and coordinate the MRBs related to materials, EEE parts and processes; provide support for the selection and purchase of EEE parts, materials, equipment, etc; verify compliance with the related requirements.
12642	Issue	520	165	SABIMAR Systems Safety Plan
12643	Issue	520	166	CONAE-GPS-SMA
12646	Issue	521	35	
12644	Issue	521	1	Environments
12645	Issue	521	37	3.3
12660	Issue	523	165	SABIAMAR Materials and processes Control PlanSABIAMAR EEE Part Control PlanNon Standart EEE Parts Evaluated List (TBC)Non Standart EEE Parts Aprobal Request Forms
12648	Issue	521	165	TBD
12649	Issue	521	166	CONAE-GPS-SMA
12652	Issue	522	35	
12650	Issue	522	1	Reliability
12651	Issue	522	37	3.4
12653	Issue	522	164	Provide reliability design and analysis support to SABIA-MAR project elements at CONAE, partners, contractors and providers (as applicable). Includes performing and reviewing electronic parts stress analyses; circuit worst case analyses; interface failure modes, effects and criticality analyses (FMECAs) and single-event effects (SEE) analyses on spacecraft electronics; single points of failure (SPF); fault tree analyses, and probabilistic risk assessment; review/assessment for spacecraft contractor problem reports; review and closeout of problem/failure reports (P/FRs).
12665	Issue	524	164	Define, implement and control the execution of the Contamination Control Plan for the SABIA-MAR mission, either in-house, in the facilities of the contractors or in the instrument providers, in order to ensure that through its implementation SABIA- Mar1 Satellite will complete its mission without degradation produced by contamination.
12655	Issue	522	166	CONAE-GPS-SMA
12658	Issue	523	35	
12656	Issue	523	1	Electrical, Electronic and Electromechanical Parts, Materials & Processes (EEE Parts, Materials & Processes)
12657	Issue	523	37	3.5
12677	Issue	526	164	Ensure operations staff follow proper processes and procedures during operations phase, Include pre-launch preparation activities, and trainning support from operations assurance manager. Includes activities such as:Define and manage the continuous improvement process for the SABIAMAR mission.
12661	Issue	523	166	CONAE-GPS-SMA
12664	Issue	524	35	
12662	Issue	524	1	Contamination Control
12663	Issue	524	37	3.6
12666	Issue	524	165	SABIAMAR Contamination Control Plan
12667	Issue	524	166	CONAE-GPS-SMA
12670	Issue	525	35	
12672	Issue	525	165	
12668	Issue	525	1	Quality Assurance 
12669	Issue	525	37	3.7
12671	Issue	525	164	Grouper
12673	Issue	525	166	CONAE-GPS-SMA
12676	Issue	526	35	
12674	Issue	526	1	Operations Assurance
12675	Issue	526	37	3.8
12794	Issue	529	164	This WP includesthe following tasks: \nManagement of documented authorizations to depart from the originally specified requirements.\nReview and tracking of all deviations and Waivers.\nConvene the MRB for the resolution of all RFDs and Waivers.
12678	Issue	526	165	SABIAMAR Mission Continuous Improvement Process
12679	Issue	526	166	CONAE-GPS-SMA
12623	Issue	517	164	Generate the specifications that must be met by the Mission's SW providers, includingSoftware management requirementsGeneral software requirementsSoftware validation and verification requirementsSoftware maintenance requirements
12795	Issue	529	165	SABIA-Mar Mission Waivers and Deviations Management Plan \n
12796	Issue	529	166	CONAE-GPS-SMA
12797	Issue	530	164	\nThis WP includes the following tasks:\nManage the processes of PFR, and Anomalies.\nReview high (all) risk Problem Failure Reports.\nFollow up the PFRs (at System Level).\nConvene the MRB for the resolution and closure of the PFRs.\nReview and resolve all Anomalies.\nTrack anomalies during the operations phase.\nConvene the MRB for the resolution and closure of the Anomalies.\n
12798	Issue	530	165	SABIA-Mar Mission PFR Management Process\nSABIA-Mar Mission Anomalies Management Process
12799	Issue	530	166	CONAE-GPS-SMA
12575	Issue	509	164	This WP includes the following tasks:Coordinate and generate the consensus on the detailed plan (resources, schedule, tasks definition) for the Preliminary Design Phase;Confirm technical solution for the system and operations concept and their feasibility with respect to programmatic constraints;Define the Project Management Plan and auxiliary plans;Generate the WBS and and organize it into a structure showing the hierarchical work packages breakdown;Coordinate the preparation of Product Tree;Monitoring and control of the program;
12612	Issue	515	165	SABIA-Mar L2B Mission System RequirementSABIA- Mar L2B Environmental Requirement SABIA-Mar Mission Requirement ManagementSABIA-Mar Technical Resources Management PlanSABIA-Mar System Engineering PlanSystem Technical Requirements SpecificationInterface Requirements DocumentFunction, Product and Specification Trees
12630	Issue	518	165	Mission Verification and Validation PlanSABIA-Mar Interface Control DocumentSABIA EMC Control Plan
12635	Issue	519	164	This WP Includes the following tasks:Generate and Execute the Mission Assurance Plan including operations activities.Control the organizational structure of the SABIA-Mar project.Define the "SPARD Requirements Verification Plan". (See Verification Matrix)Review, approve and control the execution of the "PA Implementation Plan" (all contractors).Coordinate SMA activities for SABIA-Mar reviews.Coordination meeting with the different PA of the project suppliers.Conduct monthly (or as necessary) team telecom to assess significant assurance issues. Regulate inter-supplier and customer-supplier communications.
12683	DmsfFileRevision	52	48	
12684	DmsfFileRevision	52	49	
12690	DmsfFolder	132	48	
12691	DmsfFolder	132	49	
12697	DmsfFolder	133	48	
12698	DmsfFolder	133	49	
12704	DmsfFileRevision	53	48	
12705	DmsfFileRevision	53	49	
12711	DmsfFolder	134	48	
12712	DmsfFolder	134	49	
12718	DmsfFolder	135	48	
12719	DmsfFolder	135	49	
12725	DmsfFolder	136	48	
12726	DmsfFolder	136	49	
12732	DmsfFolder	137	48	
12733	DmsfFolder	137	49	
12739	DmsfFolder	138	48	
12740	DmsfFolder	138	49	
12746	DmsfFolder	139	48	
12747	DmsfFolder	139	49	
12752	DmsfFileRevision	54	48	
12751	DmsfFileRevision	54	49	Procedure
12754	DmsfFileRevision	54	167	SB1-D-SUM-D-D01-001
12755	DmsfFileRevision	54	168	ASCENTIO
12758	DmsfFileRevision	55	48	
12757	DmsfFileRevision	55	49	Plan
12760	DmsfFileRevision	55	167	SB1-D-RPT-R-D01-001
12761	DmsfFileRevision	55	168	ASCENTIO
12764	DmsfFileRevision	56	48	
12763	DmsfFileRevision	56	49	Procedure
12766	DmsfFileRevision	56	167	SB1-D-SUM-D-D01-001
12767	DmsfFileRevision	56	168	ASCENTIO
12769	DmsfFileRevision	57	49	
12770	DmsfFileRevision	57	48	
12772	DmsfFileRevision	57	167	SB1-G-RPT-T-D01-027
12773	DmsfFileRevision	57	168	ASCENTIO
12774	DmsfFolder	133	167	\N
12775	DmsfFolder	133	168	\N
12778	DmsfFileRevision	58	48	
12777	DmsfFileRevision	58	49	Procedure
12780	DmsfFileRevision	58	167	SB1-D-RPT-R-D01-001 
12781	DmsfFileRevision	58	168	ASCENTIO
12783	DmsfFileRevision	59	49	
12784	DmsfFileRevision	59	48	
12786	DmsfFileRevision	59	167	SB1-G-RPT-T-D01-027
12787	DmsfFileRevision	59	168	ASCENTIO
12791	Issue	528	164	\nThis WP includes the following tasks: \nManagement of nonconformances according to the closed-loop nonconformance control system that enables the identification, segregation, reporting, review, disposition, analysis, corrective actions, re-verification and prevention of recurrence of confirmed or suspected nonconformances. \nAlso Includes activities such as:\nReview all (major and minors) Nonconformances.\nTracking of Major NCs (at System Level).\nConvene the MRB for the resolution and closing of the Ncs.\n
12792	Issue	528	165	SABIA-Mar Mission Nonconformances Management Plan \n
12793	Issue	528	166	CONAE-GPS-SMA
12800	Issue	531	164	\nThis WP includes the following tasks:\nGenerate document of the Product / Document Tree of the SABIA-Mar mission.\nWrite the document that explains the process of managing the documentation. Mission Information & Configuration Management Plan.\nWrite Documentation Repository Structure (internal and external). \nManage the upload of documents and software in the repository of the mission SABIA-Mar.\nControl the reception of the documentation committed by each provider of the SABIAMAR mission in the corresponding phase, including assurance of the traceability of the documentation. \nManage the document codes of the SABIA-Mar mission documents.\n
12801	Issue	531	165	Document Management User Guide \nSABIA-Mar Mission Document Tree
12802	Issue	531	166	CONAE-GPS-SMA
12803	Issue	532	164	This WP includes the following tasks:\nWrite new version of the Configuration Management Plan to include the operational elements.\nDefine the decomposition structure of the SABIA-Mar system including Flight, Ground and Applications Segment\nIdentify Configuration Items\nUpload the structures in the CM tool defined\nManage SSM / PBS / PRODUCT TREE of Critical Items\nManage Changes of the identified items.\nTrack changes\nConfiguration Items Audits\nTrack Findings\nPublish approved changes to the CM tool
12804	Issue	532	165	SABIA-Mar Configuration Management Plan 
12805	Issue	532	166	CONAE-GPS-SMA
12806	Issue	533	164	\nVerify the ability of suppliers to perform the critical processes defined in the SPARD.\nVerify and control that all critical processes performed meet or exceed the requirements of JPL / NASA / MIL.\nPerform visual inspections with technical capacity to make situation reports.\n
12807	Issue	533	165	TBD
12808	Issue	533	166	CONAE-GPS-SMA
12809	Issue	534	164	\nVerify and control the SW QA Implementation Plan (all contractors: INVAP, STI, ASC, etc).\nReview and approve the all PFRs, NCRs and Anomalies reported by suppliers regarding SW.\nReview and incorporate standards and reference standards in order to reference the documentation if necessary.\nImplement and manage a software configuration control of GSE, EGSE, EM, FM and its subsystems involved (includes memory map, SW patches, flight software, etc)\n
12810	Issue	534	165	TBD
12811	Issue	534	166	CONAE-GPS-SMA
12812	Issue	535	164	\nProvide HW QA support to the different areas of the SABIA-MAR project, whether internal or from suppliers / contractors, and verify that the appropriate quality control processes for space systems are selected and used.\n
12813	Issue	535	165	TBD
12814	Issue	535	166	CONAE-GPS-SMA
12816	DmsfFileRevision	60	49	
12817	DmsfFileRevision	60	48	
12819	DmsfFileRevision	60	167	tbd
12820	DmsfFileRevision	60	168	ASCENTIO
12822	DmsfFileRevision	61	49	Procedure
12823	DmsfFileRevision	61	48	SB-020100-RQ-00100  SB1-G-RPT-T-D01-003 Commanding-5.0.0-DisenoeInformeDeTests Evidencias
12825	DmsfFileRevision	61	167	SB1-G-RPT-T-D01-003
12826	DmsfFileRevision	61	168	ASCENTIO
12828	DmsfFileRevision	62	49	Plan
12829	DmsfFileRevision	62	48	SB-020100-RQ-00100  SB1-G-RPT-T-D01-003 Commanding-5.0.0-DisenoeInformeDeTests Evidencias
12831	DmsfFileRevision	62	167	SB1-G-RPT-T-D01-003
12832	DmsfFileRevision	62	168	ASCENTIO
12834	DmsfFileRevision	63	49	
12835	DmsfFileRevision	63	48	
12837	DmsfFileRevision	63	167	qwe
12838	DmsfFileRevision	63	168	CNEA
12840	DmsfFileRevision	64	49	Plan
12841	DmsfFileRevision	64	48	SB-020100-PL-00100  SB1-G-RPT-T-D01-027 v1.0 ReporteEnsayosSBMA05
12843	DmsfFileRevision	64	167	SB1-G-RPT-T-D01-027
12844	DmsfFileRevision	64	168	ASCENTIO
12847	DmsfFileRevision	65	48	
12846	DmsfFileRevision	65	49	Plan
12849	DmsfFileRevision	65	167	SB1-G-RPT-T-D01-027
12850	DmsfFileRevision	65	168	ASCENTIO
12852	DmsfFileRevision	66	49	Plan
12853	DmsfFileRevision	66	48	SB-020100-RQ-00100  SB1-G-RPT-T-D01-027 v1.0 ReporteEnsayosSBMA05
12855	DmsfFileRevision	66	167	SB1-G-RPT-T-D01-027
12856	DmsfFileRevision	66	168	ASCENTIO
12858	DmsfFileRevision	67	49	
12859	DmsfFileRevision	67	48	
12861	DmsfFileRevision	67	167	asd
12862	DmsfFileRevision	67	168	VENG
12864	DmsfFileRevision	68	49	
12865	DmsfFileRevision	68	48	
12867	DmsfFileRevision	68	167	asda
12868	DmsfFileRevision	68	168	VENG
12870	DmsfFileRevision	69	49	Plan
12871	DmsfFileRevision	69	48	SB-020100-RQ-00100  SB1-G-RPT-T-D01-027 v1.0 ReporteEnsayosSBMA05
12873	DmsfFileRevision	69	167	SB1-G-RPT-T-D01-027
12874	DmsfFileRevision	69	168	ASCENTIO
12876	Issue	536	1	
12877	Issue	536	2	
12878	Issue	536	3	
12879	Issue	536	26	
12880	Issue	536	4	
12881	Issue	536	5	
12882	Issue	536	7	
12883	Issue	536	8	
12884	Issue	536	9	
12885	Issue	536	10	
12886	Issue	536	11	
12887	Issue	536	12	
12888	Issue	536	13	
12889	Issue	536	14	
12890	Issue	536	15	
12891	Issue	536	16	
12892	Issue	536	17	
12893	Issue	536	18	
12894	Issue	536	19	
12895	Issue	536	20	
12896	Issue	536	21	
12897	Issue	536	22	
12898	Issue	536	23	
12899	Issue	536	25	
12900	Issue	536	75	
12875	Issue	536	6	
12901	DmsfFileRevision	70	48	
12902	DmsfFileRevision	70	49	Technical Note
12903	DmsfFileRevision	70	172	Dataset form MOC 2.0 Acceptance and validation procedures
12904	DmsfFileRevision	70	171	MOCv2.0-OperationsAcceptanceAndValidationProcedures Dataset
12905	DmsfFileRevision	70	173	Iaran
12906	DmsfFileRevision	70	167	SBO-F-PRO-T-D01-002
12907	DmsfFileRevision	70	168	ASCENTIO
12908	DmsfFileRevision	70	174	0203 - Software Engineering
12909	DmsfFileRevision	71	48	SB-0203-TN-0100
12910	DmsfFileRevision	71	49	Technical Note
12911	DmsfFileRevision	71	172	Dataset form MOC 2.0 Acceptance and validation procedures
12912	DmsfFileRevision	71	171	MOCv2.0-OperationsAcceptanceAndValidationProcedures Dataset
12913	DmsfFileRevision	71	173	Iaran
12914	DmsfFileRevision	71	167	SBO-F-PRO-T-D01-002
12915	DmsfFileRevision	71	168	ASCENTIO
12916	DmsfFileRevision	71	174	0203 - Software Engineering
\.


--
-- Data for Name: dmsf_file_revision_accesses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_file_revision_accesses (id, dmsf_file_revision_id, action, user_id, created_at, updated_at) FROM stdin;
1	3	0	1	2021-10-04 13:35:58.42318	2021-10-04 13:35:58.42318
2	52	0	1	2021-12-10 13:08:40.791574	2021-12-10 13:08:40.791574
3	59	0	1	2021-12-16 17:18:28.122474	2021-12-16 17:18:28.122474
4	65	0	35	2021-12-23 17:12:27.230603	2021-12-23 17:12:27.230603
5	69	0	1	2021-12-23 17:46:39.673214	2021-12-23 17:46:39.673214
6	69	0	1	2022-01-06 17:17:08.173347	2022-01-06 17:17:08.173347
7	71	0	1	2022-02-22 16:10:18.513028	2022-02-22 16:10:18.513028
\.


--
-- Data for Name: dmsf_file_revisions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_file_revisions (id, dmsf_file_id, source_dmsf_file_revision_id, name, disk_filename, size, mime_type, title, description, workflow, major_version, minor_version, comment, deleted, deleted_by_user_id, user_id, created_at, updated_at, dmsf_workflow_id, dmsf_workflow_assigned_by_user_id, dmsf_workflow_assigned_at, dmsf_workflow_started_by_user_id, dmsf_workflow_started_at, digest) FROM stdin;
11	11	\N	SB1-G-RPT-T-D01-003_v2.0_Commanding-2.0-DisenoEInformeDeTest_evidencias.zip	210920124250_11_SB1-G-RPT-T-D01-003_v2.0_Commanding-2.0-DisenoEInformeDeTest_evidencias.zip	3306309	application/zip	SB1-G-RPT-T-D01-003 v2.0 Commanding-2.0-DisenoEInformeDeTest evidencias	\N	\N	0	1	\N	1	1	1	2021-09-20 12:42:50.002867	2021-12-07 18:57:47.610297	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
1	1	\N	SB-010100-LI-00100-B SABIA-Mar 1 WORK BREAKDOWN STRUCTURE.pdf	210920123634_1_SB-010100-LI-00100-B_SABIA-Mar_1_WORK_BREAKDOWN_STRUCTURE.pdf	4499712	application/pdf	SB-010100-LI-00100-B SABIA-Mar 1 WORK BREAKDOWN STRUCTURE	\N	\N	0	1	\N	1	1	1	2021-09-20 12:36:34.664376	2021-09-20 12:37:43.841448	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
2	2	\N	SABIAMAR RISK MANAGEMENT PLANvB.pdf	210920123659_2_SABIAMAR_RISK_MANAGEMENT_PLANvB.pdf	1567140	application/pdf	SABIAMAR RISK MANAGEMENT PLANvB	\N	\N	0	1	\N	1	1	1	2021-09-20 12:36:59.085296	2021-09-20 12:37:45.727417	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
4	4	\N	SABIAMAR RISK MANAGEMENT PLANvB.pdf	210920123935_4_SABIAMAR_RISK_MANAGEMENT_PLANvB.pdf	1567140	application/pdf	SABIAMAR RISK MANAGEMENT PLANvB	\N	\N	0	1	\N	1	1	1	2021-09-20 12:39:35.942695	2021-12-07 18:57:45.917537	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
5	5	\N	SB1-D-RPT-T-D01-005_v1.0_ReporteEntregaINVAP-GS-GSE-EMv1.2_evidences.md5	210920124003_5_SB1-D-RPT-T-D01-005_v1.0_ReporteEntregaINVAP-GS-GSE-EMv1.2_evidences.md5	305	\N	SB1-D-RPT-T-D01-005 v1.0 ReporteEntregaINVAP-GS-GSE-EMv1.2 evidences	\N	\N	0	1	\N	1	1	1	2021-09-20 12:40:03.122836	2021-12-07 18:57:46.895604	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
6	6	\N	SB1-G-RPT-T-D01-005_v2.1_ConfigurationControlManager-2.1-DisenoEInformeDeTest.pdf	210920124019_6_SB1-G-RPT-T-D01-005_v2.1_ConfigurationControlManager-2.1-DisenoEInformeDeTest.pdf	942644	application/pdf	SB1-G-RPT-T-D01-005 v2.1 ConfigurationControlManager-2.1-DisenoEInformeDeTest	\N	\N	0	1	\N	1	1	1	2021-09-20 12:40:19.236103	2021-12-07 18:57:47.052127	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
7	7	\N	SB1-G-RPT-T-D01-005_v2.1_ConfigurationControlManager-2.1-DisenoEInformeDeTest.zip	210920124043_7_SB1-G-RPT-T-D01-005_v2.1_ConfigurationControlManager-2.1-DisenoEInformeDeTest.zip	1706829	application/zip	SB1-G-RPT-T-D01-005 v2.1 ConfigurationControlManager-2.1-DisenoEInformeDeTest	\N	\N	0	1	\N	1	1	1	2021-09-20 12:40:43.448497	2021-12-07 18:57:47.151996	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
8	8	\N	SB1-G-RPT-T-D01-005_v2.1_ConfigurationControlManager-2.1-DisenoEInformeDeTest_evidencias.zip	210920124149_8_SB1-G-RPT-T-D01-005_v2.1_ConfigurationControlManager-2.1-DisenoEInformeDeTest_evidencias.zip	4718592	application/zip	SB1-G-RPT-T-D01-005 v2.1 ConfigurationControlManager-2.1-DisenoEInformeDeTest evidencias	\N	\N	0	1	\N	1	1	1	2021-09-20 12:41:49.179382	2021-12-07 18:57:47.253077	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
9	9	\N	SB1-G-SUM-D-D01-006_v2.2_ManualDeUsuarioConfigurationControlManager2.1.pdf	210920124150_9_SB1-G-SUM-D-D01-006_v2.2_ManualDeUsuarioConfigurationControlManager2.1.pdf	0	application/pdf	SB1-G-SUM-D-D01-006 v2.2 ManualDeUsuarioConfigurationControlManager2.1	\N	\N	0	1	\N	1	1	1	2021-09-20 12:41:50.879391	2021-12-07 18:57:47.352211	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
10	10	\N	SB1-G-RPT-T-D01-003_v2.0_Commanding-2.0-DisenoEInformeDeTest.pdf	210920124205_10_SB1-G-RPT-T-D01-003_v2.0_Commanding-2.0-DisenoEInformeDeTest.pdf	778785	application/pdf	SB1-G-RPT-T-D01-003 v2.0 Commanding-2.0-DisenoEInformeDeTest	\N	\N	0	1	\N	1	1	1	2021-09-20 12:42:05.160194	2021-12-07 18:57:47.510414	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
12	12	\N	_SB1-G-SUM-D-D01-004_v2.0_ManualDeUsuarioCommanding2.0.zip	210920124337_12__SB1-G-SUM-D-D01-004_v2.0_ManualDeUsuarioCommanding2.0.zip	3047424	application/zip	 SB1-G-SUM-D-D01-004 v2.0 ManualDeUsuarioCommanding2.0	\N	\N	0	1	\N	1	1	1	2021-09-20 12:43:37.178347	2021-12-07 18:57:47.717763	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
13	13	\N	SB1-G-RPT-D-D01-001_v2.1_OSBTEI-2.0.0-DisenoEInformeDeTest.pdf	210920124347_13_SB1-G-RPT-D-D01-001_v2.1_OSBTEI-2.0.0-DisenoEInformeDeTest.pdf	783095	application/pdf	SB1-G-RPT-D-D01-001 v2.1 OSBTEI-2.0.0-DisenoEInformeDeTest	\N	\N	0	1	\N	1	1	1	2021-09-20 12:43:47.826837	2021-12-07 18:57:47.975904	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
14	14	\N	SB1-G-RPT-D-D01-001_v2.1_OSBTEI-2.0.0-DisenoEInformeDeTest_evidencias.zip	210920124509_14_SB1-G-RPT-D-D01-001_v2.1_OSBTEI-2.0.0-DisenoEInformeDeTest_evidencias.zip	4915200	application/zip	SB1-G-RPT-D-D01-001 v2.1 OSBTEI-2.0.0-DisenoEInformeDeTest evidencias	\N	\N	0	1	\N	1	1	1	2021-09-20 12:45:09.921288	2021-12-07 18:57:48.075033	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
15	15	\N	SB1-G-SUM-D-D01-002_v2.0_ManualDeUsuarioComponenteTEI2.0.pdf	210920124512_15_SB1-G-SUM-D-D01-002_v2.0_ManualDeUsuarioComponenteTEI2.0.pdf	0	application/pdf	SB1-G-SUM-D-D01-002 v2.0 ManualDeUsuarioComponenteTEI2.0	\N	\N	0	1	\N	1	1	1	2021-09-20 12:45:12.205806	2021-12-07 18:57:48.166674	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
16	16	\N	SB1-G-RPT-T-D01-009_v1.0_StatusMonitor-1.0.0-DisenoEInformeDeTest.pdf	210920124548_16_SB1-G-RPT-T-D01-009_v1.0_StatusMonitor-1.0.0-DisenoEInformeDeTest.pdf	1840665	application/pdf	SB1-G-RPT-T-D01-009 v1.0 StatusMonitor-1.0.0-DisenoEInformeDeTest	\N	\N	0	1	\N	1	1	1	2021-09-20 12:45:48.098879	2021-12-07 18:57:48.37546	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
17	17	\N	SB1-G-RPT-T-D01-009_v1.0_StatusMonitor-1.0.0-DisenoEInformeDeTest_evidences.zip	210920124549_17_SB1-G-RPT-T-D01-009_v1.0_StatusMonitor-1.0.0-DisenoEInformeDeTest_evidences.zip	1578	application/zip	SB1-G-RPT-T-D01-009 v1.0 StatusMonitor-1.0.0-DisenoEInformeDeTest evidences	\N	\N	0	1	\N	1	1	1	2021-09-20 12:45:49.656864	2021-12-07 18:57:48.483757	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
18	18	\N	SB1-G-SUM-D-D01-010_v1.0_ManualDeUsuarioStatusMonitor1.0.pdf	210920124651_18_SB1-G-SUM-D-D01-010_v1.0_ManualDeUsuarioStatusMonitor1.0.pdf	4843938	application/pdf	SB1-G-SUM-D-D01-010 v1.0 ManualDeUsuarioStatusMonitor1.0	\N	\N	0	1	\N	1	1	1	2021-09-20 12:46:51.09684	2021-12-07 18:57:48.584115	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
19	19	\N	SB1-G-RPT-T-D01-004_v1.0_Viewer-1.0-DisenoEInformeDeTest.pdf	210920124707_19_SB1-G-RPT-T-D01-004_v1.0_Viewer-1.0-DisenoEInformeDeTest.pdf	776890	application/pdf	SB1-G-RPT-T-D01-004 v1.0 Viewer-1.0-DisenoEInformeDeTest	\N	\N	0	1	\N	1	1	1	2021-09-20 12:47:07.777457	2021-12-07 18:57:48.749565	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
3	3	\N	SB-010100-LI-00100-B SABIA-Mar 1 WORK BREAKDOWN STRUCTURE.pdf	210920123910_3_SB-010100-LI-00100-B_SABIA-Mar_1_WORK_BREAKDOWN_STRUCTURE.pdf	4499712	application/pdf	SB-010100-LI-00100-B SABIA-Mar 1 WORK BREAKDOWN STRUCTURE	\N	\N	0	1	\N	1	1	1	2021-09-20 12:39:10.555315	2021-12-07 18:57:45.780342	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
24	24	\N	IMG_20210407_161410400.jpg	210924150413_24_IMG_20210407_161410400.jpg	933329	image/jpeg	IMG 20210407 161410400	AVAB	\N	0	1	\N	0	\N	1	2021-09-24 15:04:13.900398	2021-09-24 15:04:13.900398	\N	\N	\N	\N	\N	ff348ff2a47d90b2be04e248b25b2314d8417cb26830b93e40d325c611070e87
25	25	\N	IMG_20210407_161704651.jpg	210924150413_25_IMG_20210407_161704651.jpg	788874	image/jpeg	IMG 20210407 161704651	AVAB	\N	0	1	\N	0	\N	1	2021-09-24 15:04:13.937418	2021-09-24 15:04:13.937418	\N	\N	\N	\N	\N	56fa515be1d44bc90713eab9cef91b85ee4cdd04f345e427aa2d4b17bed96462
26	26	\N	IMG_20210407_161710250.jpg	210924150413_26_IMG_20210407_161710250.jpg	795330	image/jpeg	IMG 20210407 161710250	AVAB	\N	0	1	\N	0	\N	1	2021-09-24 15:04:13.972036	2021-09-24 15:04:13.972036	\N	\N	\N	\N	\N	81e4fd8df67bab431652198d342608213f2280f995392682c5257a4a556143db
27	27	\N	IMG_20210407_161733171.jpg	210924150414_27_IMG_20210407_161733171.jpg	745230	image/jpeg	IMG 20210407 161733171	AVAB	\N	0	1	\N	0	\N	1	2021-09-24 15:04:14.008537	2021-09-24 15:04:14.008537	\N	\N	\N	\N	\N	22aed209c18d4c1e5671ee956bd4110fd3c26e1e1945d44e95696d5ea822fbbc
28	28	\N	IMG_20210407_161730452.jpg	210924150414_28_IMG_20210407_161730452.jpg	814288	image/jpeg	IMG 20210407 161730452	AVAB	\N	0	1	\N	0	\N	1	2021-09-24 15:04:14.044531	2021-09-24 15:04:14.044531	\N	\N	\N	\N	\N	e2edfc63b0078e3061eb4161f8c7036d56b7886f456077cc78e23b550977610a
29	29	\N	IMG_20210408_122820646.jpg	210924150414_29_IMG_20210408_122820646.jpg	1010578	image/jpeg	IMG 20210408 122820646	AVAB	\N	0	1	\N	0	\N	1	2021-09-24 15:04:14.080084	2021-09-24 15:04:14.080084	\N	\N	\N	\N	\N	8bbb98dca4efcf26d5b545548c4dca8022fe4576ffd35e7f4983ae7329e55b0e
30	30	\N	IMG_20210408_122855052.jpg	210924150414_30_IMG_20210408_122855052.jpg	1078328	image/jpeg	IMG 20210408 122855052	AVAB	\N	0	1	\N	0	\N	1	2021-09-24 15:04:14.115	2021-09-24 15:04:14.115	\N	\N	\N	\N	\N	e5bf22881fdc038fe5c843d6f00574399a3ab2921c4003deb9a94ca7a3b85ce9
31	31	\N	IMG_20210408_122832506.jpg	210924150414_31_IMG_20210408_122832506.jpg	1133237	image/jpeg	IMG 20210408 122832506	AVAB	\N	0	1	\N	0	\N	1	2021-09-24 15:04:14.150085	2021-09-24 15:04:14.150085	\N	\N	\N	\N	\N	5ae41a9c473303bbf424f9dee65c84748b6ede93c6745b88a1d350bfdd713237
32	32	\N	IMG_20210408_122857764.jpg	210924150414_32_IMG_20210408_122857764.jpg	1096211	image/jpeg	IMG 20210408 122857764	AVAB	\N	0	1	\N	0	\N	1	2021-09-24 15:04:14.18576	2021-09-24 15:04:14.18576	\N	\N	\N	\N	\N	04d5f06d7343a24819e3e45f501d3f3c9d684fcb92b155ea8fb544ad89e55beb
33	33	\N	IMG_20210408_122931872_BURST000_COVER.jpg	210924150414_33_IMG_20210408_122931872_BURST000_COVER.jpg	1392325	image/jpeg	IMG 20210408 122931872 BURST000 COVER	AVAB	\N	0	1	\N	0	\N	1	2021-09-24 15:04:14.220474	2021-09-24 15:04:14.220474	\N	\N	\N	\N	\N	651befaf4caf193ce7a29fcef684aeab4057d60bb6069bdda605601133a270cb
34	34	\N	S1300-21 CONAE - SABIA MAR - NCR - 4e cell self-discharge.pdf	210924153853_34_S1300-21_CONAE_-_SABIA_MAR_-_NCR_-_4e_cell_self-discharge.pdf	371631	application/pdf	S1300-21 CONAE - SABIA MAR - NCR - 4e cell self-discharge		\N	0	1	\N	0	\N	1	2021-09-24 15:38:53.166993	2021-09-24 15:38:53.166993	\N	\N	\N	\N	\N	d2ab65c784c04bcdadad63e3809ec798979fc2a6b2d141fb10da6d71f2cdf61e
35	35	\N	S1389-21_Sabia-Mar_Delivery preparation_MoM Signed.pdf	210924153853_35_S1389-21_Sabia-Mar_Delivery_preparation_MoM_Signed.pdf	767932	application/pdf	S1389-21 Sabia-Mar Delivery preparation MoM Signed		\N	0	1	\N	0	\N	1	2021-09-24 15:38:53.207607	2021-09-24 15:38:53.207607	\N	\N	\N	\N	\N	1bda3be3cfecc086b573ecf972b3a3c52a2db0005050d37483b2cd1fdacdb2ed
36	36	\N	Especificación de requerimientos y compliance matrix.rar	210924154442_36_Especificaci_n_de_requerimientos_y_compliance_matrix.rar	1720837	application/x-rar-compressed	Especificación de requerimientos y compliance matrix		\N	0	1	\N	0	\N	1	2021-09-24 15:44:42.734951	2021-09-24 15:44:42.734951	\N	\N	\N	\N	\N	a5b6086cb06e481668dbcc8465ff3aed163a73b55073401b25697c549398f850
37	37	\N	Informacion técnica adicional.rar	210924154442_37_Informacion_t_cnica_adicional.rar	2809996	application/x-rar-compressed	Informacion técnica adicional		\N	0	1	\N	0	\N	1	2021-09-24 15:44:42.78068	2021-09-24 15:44:42.78068	\N	\N	\N	\N	\N	2c2727f7dba61f26bafc8926b0b16205f666058a5a66a9ebf77b567fc9ebfb5b
38	38	\N	selección del actuador de Moog.rar	210924154442_38_selecci_n_del_actuador_de_Moog.rar	2470332	application/x-rar-compressed	selección del actuador de Moog		\N	0	1	\N	0	\N	1	2021-09-24 15:44:42.816266	2021-09-24 15:44:42.816266	\N	\N	\N	\N	\N	7eebb638ddf9e2442fcdcd287ceaca9c733c366c6910b15f369418bca6398238
39	39	\N	SBM-OBC-NC-00086 Orden incorrecto de encendido de fuentes power up SBC EM.docx	210924154623_39_SBM-OBC-NC-00086_Orden_incorrecto_de_encendido_de_fuentes_power_up_SBC_EM.docx	61374	application/vnd.openxmlformats-officedocument.wordprocessingml.document	SBM-OBC-NC-00086 Orden incorrecto de encendido de fuentes power up SBC EM		\N	0	1	\N	0	\N	1	2021-09-24 15:46:23.684853	2021-09-24 15:46:23.684853	\N	\N	\N	\N	\N	fe719243ee707754520058c2d1da704ec484ffea5b0566e9dc68a6fff88b085f
23	23	\N	SBM-OBC-NC-00004 SBC_EM_Listado_Seguimiento_No_Conformidad_Perdida_trazabilidad_Proyecto_PCB.xlsx	210924132406_23_SBM-OBC-NC-00004_SBC_EM_Listado_Seguimiento_No_Conformidad_Perdida_trazabilidad_Proyecto_PCB.xlsx	14964	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	SBM-OBC-NC-00004 SBC EM Listado Seguimiento No Conformidad Perdida trazabilidad Proyecto PCB		\N	0	1	\N	1	1	1	2021-09-24 13:24:06.939171	2021-09-24 16:12:24.677445	\N	\N	\N	\N	\N	9fa4208bd22aa2f4e8e4d39556a5ca94082f7afa6e8656176f9329a2d93f106c
41	40	40	SB-020100-RQ-00100-C SABIAMAR L2B ENVIROMENTAL REQUIREMENT DOCUMENT.pdf	210929181250_40_SB-020100-RQ-00100-C_SABIAMAR_L2B_ENVIROMENTAL_REQUIREMENT_DOCUMENT.pdf	458752	application/pdf	SB-020100-RQ-00100-C SABIAMAR L2B ENVIROMENTAL REQUIREMENT DOCUMENT		\N	-67	-32	Moved from req-attachs:General Documentation/SB-020100-RQ-00100-C SABIAMAR L2B ENVIROMENTAL REQUIREMENT DOCUMENT	1	1	1	2021-09-29 18:45:51.784883	2021-09-29 18:48:51.226318	\N	\N	\N	\N	\N	5ea879d3cb543f16df220ffc5ce93997f0bb11d28602e33e326b4811b45c7d25
40	40	\N	SB-020100-RQ-00100-C SABIAMAR L2B ENVIROMENTAL REQUIREMENT DOCUMENT.pdf	210929181250_40_SB-020100-RQ-00100-C_SABIAMAR_L2B_ENVIROMENTAL_REQUIREMENT_DOCUMENT.pdf	458752	application/pdf	SB-020100-RQ-00100-C SABIAMAR L2B ENVIROMENTAL REQUIREMENT DOCUMENT		\N	-67	-32		1	1	1	2021-09-29 18:12:50.249784	2021-09-29 18:48:51.25495	\N	\N	\N	\N	\N	5ea879d3cb543f16df220ffc5ce93997f0bb11d28602e33e326b4811b45c7d25
42	41	\N	SB-020100-RQ-00100-C SABIAMAR L2B ENVIROMENTAL REQUIREMENT DOCUMENT.pdf	210929185432_41_SB-020100-RQ-00100-C_SABIAMAR_L2B_ENVIROMENTAL_REQUIREMENT_DOCUMENT.pdf	458752	application/pdf	SB-020100-RQ-00100-C SABIAMAR L2B ENVIROMENTAL REQUIREMENT DOCUMENT		\N	-67	-32		0	\N	1	2021-09-29 18:54:32.195416	2021-09-29 18:54:32.195416	\N	\N	\N	\N	\N	5ea879d3cb543f16df220ffc5ce93997f0bb11d28602e33e326b4811b45c7d25
43	42	\N	SB-020100-RQ-00200-C SABIAMar L2B Mission System Requirement document.pdf	210929185432_42_SB-020100-RQ-00200-C_SABIAMar_L2B_Mission_System_Requirement_document.pdf	812727	application/pdf	SB-020100-RQ-00200-C SABIAMar L2B Mission System Requirement document		\N	-67	-32		0	\N	1	2021-09-29 18:54:32.245231	2021-09-29 18:54:32.245231	\N	\N	\N	\N	\N	c8d86b33ffa4e0595e71c127a6e8bfe00d47ed74fc6f6629be249a8c6c0d88bc
21	21	\N	SB1-G-SUM-D-D01-005_v1.0_ManualDeUsuarioViewer1.0.pdf	210920124737_21_SB1-G-SUM-D-D01-005_v1.0_ManualDeUsuarioViewer1.0.pdf	1387408	application/pdf	SB1-G-SUM-D-D01-005 v1.0 ManualDeUsuarioViewer1.0	\N	\N	0	1	\N	1	1	1	2021-09-20 12:47:37.855643	2021-12-07 18:57:48.958914	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
44	43	\N	SB-030000-RQ-00100-C SABIA-Mar L2B Safety And Mission Assurance Requirements.pdf	210929185432_43_SB-030000-RQ-00100-C_SABIA-Mar_L2B_Safety_And_Mission_Assurance_Requirements.pdf	527215	application/pdf	SB-030000-RQ-00100-C SABIA-Mar L2B Safety And Mission Assurance Requirements		\N	-67	-32		0	\N	1	2021-09-29 18:54:32.295464	2021-09-29 18:54:32.295464	\N	\N	\N	\N	\N	1d2350ece0666f56e81da3eabdde816d34a1a94c259783b291b5ffc7e90de296
45	44	\N	SB-040000-RQ-00400-B SABIAMar L1 and L2A Requirements.pdf	210929185432_44_SB-040000-RQ-00400-B_SABIAMar_L1_and_L2A_Requirements.pdf	883251	application/pdf	SB-040000-RQ-00400-B SABIAMar L1 and L2A Requirements		\N	-66	-32		0	\N	1	2021-09-29 18:54:32.362026	2021-09-29 18:54:32.362026	\N	\N	\N	\N	\N	648cf7d171af0e1af1b138b7bf7a6b81022e72bb85700f6d7fd9f8fbc7dc48ff
46	45	\N	conae_logo.png	210929191508_45_conae_logo.png	8612	image/png	conae logo		\N	0	1		0	\N	1	2021-09-29 19:15:08.242879	2021-09-29 19:15:08.242879	\N	\N	\N	\N	\N	9dff11a23e9a7306bd05e5410dc3570dec18dc4efe160168374e019665a5d07c
47	46	\N	REQUIREMENT TREE-36.jpg	210929191508_46_REQUIREMENT_TREE-36.jpg	105706	image/jpeg	REQUIREMENT TREE-36		\N	0	1		0	\N	1	2021-09-29 19:15:08.317761	2021-09-29 19:15:08.317761	\N	\N	\N	\N	\N	300b61ee851e8b8a4111a48cca5a76080f40cecafa83f569015b661aecd1e2c6
48	47	\N	sabia_satelite.png	210929191508_47_sabia_satelite.png	463606	image/png	sabia satelite		\N	0	1		0	\N	1	2021-09-29 19:15:08.367459	2021-09-29 19:15:08.367459	\N	\N	\N	\N	\N	7e642a74fe3223a7feaaab9cf607b9395c5f307dc3c6294165666e77007ccbf1
49	48	\N	satelite.jpg	210929191508_48_satelite.jpg	10874	image/jpeg	satelite		\N	0	1		0	\N	1	2021-09-29 19:15:08.442438	2021-09-29 19:15:08.442438	\N	\N	\N	\N	\N	2b6a7b9aa41446cda743108556d9f08b27b9ee4fe3abb2fc9ee80a36f49bb50e
50	49	\N	Screenshot_3.jpg	210929191508_49_Screenshot_3.jpg	14142	image/jpeg	Logo CONAE 1		\N	0	1		0	\N	1	2021-09-29 19:15:08.492467	2021-09-29 19:15:08.492467	\N	\N	\N	\N	\N	7d966efcee2803351fdd5650fa23580481f7d76074c6483166d25b39a15ef76e
51	50	\N	SB1-G-SUM-D-D01-025_v1.1_ManualdeUsuarioX-BandDownloader-v1.1.pdf	211202133312_50_SB1-G-SUM-D-D01-025_v1.1_ManualdeUsuarioX-BandDownloader-v1.1.pdf	1037463	application/pdf	SB1-G-SUM-D-D01-025 v1.1 ManualdeUsuarioX-BandDownloader-v1.1		\N	0	1	\N	0	\N	1	2021-12-02 13:33:12.373632	2021-12-02 13:33:12.373632	\N	\N	\N	\N	\N	28861ae84e5be1cabd3762b7502d25ac81334be8b57c7ffcbd4aad06f55b64c6
20	20	\N	SB1-G-RPT-T-D01-004_v1.0_Viewer-1.0-DisenoEInformeDeTest_evidencia.zip	210920124712_20_SB1-G-RPT-T-D01-004_v1.0_Viewer-1.0-DisenoEInformeDeTest_evidencia.zip	115067	application/zip	SB1-G-RPT-T-D01-004 v1.0 Viewer-1.0-DisenoEInformeDeTest evidencia	\N	\N	0	1	\N	1	1	1	2021-09-20 12:47:12.143171	2021-12-07 18:57:48.849522	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
52	51	\N	L1.csv	211209190104_51_L1.csv	252	application/vnd.ms-excel	cost & schedule		\N	0	1		0	\N	1	2021-12-09 19:01:04.898779	2021-12-09 19:01:04.898779	\N	\N	\N	\N	\N	230d0e59c10d05b46a6a9e8bbcb9b7f60ccedbe402cb5aed57cde423a3ab112b
53	52	\N	L2.csv	211209193543_52_L2.csv	9239	application/vnd.ms-excel	L2		\N	0	1		0	\N	1	2021-12-09 19:35:43.532443	2021-12-09 19:35:43.532443	\N	\N	\N	\N	\N	74e037b0ae19672aa1e43f1ec3b78414af24bc5d5db72d408ffb3a797de07a65
55	54	\N	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	211213125236_54_SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	0	text/plain	SB1-D-RPT-R-D01-001 v1.3 GS-GSEBaselineRequirements		\N	-65	-32		1	1	1	2021-12-13 12:52:36.823718	2021-12-13 12:59:43.609032	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
61	57	\N	SB1-G-RPT-T-D01-003_v5.0_Commanding-5.0.0-DisenoeInformeDeTests_Evidencias.md5	211220191247_57_SB1-G-RPT-T-D01-003_v5.0_Commanding-5.0.0-DisenoeInformeDeTests_Evidencias.md5	317		SB1-G-RPT-T-D01-003 v5.0 Commanding-5.0.0-DisenoeInformeDeTests Evidencias		\N	0	1		1	1	1	2021-12-20 19:12:47.712478	2021-12-20 19:13:20.407873	\N	\N	\N	\N	\N	171bdf121367be8980f31e429439b51a798c2dcedfcae5e9f08b9ee1aa317f32
56	53	54	SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.txt	211213125401_53_SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.txt	0	text/plain	SB1-D-SUM-D-D01-001 v2.1 ManualUsuarioGS-GSE-EMv2.0		\N	-66	0		1	1	1	2021-12-13 12:54:01.705912	2021-12-13 14:45:58.666798	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
54	53	\N	SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.txt	211213125236_53_SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.txt	0	text/plain	SB1-D-SUM-D-D01-001 v2.1 ManualUsuarioGS-GSE-EMv2.0		\N	-65	-32		1	1	1	2021-12-13 12:52:36.755481	2021-12-13 14:45:58.727755	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
60	51	52	L1.csv	211209190104_51_L1.csv	252	application/vnd.ms-excel	cost & schedule		3	-65	0		0	\N	1	2021-12-16 12:38:14.6363	2021-12-20 18:22:57.068896	2	1	2021-12-20 18:22:57.011179	\N	\N	
58	56	\N	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	211213150338_56_SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	0	text/plain	SB1-D-RPT-R-D01-001 v1.3 GS-GSEBaselineRequirements		1	-65	0		1	1	1	2021-12-13 15:03:38.354106	2021-12-20 19:08:52.559255	2	1	2021-12-13 15:10:59.00689	1	2021-12-16 12:46:45.151686	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
59	55	57	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211213151755_55_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	SB1-G-RPT-T-D01-027 v1.0 ReporteEnsayosSBMA05		\N	-65	1		1	1	1	2021-12-13 15:17:55.012599	2021-12-20 19:08:52.64454	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
57	55	\N	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211213125914_55_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	SB1-G-RPT-T-D01-027 v1.0 ReporteEnsayosSBMA05		3	-65	0		1	1	1	2021-12-13 12:59:14.45614	2021-12-20 19:08:52.682089	2	1	2021-12-13 13:00:25.949398	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
63	59	\N	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	211220193009_59_SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	0	text/plain	SB1-D-RPT-R-D01-001 v1.3 GS-GSEBaselineRequirements		2	-65	0		1	1	1	2021-12-20 19:30:09.904422	2022-02-07 15:38:37.736256	4	1	2021-12-20 19:30:21.821265	1	2021-12-20 19:30:50.925779	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
64	60	\N	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211223112611_60_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	SB1-G-RPT-T-D01-027 v1.0 ReporteEnsayosSBMA05		1	-65	0		1	1	1	2021-12-23 11:26:11.135709	2021-12-23 17:06:34.862634	4	1	2021-12-23 11:26:54.195703	1	2021-12-23 11:28:35.746977	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
65	61	\N	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211223170822_61_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	SB1-G-RPT-T-D01-027 v1.0 ReporteEnsayosSBMA05		1	-65	0	TBD	1	1	1	2021-12-23 17:08:22.113291	2021-12-23 17:16:21.951008	4	1	2021-12-23 17:09:43.829737	1	2021-12-23 17:10:16.341984	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
67	63	\N	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.pdf	211223172845_63_SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.pdf	1405671	application/pdf	SB1-D-RPT-R-D01-001 v1.3 GS-GSEBaselineRequirements		\N	0	1		1	1	1	2021-12-23 17:28:45.968536	2021-12-23 17:28:56.372618	\N	\N	\N	\N	\N	4d2d58826a53684b3f954e3e9fd44b0874133cebfd65d1f470d0425e2970da09
62	58	\N	SB1-G-RPT-T-D01-003_v5.0_Commanding-5.0.0-DisenoeInformeDeTests_Evidencias.md5	211220191416_58_SB1-G-RPT-T-D01-003_v5.0_Commanding-5.0.0-DisenoeInformeDeTests_Evidencias.md5	317		SB1-G-RPT-T-D01-003 v5.0 Commanding-5.0.0-DisenoeInformeDeTests Evidencias		2	-65	0		1	1	1	2021-12-20 19:14:16.078188	2022-02-09 12:19:41.660702	4	1	2021-12-20 19:14:39.517693	1	2021-12-20 19:21:41.001042	171bdf121367be8980f31e429439b51a798c2dcedfcae5e9f08b9ee1aa317f32
69	62	66	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211223173537_62_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	SB1-G-RPT-T-D01-027 v1.0 ReporteEnsayosSBMA05		\N	-65	1		1	1	1	2021-12-23 17:35:37.355767	2022-02-09 12:19:47.150765	\N	\N	\N	\N	\N	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
66	62	\N	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	211223171829_62_SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	0	text/plain	SB1-G-RPT-T-D01-027 v1.0 ReporteEnsayosSBMA05		1	-65	0		1	1	1	2021-12-23 17:18:29.854619	2022-02-09 12:19:47.186541	4	1	2021-12-23 17:18:40.468113	1	2021-12-23 17:18:58.199766	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
68	64	\N	SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.pdf	211223172945_64_SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.pdf	7419278	application/pdf	SB1-D-SUM-D-D01-001 v2.1 ManualUsuarioGS-GSE-EMv2.0		3	-65	0		1	1	1	2021-12-23 17:29:45.324135	2022-02-09 12:20:01.339531	4	1	2022-02-07 13:48:41.858482	\N	\N	1944f6e7cbfe6ccb4b3b55f0ebc33f377775a1be6f6c899788113fbc2d63ab62
70	65	\N	SBO-F-PRO-T-D01-002_v1.0_MOCv2.0-OperationsAcceptanceAndValidationProcedures_Dataset.md5	220222160813_65_SBO-F-PRO-T-D01-002_v1.0_MOCv2.0-OperationsAcceptanceAndValidationProcedures_Dataset.md5	337		SBO-F-PRO-T-D01-002 v1.0 MOCv2.0-OperationsAcceptanceAndValidationProcedures Dataset		3	-65	0		0	\N	1	2022-02-22 16:08:13.776756	2022-02-22 16:09:05.611776	4	1	2022-02-22 16:09:05.537413	\N	\N	3ff88f6af8ed701db7c8bf19fbff64a1b25d243f7236f55d9204fc0e97d04b3f
71	65	70	SBO-F-PRO-T-D01-002_v1.0_MOCv2.0-OperationsAcceptanceAndValidationProcedures_Dataset.md5	220222160813_65_SBO-F-PRO-T-D01-002_v1.0_MOCv2.0-OperationsAcceptanceAndValidationProcedures_Dataset.md5	337		SBO-F-PRO-T-D01-002 v1.0 MOCv2.0-OperationsAcceptanceAndValidationProcedures Dataset		\N	-65	0		0	\N	1	2022-02-22 16:10:03.862505	2022-02-22 16:10:03.862505	\N	\N	\N	\N	\N	
\.


--
-- Data for Name: dmsf_files; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_files (id, project_id, dmsf_folder_id, name, notification, deleted, deleted_by_user_id, created_at, updated_at) FROM stdin;
1	4	3	SB-010100-LI-00100-B SABIA-Mar 1 WORK BREAKDOWN STRUCTURE.pdf	f	1	1	2021-09-20 12:36:34.648609	2021-09-20 12:37:43.873053
2	4	4	SABIAMAR RISK MANAGEMENT PLANvB.pdf	f	1	1	2021-09-20 12:36:59.07118	2021-09-20 12:37:45.764938
24	2	46	IMG_20210407_161410400.jpg	f	0	\N	2021-09-24 15:04:13.89698	2021-09-24 15:04:13.89698
25	2	46	IMG_20210407_161704651.jpg	f	0	\N	2021-09-24 15:04:13.934553	2021-09-24 15:04:13.934553
26	2	46	IMG_20210407_161710250.jpg	f	0	\N	2021-09-24 15:04:13.969156	2021-09-24 15:04:13.969156
27	2	46	IMG_20210407_161733171.jpg	f	0	\N	2021-09-24 15:04:14.005507	2021-09-24 15:04:14.005507
28	2	46	IMG_20210407_161730452.jpg	f	0	\N	2021-09-24 15:04:14.041452	2021-09-24 15:04:14.041452
29	2	46	IMG_20210408_122820646.jpg	f	0	\N	2021-09-24 15:04:14.077104	2021-09-24 15:04:14.077104
30	2	46	IMG_20210408_122855052.jpg	f	0	\N	2021-09-24 15:04:14.112088	2021-09-24 15:04:14.112088
31	2	46	IMG_20210408_122832506.jpg	f	0	\N	2021-09-24 15:04:14.147144	2021-09-24 15:04:14.147144
32	2	46	IMG_20210408_122857764.jpg	f	0	\N	2021-09-24 15:04:14.182835	2021-09-24 15:04:14.182835
33	2	46	IMG_20210408_122931872_BURST000_COVER.jpg	f	0	\N	2021-09-24 15:04:14.217467	2021-09-24 15:04:14.217467
34	2	47	S1300-21 CONAE - SABIA MAR - NCR - 4e cell self-discharge.pdf	f	0	\N	2021-09-24 15:38:53.163622	2021-09-24 15:38:53.163622
35	2	47	S1389-21_Sabia-Mar_Delivery preparation_MoM Signed.pdf	f	0	\N	2021-09-24 15:38:53.204263	2021-09-24 15:38:53.204263
36	2	48	Especificación de requerimientos y compliance matrix.rar	f	0	\N	2021-09-24 15:44:42.731591	2021-09-24 15:44:42.731591
37	2	48	Informacion técnica adicional.rar	f	0	\N	2021-09-24 15:44:42.777335	2021-09-24 15:44:42.777335
38	2	48	selección del actuador de Moog.rar	f	0	\N	2021-09-24 15:44:42.813143	2021-09-24 15:44:42.813143
39	2	49	SBM-OBC-NC-00086 Orden incorrecto de encendido de fuentes power up SBC EM.docx	f	0	\N	2021-09-24 15:46:23.681519	2021-09-24 15:46:23.681519
23	2	45	SBM-OBC-NC-00004 SBC_EM_Listado_Seguimiento_No_Conformidad_Perdida_trazabilidad_Proyecto_PCB.xlsx	f	1	1	2021-09-24 13:24:06.936037	2021-09-24 16:12:24.697652
40	38	65	SB-020100-RQ-00100-C SABIAMAR L2B ENVIROMENTAL REQUIREMENT DOCUMENT.pdf	f	1	1	2021-09-29 18:12:50.23166	2021-09-29 18:48:51.271079
41	38	65	SB-020100-RQ-00100-C SABIAMAR L2B ENVIROMENTAL REQUIREMENT DOCUMENT.pdf	f	0	\N	2021-09-29 18:54:32.182794	2021-09-29 18:54:32.182794
42	38	65	SB-020100-RQ-00200-C SABIAMar L2B Mission System Requirement document.pdf	f	0	\N	2021-09-29 18:54:32.23262	2021-09-29 18:54:32.23262
43	38	65	SB-030000-RQ-00100-C SABIA-Mar L2B Safety And Mission Assurance Requirements.pdf	f	0	\N	2021-09-29 18:54:32.28131	2021-09-29 18:54:32.28131
44	38	65	SB-040000-RQ-00400-B SABIAMar L1 and L2A Requirements.pdf	f	0	\N	2021-09-29 18:54:32.348645	2021-09-29 18:54:32.348645
45	38	66	conae_logo.png	f	0	\N	2021-09-29 19:15:08.22747	2021-09-29 19:15:08.22747
46	38	66	REQUIREMENT TREE-36.jpg	f	0	\N	2021-09-29 19:15:08.279906	2021-09-29 19:15:08.279906
47	38	66	sabia_satelite.png	f	0	\N	2021-09-29 19:15:08.353397	2021-09-29 19:15:08.353397
48	38	66	satelite.jpg	f	0	\N	2021-09-29 19:15:08.428786	2021-09-29 19:15:08.428786
49	38	66	Screenshot_3.jpg	f	0	\N	2021-09-29 19:15:08.479772	2021-09-29 19:15:08.479772
50	1	69	SB1-G-SUM-D-D01-025_v1.1_ManualdeUsuarioX-BandDownloader-v1.1.pdf	f	0	\N	2021-12-02 13:33:12.370344	2021-12-02 13:33:12.370344
3	4	8	SB-010100-LI-00100-B SABIA-Mar 1 WORK BREAKDOWN STRUCTURE.pdf	f	1	1	2021-09-20 12:39:10.538942	2021-12-07 18:57:45.817366
4	4	9	SABIAMAR RISK MANAGEMENT PLANvB.pdf	f	1	1	2021-09-20 12:39:35.923893	2021-12-07 18:57:45.983361
5	4	27	SB1-D-RPT-T-D01-005_v1.0_ReporteEntregaINVAP-GS-GSE-EMv1.2_evidences.md5	f	1	1	2021-09-20 12:40:03.112061	2021-12-07 18:57:46.927394
6	4	28	SB1-G-RPT-T-D01-005_v2.1_ConfigurationControlManager-2.1-DisenoEInformeDeTest.pdf	f	1	1	2021-09-20 12:40:19.222881	2021-12-07 18:57:47.085201
7	4	28	SB1-G-RPT-T-D01-005_v2.1_ConfigurationControlManager-2.1-DisenoEInformeDeTest.zip	f	1	1	2021-09-20 12:40:43.438767	2021-12-07 18:57:47.18523
8	4	28	SB1-G-RPT-T-D01-005_v2.1_ConfigurationControlManager-2.1-DisenoEInformeDeTest_evidencias.zip	f	1	1	2021-09-20 12:41:49.172832	2021-12-07 18:57:47.291093
9	4	28	SB1-G-SUM-D-D01-006_v2.2_ManualDeUsuarioConfigurationControlManager2.1.pdf	f	1	1	2021-09-20 12:41:50.862527	2021-12-07 18:57:47.385048
10	4	29	SB1-G-RPT-T-D01-003_v2.0_Commanding-2.0-DisenoEInformeDeTest.pdf	f	1	1	2021-09-20 12:42:05.138913	2021-12-07 18:57:47.543879
11	4	29	SB1-G-RPT-T-D01-003_v2.0_Commanding-2.0-DisenoEInformeDeTest_evidencias.zip	f	1	1	2021-09-20 12:42:49.990538	2021-12-07 18:57:47.64401
12	4	29	_SB1-G-SUM-D-D01-004_v2.0_ManualDeUsuarioCommanding2.0.zip	f	1	1	2021-09-20 12:43:37.16286	2021-12-07 18:57:47.757998
13	4	31	SB1-G-RPT-D-D01-001_v2.1_OSBTEI-2.0.0-DisenoEInformeDeTest.pdf	f	1	1	2021-09-20 12:43:47.81024	2021-12-07 18:57:48.010318
14	4	31	SB1-G-RPT-D-D01-001_v2.1_OSBTEI-2.0.0-DisenoEInformeDeTest_evidencias.zip	f	1	1	2021-09-20 12:45:09.915269	2021-12-07 18:57:48.101726
15	4	31	SB1-G-SUM-D-D01-002_v2.0_ManualDeUsuarioComponenteTEI2.0.pdf	f	1	1	2021-09-20 12:45:12.1949	2021-12-07 18:57:48.201583
16	4	33	SB1-G-RPT-T-D01-009_v1.0_StatusMonitor-1.0.0-DisenoEInformeDeTest.pdf	f	1	1	2021-09-20 12:45:48.079188	2021-12-07 18:57:48.418559
17	4	33	SB1-G-RPT-T-D01-009_v1.0_StatusMonitor-1.0.0-DisenoEInformeDeTest_evidences.zip	f	1	1	2021-09-20 12:45:49.637586	2021-12-07 18:57:48.518317
18	4	33	SB1-G-SUM-D-D01-010_v1.0_ManualDeUsuarioStatusMonitor1.0.pdf	f	1	1	2021-09-20 12:46:51.088884	2021-12-07 18:57:48.618983
19	4	34	SB1-G-RPT-T-D01-004_v1.0_Viewer-1.0-DisenoEInformeDeTest.pdf	f	1	1	2021-09-20 12:47:07.763348	2021-12-07 18:57:48.785021
20	4	34	SB1-G-RPT-T-D01-004_v1.0_Viewer-1.0-DisenoEInformeDeTest_evidencia.zip	f	1	1	2021-09-20 12:47:12.125806	2021-12-07 18:57:48.899174
21	4	34	SB1-G-SUM-D-D01-005_v1.0_ManualDeUsuarioViewer1.0.pdf	f	1	1	2021-09-20 12:47:37.836066	2021-12-07 18:57:48.993508
51	4	108	L1.csv	f	0	\N	2021-12-09 19:01:04.818409	2021-12-09 19:01:04.818409
52	4	108	L2.csv	f	0	\N	2021-12-09 19:35:43.508056	2021-12-09 19:35:43.508056
54	4	139	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	f	1	1	2021-12-13 12:52:36.813948	2021-12-13 12:59:43.630968
53	4	139	SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.txt	f	1	1	2021-12-13 12:52:36.726987	2021-12-13 14:45:58.755195
56	4	139	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	f	1	1	2021-12-13 15:03:38.332135	2021-12-20 19:08:52.582385
55	4	139	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	f	1	1	2021-12-13 12:59:14.434683	2021-12-20 19:08:52.707249
57	4	139	SB1-G-RPT-T-D01-003_v5.0_Commanding-5.0.0-DisenoeInformeDeTests_Evidencias.md5	f	1	1	2021-12-20 19:12:47.688089	2021-12-20 19:13:20.438189
60	4	139	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	f	1	1	2021-12-23 11:26:11.108094	2021-12-23 17:06:34.899192
61	4	139	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	f	1	1	2021-12-23 17:08:22.096023	2021-12-23 17:16:21.985463
63	4	139	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.pdf	f	1	1	2021-12-23 17:28:45.938915	2021-12-23 17:28:56.400809
62	4	139	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05.txt	f	1	1	2021-12-23 17:18:29.837355	2022-02-09 12:19:47.205973
64	4	139	SB1-D-SUM-D-D01-001_v2.1_ManualUsuarioGS-GSE-EMv2.0.pdf	f	1	1	2021-12-23 17:29:45.313641	2022-02-09 12:20:01.370582
59	4	139	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	f	1	1	2021-12-20 19:30:09.886162	2022-02-07 15:38:37.769352
58	4	139	SB1-G-RPT-T-D01-003_v5.0_Commanding-5.0.0-DisenoeInformeDeTests_Evidencias.md5	f	1	1	2021-12-20 19:14:16.069835	2022-02-09 12:19:41.718525
65	4	139	SBO-F-PRO-T-D01-002_v1.0_MOCv2.0-OperationsAcceptanceAndValidationProcedures_Dataset.md5	f	0	\N	2022-02-22 16:08:13.706314	2022-02-22 16:08:13.706314
\.


--
-- Data for Name: dmsf_folder_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_folder_permissions (id, dmsf_folder_id, object_id, object_type) FROM stdin;
\.


--
-- Data for Name: dmsf_folders; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_folders (id, project_id, dmsf_folder_id, title, description, notification, user_id, created_at, updated_at, deleted, deleted_by_user_id, system) FROM stdin;
1	4	\N	00 - Project documents		f	1	2021-09-20 12:30:48.456127	2021-09-20 12:35:07.147384	1	1	f
5	4	\N	02 - System Engineering	\N	f	1	2021-09-20 12:36:59.818402	2021-09-20 12:37:29.757767	1	1	f
3	4	2	0101 - Project Management	\N	f	1	2021-09-20 12:35:16.601744	2021-09-20 12:37:44.413794	1	1	f
4	4	2	0102 Risk Management	\N	f	1	2021-09-20 12:36:35.578341	2021-09-20 12:37:46.259387	1	1	f
2	4	\N	01 - Project Management	\N	f	1	2021-09-20 12:35:15.099818	2021-09-20 12:37:46.850582	1	1	f
42	5	\N	prueba		f	1	2021-09-20 13:12:50.356198	2021-09-20 13:12:50.356198	0	\N	f
43	38	\N	General Documentation		f	1	2021-09-20 13:22:27.874852	2021-09-20 13:22:27.874852	0	\N	f
44	2	\N	.Issues	Documents assigned to issues	f	4	2021-09-24 13:24:06.813301	2021-09-24 13:24:06.813301	0	\N	t
45	2	44	454 - SBM-NCR-00031	\N	f	4	2021-09-24 13:24:06.83531	2021-09-24 13:24:06.83531	0	\N	t
46	2	44	378 - SBM-NCR-00000	\N	f	4	2021-09-24 15:04:13.771706	2021-09-24 15:04:13.771706	0	\N	t
47	2	44	371 - SBM-NCR-00035	\N	f	4	2021-09-24 15:38:53.109463	2021-09-24 15:38:53.109463	0	\N	t
48	2	44	367 - SBM-NCR-00037	\N	f	4	2021-09-24 15:44:42.669917	2021-09-24 15:44:42.669917	0	\N	t
49	2	44	366 - SBM-NCR-00000	\N	f	4	2021-09-24 15:46:23.639246	2021-09-24 15:46:23.639246	0	\N	t
50	38	\N	Base lines		f	1	2021-09-29 18:08:43.577124	2021-09-29 18:10:09.264696	1	1	f
51	38	\N	Imagenes		f	1	2021-09-29 18:09:01.960894	2021-09-29 18:10:09.29697	1	1	f
54	38	\N	asfdasd		f	1	2021-09-29 18:11:05.76942	2021-09-29 18:11:25.478278	1	1	f
53	38	\N	qwe		f	1	2021-09-29 18:10:56.179671	2021-09-29 18:11:25.50762	1	1	f
52	38	\N	Base lines		f	1	2021-09-29 18:10:17.652069	2021-09-29 18:23:53.288443	1	1	f
55	38	\N	Imagenes		f	1	2021-09-29 18:13:12.81553	2021-09-29 18:23:53.318641	1	1	f
58	38	\N	asdas		f	1	2021-09-29 18:24:17.274056	2021-09-29 18:28:36.617301	1	1	f
59	38	\N	Base lines		f	1	2021-09-29 18:28:52.211654	2021-09-29 18:29:01.13829	1	1	f
60	38	\N	dfsdffasf		f	1	2021-09-29 18:35:26.464761	2021-09-29 18:35:37.049167	1	1	f
6	4	\N	00 - Project Documents	\N	f	1	2021-09-20 12:37:56.918575	2021-12-07 18:57:45.61431	1	1	f
7	4	6	01 - Project Management	\N	f	1	2021-09-20 12:37:58.379354	2021-12-07 18:57:45.671504	1	1	f
8	4	7	0101 - Project Management	\N	f	1	2021-09-20 12:37:59.878502	2021-12-07 18:57:45.713099	1	1	f
64	4	\N	qweqwe		f	1	2021-09-29 18:40:14.591323	2021-09-29 18:40:35.098976	1	1	f
65	38	43	Base lines		f	1	2021-09-29 18:44:31.638103	2021-09-29 18:45:20.29095	0	\N	f
66	38	43	Images		f	1	2021-09-29 18:45:13.83021	2021-09-29 18:45:30.353844	0	\N	f
24	4	23	GS-GSE-EM	\N	f	1	2021-09-20 12:39:56.454825	2021-12-07 18:57:46.639953	1	1	f
68	1	\N	.Issues	Documents assigned to issues	f	4	2021-12-02 13:28:34.457186	2021-12-02 13:28:34.457186	0	\N	t
69	1	68	462 - prueba	\N	f	4	2021-12-02 13:28:34.478684	2021-12-02 13:28:34.478684	0	\N	t
9	4	7	0102 Risk Management	\N	f	1	2021-09-20 12:39:11.501414	2021-12-07 18:57:45.84301	1	1	f
10	4	6	02 - System Engineering	\N	f	1	2021-09-20 12:39:36.615329	2021-12-07 18:57:46.002576	1	1	f
11	4	\N	01 - Reviews	\N	f	1	2021-09-20 12:39:37.959918	2021-12-07 18:57:46.043848	1	1	f
12	4	11	01 - Major Reviews	\N	f	1	2021-09-20 12:39:39.404265	2021-12-07 18:57:46.08745	1	1	f
13	4	12	01.PMSRR	\N	f	1	2021-09-20 12:39:40.818275	2021-12-07 18:57:46.130207	1	1	f
14	4	12	02.PDR	\N	f	1	2021-09-20 12:39:42.23452	2021-12-07 18:57:46.187737	1	1	f
15	4	12	03.GS-CDR	\N	f	1	2021-09-20 12:39:43.635732	2021-12-07 18:57:46.229669	1	1	f
16	4	12	04.FS-CDR	\N	f	1	2021-09-20 12:39:45.040964	2021-12-07 18:57:46.276838	1	1	f
17	4	12	05.M-CDR	\N	f	1	2021-09-20 12:39:46.447539	2021-12-07 18:57:46.321023	1	1	f
18	4	11	02 - System Reviews	\N	f	1	2021-09-20 12:39:47.848375	2021-12-07 18:57:46.378182	1	1	f
19	4	11	03 - Peer Reviews	\N	f	1	2021-09-20 12:39:49.219331	2021-12-07 18:57:46.419691	1	1	f
20	4	\N	02 - Received Documents		f	1	2021-09-20 12:39:50.617504	2021-12-07 18:57:46.458787	1	1	f
21	4	20	01 - Providers - Contractors	\N	f	1	2021-09-20 12:39:52.411358	2021-12-07 18:57:46.502963	1	1	f
22	4	21	ASC	\N	f	1	2021-09-20 12:39:53.823129	2021-12-07 18:57:46.552503	1	1	f
23	4	22	 Certificaciones GS-GSE	\N	f	1	2021-09-20 12:39:55.036135	2021-12-07 18:57:46.597262	1	1	f
25	4	24	GS-GSE-EM1.2	\N	f	1	2021-09-20 12:39:58.074851	2021-12-07 18:57:46.682887	1	1	f
26	4	25	Documentacion SAT GS-GSE-EM1.2	\N	f	1	2021-09-20 12:39:59.485028	2021-12-07 18:57:46.753086	1	1	f
27	4	26	Documentacion componentes GS	\N	f	1	2021-09-20 12:40:00.93203	2021-12-07 18:57:46.816523	1	1	f
28	4	27	CCM 2.1.0	\N	f	1	2021-09-20 12:40:04.009824	2021-12-07 18:57:46.961239	1	1	f
29	4	27	Commanding 2.0.0	\N	f	1	2021-09-20 12:41:52.00938	2021-12-07 18:57:47.419065	1	1	f
30	4	27	GS web 2.0.0	\N	f	1	2021-09-20 12:43:38.378682	2021-12-07 18:57:47.785515	1	1	f
31	4	27	TEI 2.0.0	\N	f	1	2021-09-20 12:43:39.755795	2021-12-07 18:57:47.837507	1	1	f
32	4	27	TI Core 2.1.1	\N	f	1	2021-09-20 12:45:13.218661	2021-12-07 18:57:48.235141	1	1	f
33	4	27	TI Status Monitor 1.0.0	\N	f	1	2021-09-20 12:45:14.790364	2021-12-07 18:57:48.291821	1	1	f
34	4	27	Tlmy Viewer 1.0.0	\N	f	1	2021-09-20 12:46:52.807633	2021-12-07 18:57:48.652168	1	1	f
35	4	26	Documentacion GS-GSE-EM1.2	\N	f	1	2021-09-20 12:47:38.593242	2021-12-07 18:57:49.026152	1	1	f
36	4	21	INVAP	\N	f	1	2021-09-20 12:47:39.93051	2021-12-07 18:57:49.070617	1	1	f
37	4	20	02 - CONAE	\N	f	1	2021-09-20 12:47:41.358096	2021-12-07 18:57:49.111432	1	1	f
38	4	37	MSE	\N	f	1	2021-09-20 12:47:42.778544	2021-12-07 18:57:49.160107	1	1	f
39	4	37	SMA	\N	f	1	2021-09-20 12:47:44.313328	2021-12-07 18:57:49.204065	1	1	f
40	4	20	03 - Configuration Control	\N	f	1	2021-09-20 12:47:45.712289	2021-12-07 18:57:49.244316	1	1	f
41	4	20	04 -  Requirements	\N	f	1	2021-09-20 12:47:47.118201	2021-12-07 18:57:49.285821	1	1	f
67	4	\N	03 Restricted Documents		f	1	2021-10-03 17:25:17.890398	2021-12-07 18:57:49.325481	1	1	f
70	4	\N	Safety & Mission Assurance		f	1	2021-12-07 19:01:22.859293	2021-12-07 19:02:07.607297	1	1	f
71	4	\N	Safety & Mission Assurance		f	1	2021-12-07 19:04:35.078481	2021-12-07 19:08:10.106953	1	1	f
72	4	71	Electrical - Electronic and Electromechanical Parts - Materials & Processes (EEE Parts - Materials & Processes)		f	1	2021-12-07 19:04:57.895372	2021-12-07 19:08:10.156535	1	1	f
73	4	\N	Safety & Mission Assurance		f	1	2021-12-07 19:17:37.273559	2021-12-07 19:19:26.53712	1	1	f
74	4	73	Electrical - Electronic and Electromechanical Parts - Materials & Processes (EEE Parts - Materials & Processes)		f	1	2021-12-07 19:17:56.713028	2021-12-07 19:19:26.570542	1	1	f
79	4	75	Cost & Schedule		f	1	2021-12-07 19:19:51.006976	2021-12-07 19:53:47.854069	1	1	f
77	4	75	Project Planning		f	1	2021-12-07 19:19:46.723027	2021-12-07 19:53:47.925013	1	1	f
78	4	75	Project Reviews		f	1	2021-12-07 19:19:48.96219	2021-12-07 19:53:47.975486	1	1	f
76	4	75	Risk Managemet		f	1	2021-12-07 19:19:44.554084	2021-12-07 19:53:48.007949	1	1	f
97	4	\N	Contamination Control		f	1	2021-12-07 19:20:31.029025	2021-12-07 19:53:47.777202	1	1	f
75	4	\N	Project Management		f	1	2021-12-07 19:19:40.271539	2021-12-07 19:53:47.816468	1	1	f
80	4	75	Logistics & Facilities		f	1	2021-12-07 19:19:53.129278	2021-12-07 19:53:47.891691	1	1	f
86	4	\N	Safety & Mission Assurance		f	1	2021-12-07 19:20:04.331949	2021-12-07 19:53:48.039383	1	1	f
96	4	86	Electrical - Electronic and Electromechanical Parts - Materials & Processes (EEE Parts - Materials & Processes)		f	1	2021-12-07 19:20:28.952754	2021-12-07 19:53:48.074749	1	1	f
94	4	86	Environments		f	1	2021-12-07 19:20:24.685474	2021-12-07 19:53:48.107953	1	1	f
102	4	86	Operations Assurance		f	1	2021-12-07 19:20:44.61545	2021-12-07 19:53:48.141433	1	1	f
98	4	86	Quality Assurance		f	1	2021-12-07 19:20:33.020197	2021-12-07 19:53:48.17524	1	1	f
99	4	98	Critical Processes		f	1	2021-12-07 19:20:36.35872	2021-12-07 19:53:48.209446	1	1	f
101	4	98	Hardware QA		f	1	2021-12-07 19:20:42.609494	2021-12-07 19:53:48.242116	1	1	f
100	4	98	Software QA		f	1	2021-12-07 19:20:39.238343	2021-12-07 19:53:48.27555	1	1	f
95	4	86	Reliability		f	1	2021-12-07 19:20:26.660928	2021-12-07 19:53:48.30892	1	1	f
87	4	86	SMA Management		f	1	2021-12-07 19:20:06.322024	2021-12-07 19:53:48.341158	1	1	f
92	4	87	Configuration Control Activities		f	1	2021-12-07 19:20:20.907622	2021-12-07 19:53:48.376493	1	1	f
91	4	87	Documentation Management Activities		f	1	2021-12-07 19:20:18.042213	2021-12-07 19:53:48.409252	1	1	f
88	4	87	Non-conformance processes activities		f	1	2021-12-07 19:20:09.636371	2021-12-07 19:53:48.442661	1	1	f
90	4	87	PFRs and Anomalies		f	1	2021-12-07 19:20:15.250828	2021-12-07 19:53:48.476026	1	1	f
89	4	87	Waivers and deviations process activities		f	1	2021-12-07 19:20:12.447356	2021-12-07 19:53:48.509044	1	1	f
93	4	86	System Safety		f	1	2021-12-07 19:20:22.818954	2021-12-07 19:53:48.541036	1	1	f
81	4	\N	System Engineering		f	1	2021-12-07 19:19:54.538601	2021-12-07 19:53:48.575388	1	1	f
83	4	81	Mission Design		f	1	2021-12-07 19:19:59.142905	2021-12-07 19:53:48.608631	1	1	f
85	4	81	Project Verification & Validation		f	1	2021-12-07 19:20:03.102582	2021-12-07 19:53:48.64115	1	1	f
84	4	81	Software Engineering		f	1	2021-12-07 19:20:01.105526	2021-12-07 19:53:48.674891	1	1	f
82	4	81	System Engineering Management		f	1	2021-12-07 19:19:57.072708	2021-12-07 19:53:48.70788	1	1	f
103	4	\N	folder_test		f	1	2021-12-07 20:02:05.024879	2021-12-07 20:03:14.512657	1	1	f
105	4	104	Risk Managemet		f	1	2021-12-07 20:04:39.46883	2021-12-07 20:04:39.46883	0	\N	f
106	4	104	Project Planning		f	1	2021-12-07 20:04:41.626916	2021-12-07 20:04:41.626916	0	\N	f
107	4	104	Project Reviews		f	1	2021-12-07 20:04:43.697816	2021-12-07 20:04:43.697816	0	\N	f
108	4	104	Cost & Schedule		f	1	2021-12-07 20:04:45.859494	2021-12-07 20:04:45.859494	0	\N	f
109	4	104	Logistics & Facilities		f	1	2021-12-07 20:04:47.926774	2021-12-07 20:04:47.926774	0	\N	f
111	4	110	System Engineering Management		f	1	2021-12-07 20:04:50.978958	2021-12-07 20:04:50.978958	0	\N	f
112	4	110	Mission Design		f	1	2021-12-07 20:04:52.971972	2021-12-07 20:04:52.971972	0	\N	f
113	4	110	Software Engineering		f	1	2021-12-07 20:04:55.038885	2021-12-07 20:04:55.038885	0	\N	f
114	4	110	Project Verification & Validation		f	1	2021-12-07 20:04:57.077746	2021-12-07 20:04:57.077746	0	\N	f
116	4	115	SMA Management		f	1	2021-12-07 20:05:00.212413	2021-12-07 20:05:00.212413	0	\N	f
117	4	116	Non-conformance processes activities		f	1	2021-12-07 20:05:02.877816	2021-12-07 20:05:02.877816	0	\N	f
118	4	116	Waivers and deviations process activities		f	1	2021-12-07 20:05:05.724457	2021-12-07 20:05:05.724457	0	\N	f
119	4	116	PFRs and Anomalies		f	1	2021-12-07 20:05:08.579245	2021-12-07 20:05:08.579245	0	\N	f
120	4	116	Documentation Management Activities		f	1	2021-12-07 20:05:11.908205	2021-12-07 20:05:11.908205	0	\N	f
121	4	116	Configuration Control Activities		f	1	2021-12-07 20:05:15.037103	2021-12-07 20:05:15.037103	0	\N	f
122	4	115	System Safety		f	1	2021-12-07 20:05:17.078625	2021-12-07 20:05:17.078625	0	\N	f
123	4	115	Environments		f	1	2021-12-07 20:05:21.288048	2021-12-07 20:05:21.288048	0	\N	f
124	4	115	Reliability		f	1	2021-12-07 20:05:27.279674	2021-12-07 20:05:27.279674	0	\N	f
125	4	115	Electrical - Electronic and Electromechanical Parts - Materials & Processes (EEE Parts - Materials & Processes)		f	1	2021-12-07 20:05:29.49734	2021-12-07 20:05:29.49734	0	\N	f
126	4	115	Contamination Control		f	1	2021-12-07 20:05:31.798609	2021-12-07 20:05:31.798609	0	\N	f
127	4	115	Quality Assurance		f	1	2021-12-07 20:05:35.286416	2021-12-07 20:05:35.286416	0	\N	f
128	4	127	Critical Processes		f	1	2021-12-07 20:05:38.198577	2021-12-07 20:05:38.198577	0	\N	f
129	4	127	Software QA		f	1	2021-12-07 20:05:42.276257	2021-12-07 20:05:42.276257	0	\N	f
130	4	127	Hardware QA		f	1	2021-12-07 20:05:45.246281	2021-12-07 20:05:45.246281	0	\N	f
131	4	115	Operations Assurance		f	1	2021-12-07 20:05:47.469417	2021-12-07 20:05:47.469417	0	\N	f
132	49	\N	.Issues	Documents assigned to issues	f	4	2021-12-09 19:18:30.923616	2021-12-09 19:18:30.923616	0	\N	t
134	4	\N	Project Documents		f	1	2021-12-09 19:44:55.682803	2021-12-09 19:44:55.682803	0	\N	f
104	4	134	Project Management		f	1	2021-12-07 20:04:35.02094	2021-12-09 19:45:00.123745	0	\N	f
115	4	134	Safety & Mission Assurance		f	1	2021-12-07 20:04:58.286937	2021-12-09 19:45:02.619555	0	\N	f
110	4	134	System Engineering		f	1	2021-12-07 20:04:49.044906	2021-12-09 19:45:08.13593	0	\N	f
135	4	\N	Received Documents		f	1	2021-12-09 19:45:34.509213	2021-12-09 19:45:34.509213	0	\N	f
136	4	\N	Reviews		f	1	2021-12-09 19:46:00.220701	2021-12-09 19:46:00.220701	0	\N	f
137	4	\N	Restricted Documents		f	1	2021-12-09 19:46:30.766781	2021-12-09 19:46:30.766781	0	\N	f
138	4	135	ASC		f	1	2021-12-09 19:47:37.75126	2021-12-09 19:47:45.122672	0	\N	f
139	4	138	CER 9		f	1	2021-12-09 19:47:59.903059	2021-12-09 19:48:20.021419	0	\N	f
133	49	132	513 - 1.5	\N	f	4	2021-12-09 19:18:30.956223	2021-12-13 14:25:08.209613	0	\N	t
\.


--
-- Data for Name: dmsf_links; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_links (id, target_project_id, target_id, target_type, name, project_id, dmsf_folder_id, deleted, deleted_by_user_id, created_at, updated_at, external_url, user_id) FROM stdin;
1	4	3	DmsfFile	Documents	1	69	0	\N	2021-12-02 13:28:26.310865	2021-12-02 13:28:34.487303	\N	1
3	4	51	DmsfFile	Documents	49	133	0	\N	2021-12-13 14:24:44.781596	2021-12-13 14:25:08.218456	\N	1
4	4	51	DmsfFile	Documents	80	\N	0	\N	2021-12-16 15:54:19.976064	2021-12-16 15:54:19.976064	\N	1
5	4	51	DmsfFile	L1.csv	80	\N	0	\N	2021-12-16 15:55:58.459714	2021-12-16 15:55:58.459714	\N	1
6	4	58	DmsfFile	SB-020100-RQ-00100 SB1-G-RPT-T-D01-003 Commanding-5.0.0-DisenoeInformeDeTests Evidencias	79	\N	0	\N	2021-12-21 11:41:49.104734	2021-12-21 11:41:49.104734	\N	1
7	4	62	DmsfFile	SB1-G-RPT-T-D01-027_v1.0_ReporteEnsayosSBMA05	80	\N	0	\N	2021-12-23 17:46:59.571549	2021-12-23 17:46:59.571549	\N	1
8	4	59	DmsfFile	SB1-D-RPT-R-D01-001_v1.3_GS-GSEBaselineRequirements.txt	79	\N	0	\N	2021-12-23 17:48:02.002084	2021-12-23 17:48:02.002084	\N	1
9	4	58	DmsfFile	SB1-G-RPT-T-D01-003_v5.0_Commanding-5.0.0-DisenoeInformeDeTests_Evidencias.md5	50	\N	0	\N	2021-12-23 18:00:44.836805	2021-12-23 18:00:44.836805	\N	1
\.


--
-- Data for Name: dmsf_locks; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_locks (id, entity_id, user_id, created_at, updated_at, entity_type, lock_type_cd, lock_scope_cd, uuid, expires_at, dmsf_file_last_revision_id, owner) FROM stdin;
1	3	1	2021-12-07 12:19:34.684637	2021-12-07 12:19:34.684637	0	0	0	1f76b881-570b-4f3d-a419-d129bd72f1ef	\N	3	\N
2	55	1	2021-12-13 13:00:26.133449	2021-12-13 13:00:26.133449	0	0	0	6fac8e04-ca97-4af6-be6b-0aedc279f8ff	\N	57	\N
4	51	1	2021-12-20 18:22:57.128539	2021-12-20 18:22:57.128539	0	0	0	d82c9c5b-a08b-4242-9324-10bfe70f0e15	\N	60	\N
\.


--
-- Data for Name: dmsf_public_urls; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_public_urls (id, token, dmsf_file_id, user_id, expire_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: dmsf_workflow_step_actions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_workflow_step_actions (id, dmsf_workflow_step_assignment_id, action, note, created_at, author_id) FROM stdin;
1	10	1	ok por mi	2021-12-20 19:35:09.318306	35
2	11	1		2021-12-20 19:35:32.3646	39
3	12	1	ok por mi	2021-12-20 19:41:23.481798	38
4	13	1	ok por mi	2021-12-20 19:43:05.597938	30
5	18	1	ok por mi	2021-12-23 11:33:12.494034	35
6	19	1	ok por mi\r\n	2021-12-23 11:33:59.378204	39
7	26	1	ok por mi 	2021-12-23 17:23:57.311432	35
8	14	1	ok por mi	2021-12-23 17:41:36.529344	35
9	15	1	ok por mi	2021-12-23 17:53:35.802042	39
10	16	1	ok por mi	2021-12-23 17:55:41.997665	38
11	17	1	ok por mi	2021-12-23 17:57:04.819214	30
\.


--
-- Data for Name: dmsf_workflow_step_assignments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_workflow_step_assignments (id, dmsf_workflow_step_id, user_id, dmsf_file_revision_id) FROM stdin;
10	4	35	62
11	5	39	62
12	6	38	62
13	7	30	62
14	4	35	63
15	5	39	63
16	6	38	63
17	7	30	63
18	4	35	64
19	5	39	64
20	6	38	64
21	7	30	64
22	4	35	65
23	5	39	65
24	6	38	65
25	7	30	65
26	4	35	66
27	5	39	66
28	6	38	66
29	7	30	66
30	4	35	68
31	5	39	68
32	6	38	68
33	7	30	68
34	4	35	70
35	5	39	70
36	6	38	70
37	7	30	70
\.


--
-- Data for Name: dmsf_workflow_steps; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_workflow_steps (id, dmsf_workflow_id, step, user_id, operator, name) FROM stdin;
4	4	1	35	1	Review
5	4	2	39	1	Approve
6	4	3	38	1	Approve
7	4	4	30	1	Approve
8	5	1	48	1	
\.


--
-- Data for Name: dmsf_workflows; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dmsf_workflows (id, name, project_id, status, updated_on, created_on, author_id) FROM stdin;
4	GS	4	1	2021-12-20 18:51:24.662827	2021-12-20 18:51:24.662827	1
5	GS GSE	4	1	2021-12-23 17:28:12.962827	2021-12-23 17:28:12.962827	35
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.documents (id, project_id, category_id, title, description, created_on) FROM stdin;
\.


--
-- Data for Name: easy_entity_assignments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.easy_entity_assignments (id, entity_from_type, entity_from_id, entity_to_type, entity_to_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: easy_settings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.easy_settings (id, type, name, value, project_id) FROM stdin;
\.


--
-- Data for Name: email_addresses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.email_addresses (id, user_id, address, is_default, notify, created_on, updated_on) FROM stdin;
1	1	admin@example.net	t	t	2021-08-25 12:31:47.801628	2021-08-25 12:31:47.801628
24	27	aalvarez@sec.conae.gov.ar	t	t	2021-09-17 20:05:21.456046	2021-09-17 20:05:21.456046
25	28	abarrera@conae.gov.ar	t	t	2021-09-17 20:05:22.054805	2021-09-17 20:05:22.054805
26	29	alcaballero@conae.gov.ar	t	t	2021-09-17 20:05:22.505074	2021-09-17 20:05:22.505074
27	30	anibal.ambrosino@conae.gov.ar	t	t	2021-09-17 20:05:24.830548	2021-09-17 20:05:24.830548
28	31	gestion.sabiamar@ascentio.com.ar	t	t	2021-09-17 20:05:25.323423	2021-09-17 20:05:25.323423
29	32	coviedo@vengsa.com.ar	t	t	2021-09-17 20:05:25.869966	2021-09-17 20:05:25.869966
30	33	csanjuan@vengsa.com.ar	t	t	2021-09-17 20:05:26.353369	2021-09-17 20:05:26.353369
31	34	dfernandez@conae.gov.ar	t	t	2021-09-17 20:05:26.997443	2021-09-17 20:05:26.997443
32	35	dfrias@sec.conae.gov.ar	t	t	2021-09-17 20:05:27.509331	2021-09-17 20:05:27.509331
33	36	egomez@conae.gov.ar	t	t	2021-09-17 20:05:27.98053	2021-09-17 20:05:27.98053
34	37	gbisaccio@conae.gov.ar	t	t	2021-09-17 20:05:28.662368	2021-09-17 20:05:28.662368
35	38	gjgonzalez@conae.gov.ar	t	t	2021-09-17 20:05:30.553827	2021-09-17 20:05:30.553827
36	39	htiraboschi@conae.gov.ar	t	t	2021-09-17 20:05:31.133988	2021-09-17 20:05:31.133988
37	40	afranzetti@invap.com.ar	t	t	2021-09-17 20:05:31.716489	2021-09-17 20:05:31.716489
38	41	jicasais@conae.gov.ar	t	t	2021-09-17 20:05:32.251789	2021-09-17 20:05:32.251789
39	42	jmarin@conae.gov.ar	t	t	2021-09-17 20:05:32.773395	2021-09-17 20:05:32.773395
40	43	lgarategaray@conae.gov.ar	t	t	2021-09-17 20:05:33.204615	2021-09-17 20:05:33.204615
41	44	malvarezbocco@vengsa.com.ar	t	t	2021-09-17 20:05:33.627737	2021-09-17 20:05:33.627737
42	45	manfred.pacher@conae.gov.ar	t	t	2021-09-17 20:05:34.047836	2021-09-17 20:05:34.047836
43	46	mvanrey@vengsa.com.ar	t	t	2021-09-17 20:05:34.474077	2021-09-17 20:05:34.474077
44	47	pfluxa@conae.gov.ar	t	t	2021-09-17 20:05:34.980277	2021-09-17 20:05:34.980277
45	48	nnatali@veng.com.ar	t	t	2021-09-17 20:05:37.447689	2021-09-17 20:05:37.447689
\.


--
-- Data for Name: enabled_modules; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.enabled_modules (id, project_id, name) FROM stdin;
1	1	issue_tracking
2	1	files
3	2	issue_tracking
4	2	dmsf
367	25	dmsf
368	27	dmsf
369	28	dmsf
370	29	dmsf
371	30	dmsf
372	31	dmsf
373	32	dmsf
374	33	dmsf
375	34	dmsf
376	35	dmsf
377	36	dmsf
16	5	issue_tracking
378	37	dmsf
424	57	issue_tracking
425	57	dmsf
394	43	issue_tracking
400	47	issue_tracking
409	4	visual_editor
426	58	issue_tracking
26	6	issue_tracking
427	58	dmsf
428	59	issue_tracking
429	59	dmsf
430	60	issue_tracking
431	60	dmsf
432	61	issue_tracking
433	61	dmsf
434	62	issue_tracking
435	62	dmsf
36	7	issue_tracking
484	86	issue_tracking
485	86	dmsf
486	87	issue_tracking
487	87	dmsf
46	8	issue_tracking
56	9	issue_tracking
66	10	issue_tracking
76	11	issue_tracking
77	11	time_tracking
78	11	news
79	11	documents
80	11	files
81	11	wiki
82	11	repository
83	11	boards
84	11	calendar
85	11	gantt
86	12	issue_tracking
96	13	issue_tracking
106	14	issue_tracking
116	15	issue_tracking
136	17	issue_tracking
146	18	issue_tracking
156	19	issue_tracking
166	20	issue_tracking
436	63	issue_tracking
395	44	issue_tracking
396	44	dmsf
401	48	issue_tracking
176	21	issue_tracking
402	48	repository
404	49	issue_tracking
405	49	dmsf
410	50	issue_tracking
411	50	dmsf
412	51	issue_tracking
413	51	dmsf
414	52	issue_tracking
415	52	dmsf
186	22	issue_tracking
437	63	dmsf
438	64	issue_tracking
439	64	news
440	64	dmsf
441	65	issue_tracking
442	65	dmsf
443	66	issue_tracking
444	66	dmsf
445	67	issue_tracking
196	23	issue_tracking
416	53	issue_tracking
417	53	dmsf
418	54	issue_tracking
419	54	dmsf
446	67	dmsf
447	68	issue_tracking
448	68	dmsf
449	69	issue_tracking
450	69	dmsf
206	24	issue_tracking
451	70	issue_tracking
452	70	dmsf
216	25	issue_tracking
226	26	issue_tracking
236	27	issue_tracking
246	28	issue_tracking
256	29	issue_tracking
266	30	issue_tracking
276	31	issue_tracking
286	32	issue_tracking
296	33	issue_tracking
302	33	repository
306	34	issue_tracking
316	35	issue_tracking
326	36	issue_tracking
336	37	issue_tracking
453	71	issue_tracking
454	71	dmsf
455	72	issue_tracking
456	72	dmsf
457	73	issue_tracking
458	73	dmsf
459	74	issue_tracking
460	74	dmsf
461	75	issue_tracking
462	75	dmsf
463	76	issue_tracking
464	76	dmsf
465	77	issue_tracking
466	77	dmsf
356	4	dmsf
357	10	dmsf
467	78	issue_tracking
359	5	dmsf
360	6	dmsf
361	7	dmsf
362	38	dmsf
468	78	dmsf
364	8	dmsf
365	39	issue_tracking
366	40	issue_tracking
397	45	issue_tracking
398	45	visual_editor
399	46	issue_tracking
403	1	dmsf
406	39	dmsf
420	55	issue_tracking
421	55	dmsf
422	56	issue_tracking
423	56	dmsf
469	79	issue_tracking
470	79	dmsf
471	80	issue_tracking
472	80	dmsf
473	81	issue_tracking
474	81	dmsf
475	82	issue_tracking
476	82	dmsf
477	83	issue_tracking
478	83	dmsf
479	84	issue_tracking
480	84	dmsf
481	85	issue_tracking
482	85	dmsf
483	85	visual_editor
\.


--
-- Data for Name: enumerations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) FROM stdin;
3	Normal	3	f	IssuePriority	t	\N	\N	highest
2	High	2	f	IssuePriority	t	\N	\N	high2
1	Low	1	t	IssuePriority	t	\N	\N	default
\.


--
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.groups_users (group_id, user_id) FROM stdin;
53	27
53	28
53	29
53	30
53	31
53	34
53	35
53	37
53	38
53	39
53	40
53	41
53	42
53	43
53	44
53	46
53	47
53	48
54	27
54	30
55	29
55	38
56	44
50	1
57	43
57	30
58	39
58	48
59	35
60	29
60	38
61	27
61	30
\.


--
-- Data for Name: import_items; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.import_items (id, import_id, "position", obj_id, message, unique_id) FROM stdin;
1	1	1	\N	Nc proveedor cannot be blank	\N
2	1	2	\N	Nc proveedor cannot be blank	\N
3	1	3	\N	Nc proveedor cannot be blank	\N
4	1	4	\N	Nc proveedor cannot be blank	\N
5	1	5	\N	Nc proveedor cannot be blank	\N
6	1	6	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
7	1	7	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
8	1	8	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
9	1	9	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
10	1	10	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
11	1	11	\N	Nc proveedor cannot be blank	\N
12	1	12	\N	Nc proveedor cannot be blank	\N
13	1	13	\N	Nc proveedor cannot be blank	\N
14	1	14	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
15	1	15	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
16	1	16	\N	Nc proveedor cannot be blank	\N
17	1	17	\N	Nc proveedor cannot be blank	\N
18	1	18	\N	Nc proveedor cannot be blank	\N
19	1	19	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
20	1	20	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
21	1	21	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
22	1	22	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date\nDue date is not a valid date	\N
23	1	23	\N	Nc proveedor cannot be blank\nDue date is not a valid date\nDue date must be greater than start date	\N
24	1	24	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
25	1	25	\N	Nc proveedor cannot be blank	\N
26	1	26	\N	Nc proveedor cannot be blank	\N
27	1	27	\N	Nc proveedor cannot be blank	\N
28	1	28	\N	Nc proveedor cannot be blank\nDue date is not a valid date\nDue date must be greater than start date	\N
29	1	29	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
30	1	30	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
31	1	31	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
32	1	32	\N	Nc proveedor cannot be blank	\N
33	1	33	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
34	1	34	\N	Nc proveedor cannot be blank	\N
35	1	35	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
36	1	36	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
37	1	37	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
38	1	38	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
39	1	39	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
40	1	40	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
41	1	41	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
42	1	42	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
43	1	43	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
44	1	44	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
45	1	45	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
46	1	46	\N	Nc proveedor cannot be blank\nDue date is not a valid date	\N
47	1	47	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
48	1	48	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
49	1	49	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
50	1	50	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
51	1	51	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
52	1	52	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
53	1	53	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
54	1	54	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
55	1	55	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
56	1	56	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
57	1	57	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
58	1	58	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
59	1	59	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
60	1	60	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
61	1	61	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
62	1	62	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
63	1	63	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
64	1	64	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
65	1	65	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
66	1	66	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
67	1	67	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
68	1	68	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
69	1	69	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
70	1	70	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
71	1	71	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
72	1	72	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
73	1	73	\N	Nc proveedor cannot be blank\nStart date is not a valid date\nDue date is not a valid date	\N
74	1	74	\N	Nc proveedor cannot be blank	\N
75	1	75	\N	Nc proveedor cannot be blank	\N
76	1	76	\N	Nc proveedor cannot be blank	\N
77	1	77	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
78	1	78	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
201	3	79	79	\N	\N
202	3	80	80	\N	\N
203	3	81	81	\N	\N
79	1	79	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date\nDue date is not a valid date	\N
80	1	80	\N	Nc proveedor cannot be blank\nStart date is not a valid date\nDue date is not a valid date	\N
81	1	81	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
82	1	82	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
83	1	83	\N	Nc proveedor cannot be blank\nDue date is not a valid date	\N
84	1	84	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
85	1	85	\N	Nc proveedor cannot be blank	\N
86	1	86	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
87	1	87	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nDue date is not a valid date	\N
88	1	88	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
89	1	89	\N	Nc proveedor cannot be blank\nDue date is not a valid date	\N
90	1	90	\N	Nc proveedor cannot be blank\nStart date is not a valid date\nDue date is not a valid date	\N
91	1	91	\N	Nc proveedor cannot be blank\nStart date is not a valid date\nDue date is not a valid date	\N
92	1	92	\N	Nc proveedor cannot be blank\nStart date is not a valid date\nDue date must be greater than start date	\N
93	1	93	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
94	1	94	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
95	1	95	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
96	1	96	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
97	1	97	\N	Nc proveedor cannot be blank	\N
98	1	98	\N	Nc proveedor cannot be blank	\N
99	1	99	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
100	1	100	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
101	1	101	\N	Nc proveedor cannot be blank	\N
102	1	102	\N	Nc proveedor cannot be blank	\N
103	1	103	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
104	1	104	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
105	1	105	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
106	1	106	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
107	1	107	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
108	1	108	\N	Nc proveedor cannot be blank	\N
109	1	109	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
110	1	110	\N	Nc proveedor cannot be blank	\N
111	1	111	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
112	1	112	\N	Nc proveedor cannot be blank	\N
113	1	113	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
114	1	114	\N	Nc proveedor cannot be blank	\N
115	1	115	\N	Nc proveedor cannot be blank	\N
116	1	116	\N	Nc proveedor cannot be blank	\N
117	1	117	\N	Nc proveedor cannot be blank	\N
118	1	118	\N	Nc proveedor cannot be blank\nEvent date is not a valid date	\N
119	1	119	\N	Nc proveedor cannot be blank\nEvent date is not a valid date\nStart date is not a valid date	\N
120	1	120	\N	Nc proveedor cannot be blank\nStart date is not a valid date\nDue date is not a valid date	\N
121	1	121	\N	Nc proveedor cannot be blank\nStart date is not a valid date	\N
122	1	122	\N	Nc proveedor cannot be blank\nStart date is not a valid date\nDue date is not a valid date	\N
123	3	1	1	\N	\N
124	3	2	2	\N	\N
125	3	3	3	\N	\N
126	3	4	4	\N	\N
127	3	5	5	\N	\N
128	3	6	6	\N	\N
129	3	7	7	\N	\N
130	3	8	8	\N	\N
131	3	9	9	\N	\N
132	3	10	10	\N	\N
133	3	11	11	\N	\N
134	3	12	12	\N	\N
135	3	13	13	\N	\N
136	3	14	14	\N	\N
137	3	15	15	\N	\N
138	3	16	16	\N	\N
139	3	17	17	\N	\N
140	3	18	18	\N	\N
141	3	19	19	\N	\N
142	3	20	20	\N	\N
143	3	21	21	\N	\N
144	3	22	22	\N	\N
145	3	23	23	\N	\N
146	3	24	24	\N	\N
147	3	25	25	\N	\N
148	3	26	26	\N	\N
149	3	27	27	\N	\N
150	3	28	28	\N	\N
151	3	29	29	\N	\N
152	3	30	30	\N	\N
153	3	31	31	\N	\N
154	3	32	32	\N	\N
155	3	33	33	\N	\N
156	3	34	34	\N	\N
157	3	35	35	\N	\N
158	3	36	36	\N	\N
159	3	37	37	\N	\N
160	3	38	38	\N	\N
161	3	39	39	\N	\N
162	3	40	40	\N	\N
163	3	41	41	\N	\N
164	3	42	42	\N	\N
165	3	43	43	\N	\N
166	3	44	44	\N	\N
167	3	45	45	\N	\N
168	3	46	46	\N	\N
169	3	47	47	\N	\N
170	3	48	48	\N	\N
171	3	49	49	\N	\N
172	3	50	50	\N	\N
173	3	51	51	\N	\N
174	3	52	52	\N	\N
175	3	53	53	\N	\N
176	3	54	54	\N	\N
177	3	55	55	\N	\N
178	3	56	56	\N	\N
179	3	57	57	\N	\N
180	3	58	58	\N	\N
181	3	59	59	\N	\N
182	3	60	60	\N	\N
183	3	61	61	\N	\N
184	3	62	62	\N	\N
185	3	63	63	\N	\N
186	3	64	64	\N	\N
187	3	65	65	\N	\N
188	3	66	66	\N	\N
189	3	67	67	\N	\N
190	3	68	68	\N	\N
191	3	69	69	\N	\N
192	3	70	70	\N	\N
193	3	71	71	\N	\N
194	3	72	72	\N	\N
195	3	73	73	\N	\N
196	3	74	74	\N	\N
197	3	75	75	\N	\N
198	3	76	76	\N	\N
199	3	77	77	\N	\N
200	3	78	78	\N	\N
204	3	82	82	\N	\N
205	3	83	83	\N	\N
206	3	84	84	\N	\N
207	3	85	85	\N	\N
208	3	86	86	\N	\N
209	3	87	87	\N	\N
210	3	88	88	\N	\N
211	3	89	89	\N	\N
212	3	90	90	\N	\N
213	3	91	91	\N	\N
214	3	92	92	\N	\N
215	3	93	93	\N	\N
216	3	94	94	\N	\N
217	3	95	95	\N	\N
218	3	96	96	\N	\N
219	3	97	97	\N	\N
220	3	98	98	\N	\N
221	3	99	99	\N	\N
222	3	100	100	\N	\N
223	3	101	101	\N	\N
224	3	102	102	\N	\N
225	3	103	103	\N	\N
226	3	104	104	\N	\N
227	3	105	105	\N	\N
228	3	106	106	\N	\N
229	3	107	107	\N	\N
230	3	108	108	\N	\N
231	3	109	109	\N	\N
232	3	110	110	\N	\N
233	3	111	111	\N	\N
234	3	112	112	\N	\N
235	3	113	113	\N	\N
236	3	114	114	\N	\N
237	3	115	115	\N	\N
238	3	116	116	\N	\N
239	3	117	117	\N	\N
240	3	118	118	\N	\N
241	3	119	119	\N	\N
242	3	120	120	\N	\N
243	3	121	121	\N	\N
244	3	122	122	\N	\N
245	7	1	123	\N	\N
246	7	2	124	\N	\N
247	7	3	125	\N	\N
248	7	4	126	\N	\N
249	7	5	127	\N	\N
250	7	6	128	\N	\N
251	7	7	129	\N	\N
252	7	8	130	\N	\N
253	7	9	131	\N	\N
254	7	10	132	\N	\N
255	7	11	133	\N	\N
256	7	12	134	\N	\N
257	7	13	135	\N	\N
258	7	14	136	\N	\N
259	7	15	137	\N	\N
260	7	16	138	\N	\N
261	7	17	139	\N	\N
262	7	18	140	\N	\N
263	7	19	141	\N	\N
264	7	20	142	\N	\N
265	7	21	143	\N	\N
266	7	22	144	\N	\N
267	7	23	145	\N	\N
268	7	24	146	\N	\N
269	7	25	147	\N	\N
270	7	26	148	\N	\N
271	7	27	149	\N	\N
272	7	28	150	\N	\N
273	7	29	151	\N	\N
274	7	30	152	\N	\N
275	7	31	153	\N	\N
276	7	32	154	\N	\N
277	7	33	155	\N	\N
278	7	34	156	\N	\N
279	7	35	157	\N	\N
280	7	36	158	\N	\N
281	7	37	159	\N	\N
282	7	38	160	\N	\N
283	7	39	161	\N	\N
284	7	40	162	\N	\N
285	7	41	163	\N	\N
286	7	42	164	\N	\N
287	7	43	165	\N	\N
288	7	44	166	\N	\N
289	7	45	167	\N	\N
290	7	46	168	\N	\N
291	7	47	169	\N	\N
292	7	48	170	\N	\N
293	7	49	171	\N	\N
294	7	50	172	\N	\N
295	7	51	173	\N	\N
296	7	52	174	\N	\N
297	7	53	175	\N	\N
298	7	54	176	\N	\N
299	7	55	177	\N	\N
300	7	56	178	\N	\N
301	7	57	179	\N	\N
302	7	58	180	\N	\N
303	7	59	181	\N	\N
304	7	60	182	\N	\N
305	7	61	183	\N	\N
306	7	62	184	\N	\N
307	7	63	185	\N	\N
308	7	64	186	\N	\N
309	7	65	187	\N	\N
310	7	66	188	\N	\N
311	7	67	189	\N	\N
312	7	68	190	\N	\N
313	7	69	191	\N	\N
314	7	70	192	\N	\N
315	7	71	193	\N	\N
316	7	72	194	\N	\N
317	7	73	195	\N	\N
318	7	74	196	\N	\N
319	7	75	197	\N	\N
320	7	76	198	\N	\N
321	7	77	199	\N	\N
322	7	78	200	\N	\N
323	7	79	201	\N	\N
324	7	80	202	\N	\N
325	7	81	203	\N	\N
326	7	82	204	\N	\N
327	7	83	205	\N	\N
328	7	84	206	\N	\N
329	7	85	207	\N	\N
330	7	86	208	\N	\N
331	7	87	209	\N	\N
332	7	88	210	\N	\N
333	7	89	211	\N	\N
334	7	90	212	\N	\N
335	7	91	213	\N	\N
336	8	1	214	\N	\N
337	8	2	215	\N	\N
338	8	3	216	\N	\N
339	8	4	217	\N	\N
340	8	5	218	\N	\N
341	8	6	219	\N	\N
342	8	7	220	\N	\N
343	8	8	221	\N	\N
344	8	9	222	\N	\N
345	8	10	223	\N	\N
346	8	11	224	\N	\N
347	8	12	225	\N	\N
348	8	13	226	\N	\N
349	8	14	227	\N	\N
350	8	15	228	\N	\N
351	8	16	229	\N	\N
352	8	17	230	\N	\N
353	8	18	231	\N	\N
354	8	19	232	\N	\N
355	8	20	233	\N	\N
356	8	21	234	\N	\N
357	8	22	235	\N	\N
358	8	23	236	\N	\N
359	8	24	237	\N	\N
360	8	25	238	\N	\N
361	8	26	239	\N	\N
362	8	27	240	\N	\N
363	8	28	241	\N	\N
364	8	29	242	\N	\N
365	8	30	243	\N	\N
366	8	31	244	\N	\N
367	8	32	245	\N	\N
368	8	33	246	\N	\N
369	8	34	247	\N	\N
370	8	35	248	\N	\N
371	8	36	249	\N	\N
372	8	37	250	\N	\N
373	8	38	251	\N	\N
374	8	39	252	\N	\N
375	8	40	253	\N	\N
376	8	41	254	\N	\N
377	8	42	255	\N	\N
378	8	43	256	\N	\N
379	8	44	257	\N	\N
380	8	45	258	\N	\N
381	8	46	259	\N	\N
382	8	47	260	\N	\N
383	8	48	261	\N	\N
384	8	49	262	\N	\N
385	8	50	263	\N	\N
386	8	51	264	\N	\N
387	8	52	265	\N	\N
388	8	53	266	\N	\N
389	8	54	267	\N	\N
390	8	55	268	\N	\N
391	8	56	269	\N	\N
392	8	57	270	\N	\N
393	8	58	271	\N	\N
394	8	59	272	\N	\N
395	8	60	273	\N	\N
396	8	61	274	\N	\N
397	8	62	275	\N	\N
398	8	63	276	\N	\N
399	8	64	277	\N	\N
400	8	65	278	\N	\N
401	8	66	279	\N	\N
402	8	67	280	\N	\N
403	8	68	281	\N	\N
404	8	69	282	\N	\N
405	8	70	283	\N	\N
406	8	71	284	\N	\N
407	8	72	285	\N	\N
408	8	73	286	\N	\N
409	8	74	287	\N	\N
410	8	75	288	\N	\N
411	8	76	289	\N	\N
412	8	77	290	\N	\N
413	8	78	291	\N	\N
414	8	79	292	\N	\N
415	8	80	293	\N	\N
416	8	81	294	\N	\N
417	8	82	295	\N	\N
418	8	83	296	\N	\N
419	8	84	297	\N	\N
420	8	85	298	\N	\N
421	8	86	299	\N	\N
422	8	87	300	\N	\N
423	8	88	301	\N	\N
424	8	89	302	\N	\N
425	8	90	303	\N	\N
426	8	91	304	\N	\N
427	8	92	305	\N	\N
428	8	93	306	\N	\N
429	8	94	307	\N	\N
430	8	95	308	\N	\N
431	8	96	309	\N	\N
432	8	97	310	\N	\N
433	8	98	311	\N	\N
434	8	99	312	\N	\N
435	8	100	313	\N	\N
436	8	101	314	\N	\N
437	8	102	315	\N	\N
438	8	103	316	\N	\N
439	8	104	317	\N	\N
440	8	105	318	\N	\N
441	8	106	319	\N	\N
442	8	107	320	\N	\N
443	8	108	321	\N	\N
444	8	109	322	\N	\N
445	8	110	323	\N	\N
446	8	111	324	\N	\N
447	8	112	325	\N	\N
448	8	113	326	\N	\N
449	8	114	327	\N	\N
450	8	115	328	\N	\N
451	8	116	329	\N	\N
452	8	117	330	\N	\N
453	8	118	331	\N	\N
454	8	119	332	\N	\N
455	8	120	333	\N	\N
456	8	121	334	\N	\N
457	8	122	335	\N	\N
458	9	1	336	\N	\N
459	9	2	337	\N	\N
460	9	3	338	\N	\N
461	9	4	339	\N	\N
462	9	5	340	\N	\N
463	9	6	341	\N	\N
464	9	7	342	\N	\N
465	9	8	343	\N	\N
466	9	9	344	\N	\N
467	9	10	345	\N	\N
468	9	11	346	\N	\N
469	9	12	347	\N	\N
470	9	13	348	\N	\N
471	9	14	349	\N	\N
472	9	15	350	\N	\N
473	9	16	351	\N	\N
474	9	17	352	\N	\N
475	9	18	353	\N	\N
476	9	19	354	\N	\N
477	9	20	355	\N	\N
478	9	21	356	\N	\N
479	9	22	357	\N	\N
480	9	23	358	\N	\N
481	9	24	359	\N	\N
482	9	25	360	\N	\N
483	9	26	361	\N	\N
484	9	27	362	\N	\N
485	9	28	363	\N	\N
486	9	29	364	\N	\N
487	9	30	365	\N	\N
488	9	31	366	\N	\N
489	9	32	367	\N	\N
490	9	33	368	\N	\N
491	9	34	369	\N	\N
492	9	35	370	\N	\N
493	9	36	371	\N	\N
494	9	37	372	\N	\N
495	9	38	373	\N	\N
496	9	39	374	\N	\N
497	9	40	375	\N	\N
498	9	41	376	\N	\N
499	9	42	377	\N	\N
500	9	43	378	\N	\N
501	9	44	379	\N	\N
502	9	45	380	\N	\N
503	9	46	381	\N	\N
504	9	47	382	\N	\N
505	9	48	383	\N	\N
506	9	49	384	\N	\N
507	9	50	385	\N	\N
508	9	51	386	\N	\N
509	9	52	387	\N	\N
510	9	53	388	\N	\N
511	9	54	389	\N	\N
512	9	55	390	\N	\N
513	9	56	391	\N	\N
514	9	57	392	\N	\N
515	9	58	393	\N	\N
516	9	59	394	\N	\N
517	9	60	395	\N	\N
518	9	61	396	\N	\N
519	9	62	397	\N	\N
520	9	63	398	\N	\N
521	9	64	399	\N	\N
522	9	65	400	\N	\N
523	9	66	401	\N	\N
524	9	67	402	\N	\N
525	9	68	403	\N	\N
526	9	69	404	\N	\N
527	9	70	405	\N	\N
528	9	71	406	\N	\N
529	9	72	407	\N	\N
530	9	73	408	\N	\N
531	9	74	409	\N	\N
532	9	75	410	\N	\N
533	9	76	411	\N	\N
534	9	77	412	\N	\N
535	9	78	413	\N	\N
536	9	79	414	\N	\N
537	9	80	415	\N	\N
538	9	81	416	\N	\N
539	9	82	417	\N	\N
540	9	83	418	\N	\N
541	9	84	419	\N	\N
542	9	85	420	\N	\N
543	9	86	421	\N	\N
544	9	87	422	\N	\N
545	9	88	423	\N	\N
546	9	89	424	\N	\N
547	9	90	425	\N	\N
548	9	91	426	\N	\N
549	9	92	427	\N	\N
550	9	93	428	\N	\N
551	9	94	429	\N	\N
552	9	95	430	\N	\N
553	9	96	431	\N	\N
554	9	97	432	\N	\N
555	9	98	433	\N	\N
556	9	99	434	\N	\N
557	9	100	435	\N	\N
558	9	101	436	\N	\N
559	9	102	437	\N	\N
560	9	103	438	\N	\N
561	9	104	439	\N	\N
562	9	105	440	\N	\N
563	9	106	441	\N	\N
564	9	107	442	\N	\N
565	9	108	443	\N	\N
566	9	109	444	\N	\N
567	9	110	445	\N	\N
568	9	111	446	\N	\N
569	9	112	447	\N	\N
570	9	113	448	\N	\N
571	9	114	449	\N	\N
572	9	115	450	\N	\N
573	9	116	451	\N	\N
574	9	117	452	\N	\N
575	9	118	453	\N	\N
576	9	119	454	\N	\N
577	9	120	455	\N	\N
578	9	121	456	\N	\N
579	9	122	457	\N	\N
580	10	1	\N	Tracker cannot be blank\nStatus cannot be blank	\N
581	10	2	\N	Tracker cannot be blank\nStatus cannot be blank	\N
582	10	3	\N	Tracker cannot be blank\nStatus cannot be blank	\N
583	13	1	\N	Tracker cannot be blank	\N
584	13	2	\N	Tracker cannot be blank	\N
585	13	3	\N	Tracker cannot be blank	\N
586	14	1	485	\N	\N
587	14	2	486	\N	\N
588	14	3	487	\N	\N
589	15	1	488	\N	\N
590	15	2	489	\N	\N
591	15	3	490	\N	\N
592	15	4	491	\N	\N
593	15	5	492	\N	\N
594	15	6	493	\N	\N
595	15	7	494	\N	\N
596	15	8	495	\N	\N
597	15	9	496	\N	\N
598	15	10	497	\N	\N
599	15	11	498	\N	\N
600	15	12	499	\N	\N
601	15	13	500	\N	\N
602	15	14	501	\N	\N
603	15	15	502	\N	\N
604	15	16	503	\N	\N
605	15	17	504	\N	\N
606	15	18	505	\N	\N
607	18	1	506	\N	\N
608	18	2	507	\N	\N
609	18	3	508	\N	\N
610	19	1	509	\N	\N
611	19	2	510	\N	\N
612	19	3	511	\N	\N
613	19	4	512	\N	\N
614	19	5	513	\N	\N
615	19	6	514	\N	\N
616	19	7	515	\N	\N
617	19	8	516	\N	\N
618	19	9	517	\N	\N
619	19	10	518	\N	\N
620	19	11	519	\N	\N
621	19	12	520	\N	\N
622	19	13	521	\N	\N
623	19	14	522	\N	\N
624	19	15	523	\N	\N
625	19	16	524	\N	\N
626	19	17	525	\N	\N
627	19	18	526	\N	\N
628	21	1	\N	Tracker cannot be blank	\N
629	21	2	\N	Tracker cannot be blank	\N
630	21	3	\N	Tracker cannot be blank	\N
631	21	4	\N	Tracker cannot be blank	\N
632	21	5	\N	Tracker cannot be blank	\N
633	21	6	\N	Tracker cannot be blank	\N
634	21	7	\N	Tracker cannot be blank	\N
635	21	8	\N	Tracker cannot be blank	\N
636	23	1	528	\N	\N
637	23	2	529	\N	\N
638	23	3	530	\N	\N
639	23	4	531	\N	\N
640	23	5	532	\N	\N
641	23	6	533	\N	\N
642	23	7	534	\N	\N
643	23	8	535	\N	\N
\.


--
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.imports (id, type, user_id, filename, settings, total_items, finished, created_at, updated_at) FROM stdin;
1	IssueImport	1	07348216e1f3639d27127adff66ab838	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '2'\n  tracker: value:1\n  status: '4'\n  subject: '6'\n  description: '60'\n  priority: '5'\n  category: '10'\n  assigned_to: '8'\n  fixed_version: ''\n  is_private: '59'\n  start_date: '11'\n  due_date: '12'\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '21'\n  cf_2: '22'\n  cf_3: '23'\n  cf_4: '37'\n  cf_5: '38'\n  cf_6: '20'\n  cf_8: ''\n  cf_9: '41'\n  cf_10: '42'\n  cf_12: '44'\n  cf_13: '45'\n  cf_14: '46'\n  cf_15: '47'\n  cf_16: '48'\n  cf_17: '49'\n  cf_18: '50'\n  cf_19: '51'\n  cf_20: '52'\n  cf_21: '53'\n  cf_22: '54'\n  cf_23: '55'\n  cf_24: '56'\n  cf_25: '57'\n  cf_26: '25'\n  unique_id: ''\n  parent_issue_id: '3'\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	122	t	2021-09-03 15:19:17.24809	2021-09-03 15:20:30.139475
18	IssueImport	1	a7948c025aabf7f1d15527f105c43cf3	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '49'\n  tracker: value:22\n  status: '6'\n  subject: '0'\n  description: ''\n  priority: ''\n  category: ''\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '1'\n  cf_37: '0'\n  cf_35: '5'\n  cf_164: '2'\n  cf_165: '3'\n  cf_166: '4'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	3	t	2021-12-09 15:30:28.648136	2021-12-09 17:10:20.13388
4	IssueImport	1	8a29677e1ee24aa063da791c3758d697	---\nseparator: ","\nwrapper: "\\""\nencoding: UTF-8\ndate_format: "%d/%m/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '2'\n  tracker: '2'\n  status: '4'\n  subject: '6'\n  description: '60'\n  priority: '5'\n  category: '10'\n  assigned_to: '8'\n  fixed_version: ''\n  is_private: '59'\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	91	f	2021-09-13 19:48:40.182305	2021-09-13 19:49:04.728378
2	IssueImport	1	ba0f3680a1c8d20b198a42f31104b246	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%d/%m/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '2'\n  tracker: value:1\n  status: '4'\n  subject: '6'\n  description: '60'\n  priority: '5'\n  category: '10'\n  assigned_to: '8'\n  fixed_version: ''\n  is_private: '59'\n  start_date: '11'\n  due_date: '12'\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: ''\n  cf_2: ''\n  cf_3: ''\n  cf_4: ''\n  cf_5: ''\n  cf_6: ''\n  cf_8: ''\n  cf_9: ''\n  cf_10: ''\n  cf_12: ''\n  cf_13: ''\n  cf_14: ''\n  cf_15: ''\n  cf_16: ''\n  cf_17: ''\n  cf_18: ''\n  cf_19: ''\n  cf_20: ''\n  cf_21: ''\n  cf_22: ''\n  cf_23: ''\n  cf_24: ''\n  cf_25: ''\n  cf_26: ''\n  unique_id: ''\n  parent_issue_id: '3'\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	122	f	2021-09-03 15:38:52.713883	2021-09-03 15:39:22.29302
6	IssueImport	1	caf36dd6a1d6d86dc74bc3137b27f919	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%d/%m/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '2'\n  tracker: value:1\n  status: '4'\n  subject: '6'\n  description: '60'\n  priority: '5'\n  category: '10'\n  assigned_to: '8'\n  fixed_version: ''\n  is_private: '59'\n  start_date: '11'\n  due_date: '12'\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '21'\n  cf_2: '22'\n  cf_3: '23'\n  cf_4: '37'\n  cf_5: '38'\n  cf_6: '20'\n  cf_8: ''\n  cf_9: '41'\n  cf_10: '42'\n  cf_12: '44'\n  cf_13: '45'\n  cf_14: '46'\n  cf_15: '47'\n  cf_16: '48'\n  cf_17: '49'\n  cf_18: '50'\n  cf_19: '51'\n  cf_20: '52'\n  cf_21: '53'\n  cf_22: '54'\n  cf_23: '55'\n  cf_24: '56'\n  cf_25: '57'\n  cf_26: '25'\n  unique_id: ''\n  parent_issue_id: '3'\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	122	f	2021-09-13 19:53:45.114591	2021-09-13 19:53:58.879791
3	IssueImport	1	8bd6cae33b58b680e00e97ce85aad493	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%d/%m/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '2'\n  tracker: value:1\n  status: '4'\n  subject: '6'\n  description: '60'\n  priority: '5'\n  category: '10'\n  assigned_to: '8'\n  fixed_version: ''\n  is_private: '59'\n  start_date: '11'\n  due_date: '12'\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '21'\n  cf_2: '22'\n  cf_3: '23'\n  cf_4: '37'\n  cf_5: '38'\n  cf_6: '20'\n  cf_8: ''\n  cf_9: '41'\n  cf_10: '42'\n  cf_12: '44'\n  cf_13: '45'\n  cf_14: '46'\n  cf_15: '47'\n  cf_16: '48'\n  cf_17: '49'\n  cf_18: '50'\n  cf_19: '51'\n  cf_20: '52'\n  cf_21: '53'\n  cf_22: '54'\n  cf_23: '55'\n  cf_24: '56'\n  cf_25: '57'\n  cf_26: '25'\n  unique_id: ''\n  parent_issue_id: '3'\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	122	t	2021-09-03 15:39:47.664244	2021-09-03 15:40:47.358718
5	IssueImport	1	2f90b41e65c86c33d7a4c4a45dbafaf9	---\nseparator: ","\nwrapper: "\\""\nencoding: UTF-8\ndate_format: "%d/%m/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '2'\n  tracker: value:1\n  status: '4'\n  subject: '6'\n  description: '60'\n  priority: '5'\n  category: '10'\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: ''\n  cf_2: ''\n  cf_3: ''\n  cf_4: ''\n  cf_5: ''\n  cf_6: ''\n  cf_8: ''\n  cf_9: ''\n  cf_10: ''\n  cf_12: ''\n  cf_13: ''\n  cf_14: ''\n  cf_15: ''\n  cf_16: ''\n  cf_17: ''\n  cf_18: ''\n  cf_19: ''\n  cf_20: ''\n  cf_21: ''\n  cf_22: ''\n  cf_23: ''\n  cf_24: ''\n  cf_25: ''\n  cf_26: ''\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	91	f	2021-09-13 19:51:53.691392	2021-09-13 19:52:29.31143
7	IssueImport	1	cd4f6ced56f16ca3d4032af32844bb93	---\nseparator: ","\nwrapper: "\\""\nencoding: UTF-8\ndate_format: "%d/%m/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '2'\n  tracker: value:1\n  status: '4'\n  subject: '6'\n  description: '60'\n  priority: '5'\n  category: '10'\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '21'\n  cf_2: '22'\n  cf_3: '23'\n  cf_4: '37'\n  cf_5: '38'\n  cf_6: '20'\n  cf_8: ''\n  cf_9: '41'\n  cf_10: '42'\n  cf_12: '44'\n  cf_13: '45'\n  cf_14: '46'\n  cf_15: '47'\n  cf_16: '48'\n  cf_17: '49'\n  cf_18: '50'\n  cf_19: '51'\n  cf_20: '52'\n  cf_21: '53'\n  cf_22: '54'\n  cf_23: '55'\n  cf_24: '56'\n  cf_25: '57'\n  cf_26: '25'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	91	t	2021-09-13 19:55:08.242422	2021-09-13 19:56:31.520739
11	IssueImport	1	d76bc2414def9ee4d0c42f5c3b222a6f	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '49'\n  tracker: '0'\n  status: ''\n  subject: ''\n  description: ''\n  priority: ''\n  category: ''\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: ''\n  cf_37: ''\n  cf_35: ''\n  cf_164: ''\n  cf_165: ''\n  cf_166: ''\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	3	f	2021-12-09 13:16:33.282595	2021-12-09 13:18:09.564768
10	IssueImport	1	f961930b80f70c9142623a0a33885f20	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '49'\n  tracker: '0'\n  status: ''\n  subject: '1'\n  description: ''\n  priority: ''\n  category: ''\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '1'\n  cf_37: '0'\n  cf_35: '5'\n  cf_164: '2'\n  cf_165: '3'\n  cf_166: '4'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	3	t	2021-12-09 13:07:37.814929	2021-12-09 13:08:46.627786
8	IssueImport	1	2ce03c897f52140474d0a866e6b8ab28	---\nseparator: ","\nwrapper: "\\""\nencoding: UTF-8\ndate_format: "%d/%m/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '2'\n  tracker: value:1\n  status: '4'\n  subject: '6'\n  description: '60'\n  priority: '5'\n  category: '10'\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '21'\n  cf_2: '22'\n  cf_3: '23'\n  cf_4: '37'\n  cf_5: '38'\n  cf_6: '20'\n  cf_8: ''\n  cf_9: '41'\n  cf_10: '42'\n  cf_12: '44'\n  cf_13: '45'\n  cf_14: '46'\n  cf_15: '47'\n  cf_16: '48'\n  cf_17: '49'\n  cf_18: '50'\n  cf_19: '51'\n  cf_20: '52'\n  cf_21: '53'\n  cf_22: '54'\n  cf_23: '55'\n  cf_24: '56'\n  cf_25: '57'\n  cf_26: '25'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	122	t	2021-09-13 19:59:59.415659	2021-09-13 20:01:06.170989
13	IssueImport	1	e95ff910bab741e8f6c6896da7714375	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '49'\n  tracker: '0'\n  status: '6'\n  subject: '1'\n  description: ''\n  priority: ''\n  category: ''\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '1'\n  cf_37: '0'\n  cf_35: '5'\n  cf_164: '2'\n  cf_165: '3'\n  cf_166: '4'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	3	t	2021-12-09 13:37:46.134496	2021-12-09 13:38:17.312761
9	IssueImport	1	589e81ecc9f510ab1bfb1d84e7c2a3de	---\nseparator: ","\nwrapper: "\\""\nencoding: UTF-8\ndate_format: "%d/%m/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '2'\n  tracker: value:1\n  status: '4'\n  subject: '6'\n  description: '60'\n  priority: '5'\n  category: '10'\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '21'\n  cf_2: '22'\n  cf_3: '23'\n  cf_4: '37'\n  cf_5: '38'\n  cf_6: '20'\n  cf_8: ''\n  cf_9: '41'\n  cf_10: '42'\n  cf_12: '44'\n  cf_13: '45'\n  cf_14: '46'\n  cf_15: '47'\n  cf_16: '48'\n  cf_17: '49'\n  cf_18: '50'\n  cf_19: '51'\n  cf_20: '52'\n  cf_21: '53'\n  cf_22: '54'\n  cf_23: '55'\n  cf_24: '56'\n  cf_25: '57'\n  cf_26: '25'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	122	t	2021-09-13 20:05:29.269597	2021-09-13 20:06:32.391281
12	IssueImport	1	b3bd75877a5b45d7678404403557ff72	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '49'\n  tracker: '0'\n  status: ''\n  subject: ''\n  description: ''\n  priority: ''\n  category: ''\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '1'\n  cf_37: ''\n  cf_35: '5'\n  cf_164: '2'\n  cf_165: '3'\n  cf_166: '4'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	3	f	2021-12-09 13:21:47.523728	2021-12-09 13:21:55.56345
14	IssueImport	1	2cbc2f8f22b29ea6e2e6c1ba91a64687	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '49'\n  tracker: value:22\n  status: '6'\n  subject: '1'\n  description: ''\n  priority: ''\n  category: ''\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '1'\n  cf_37: ''\n  cf_164: '2'\n  cf_165: '3'\n  cf_166: '4'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	3	t	2021-12-09 13:42:32.937228	2021-12-09 13:42:58.52599
17	IssueImport	1	fa55f32f000521cc8a2f4c8aa8125454	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '39'\n  tracker: '1'\n  status: '7'\n  subject: ''\n  description: ''\n  priority: ''\n  category: ''\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_31: ''\n  cf_33: ''\n  cf_37: ''\n  cf_35: ''\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	18	f	2021-12-09 14:59:33.819948	2021-12-09 15:32:06.951105
15	IssueImport	1	26ef1e7099436e3db1fa0b1aba2704c9	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '49'\n  tracker: value:22\n  status: '7'\n  subject: '2'\n  description: ''\n  priority: ''\n  category: ''\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '2'\n  cf_37: '1'\n  cf_164: '3'\n  cf_165: '4'\n  cf_166: '5'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	18	t	2021-12-09 13:52:41.955075	2021-12-09 13:53:16.4428
16	IssueImport	1	fc45113dc279a742ec519490d371adb3	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping:\n  project_id: 49\n	18	f	2021-12-09 14:56:46.986832	2021-12-09 14:56:49.267759
23	IssueImport	1	0803f69c78ae0feb984ef085e817c2d7	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '63'\n  tracker: value:22\n  status: '6'\n  subject: '0'\n  description: '1'\n  priority: ''\n  category: ''\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_164: '2'\n  cf_165: '3'\n  cf_166: '4'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	8	t	2021-12-16 12:28:04.000441	2021-12-16 12:28:33.353888
21	IssueImport	1	77986718f4f76f05e8abbff24c416ed2	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '63'\n  tracker: '0'\n  status: '6'\n  subject: '0'\n  description: '1'\n  priority: ''\n  category: ''\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_164: '2'\n  cf_165: '3'\n  cf_166: '4'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	8	t	2021-12-16 12:25:10.787312	2021-12-16 12:25:59.946456
19	IssueImport	1	17f7a31402ab8956e7af9917db710a24	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  project_id: '49'\n  tracker: value:22\n  status: '7'\n  subject: '1'\n  description: ''\n  priority: ''\n  category: ''\n  assigned_to: ''\n  fixed_version: ''\n  is_private: ''\n  start_date: ''\n  due_date: ''\n  estimated_hours: ''\n  done_ratio: ''\n  cf_1: '2'\n  cf_37: '1'\n  cf_35: '6'\n  cf_164: '3'\n  cf_165: '4'\n  cf_166: '5'\n  unique_id: ''\n  parent_issue_id: ''\n  relation_duplicates: ''\n  relation_duplicated: ''\n  relation_blocks: ''\n  relation_blocked: ''\n  relation_relates: ''\n  relation_precedes: ''\n  relation_follows: ''\n  relation_copied_to: ''\n  relation_copied_from: ''\n	18	t	2021-12-09 17:11:16.431993	2021-12-09 17:11:51.645029
20	IssueImport	1	49373b42e6085e24005e43d980d501eb	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\nmapping:\n  project_id: 49\n	3	f	2021-12-10 13:06:28.892792	2021-12-10 13:06:38.543253
22	IssueImport	1	350e8d9b7e0de8a79880880dbae1d11a	---\nseparator: ","\nwrapper: "\\""\nencoding: ISO-8859-1\ndate_format: "%m/%d/%Y"\nnotifications: '0'\n	8	f	2021-12-16 12:26:27.322571	2021-12-16 12:26:29.769385
\.


--
-- Data for Name: issue_categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.issue_categories (id, project_id, name, assigned_to_id) FROM stdin;
1	48	SABIA.FS.PFM	\N
2	48	SABIA.FS.PFM.SM	\N
3	48	SABIA.FS.PFM.SM.S&M	\N
\.


--
-- Data for Name: issue_relations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.issue_relations (id, issue_from_id, issue_to_id, relation_type, delay) FROM stdin;
7	469	470	copied_to	\N
8	479	480	copied_to	\N
9	457	513	relates	\N
10	451	513	relates	\N
\.


--
-- Data for Name: issue_statuses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.issue_statuses (id, name, is_closed, "position", default_done_ratio) FROM stdin;
1	Draft	f	1	\N
20	Analysis	f	18	\N
33	PM approve	f	31	\N
4	Closed	t	30	\N
5	Dismissed	t	29	\N
15	Rejected	t	28	\N
27	Verification CCM	f	22	\N
28	Accepted	f	23	\N
29	Pending	f	24	\N
22	Revised	t	19	\N
23	Implementation	f	20	\N
24	Disposition	f	21	\N
30	Release	f	27	\N
31	GIPE review	f	25	\N
32	MAM approve	f	26	\N
13	Partial Compliance	t	12	\N
14	Linked	t	13	\N
17	Under Review	f	15	\N
18	Evaluated	f	16	\N
19	Retired	f	17	\N
16	Executed / Impacted	f	14	\N
12	Not Compliance	t	7	\N
11	Submitted	f	5	\N
7	Compliance OK	t	6	\N
26	Review	f	8	\N
8	Approved	t	9	\N
3	In Progress	f	10	\N
9	Proposed	f	11	\N
34	Retained	f	32	\N
6	New	f	2	\N
2	Open	f	3	\N
10	Created	f	4	\N
\.


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on, project_key, issue_number) FROM stdin;
437	1	2	SBM-NCR-00000	Se reciben componentes (anteriormente comprados y almacenados por STI) para el poblado de la placa EGSE_LA2_CM_0001 y se detecta que para los controladores U1 y U2, el footprint del PCB es mayor al del encapsulado.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:27.073815	2021-09-27 18:48:29.235131	\N	0	\N	\N	437	1	2	f	\N	\N	\N
336	1	2	SBM-NCR-00000	Placa AVAB: durante la integración de los diodos del Bottom, se detecta que la separación entre las columnas es muy escasa y se corre el riego de tocar la soldadura del diodo del lado y se genere un pico, o soldadura fría, y el re trabajarlo es difícil cuando ya están los dos soldados.\r\nPlaca TCB: se detecta que la separación entre resistores es muy escasa y se corre el riego de tocar la soldadura del diodo del lado y se genere un pico, o soldadura fría, y el re trabajarlo es difícil cuando ya están los dos soldados.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:05:59.878567	2021-09-27 18:49:01.453021	\N	0	\N	\N	336	1	2	f	\N	\N	\N
337	1	2	SBM-NCR-00000	Por solicitud de Fabricaciones se modifica la pieza A1002605 correspondiente al Housing FM de la OBC y la pieza A1002712 correspondiente al grupo de MGSEs.\r\nAumentar la medida de los redondeos en las cuatro esquinas de las perforaciones para los conectores Micro D-9. Medida actual R=0,38mm pasa a R=0,5mm.\r\nModificación para pieza A1002605, aumentar los redondeos en esquinas de los bajo relieves de la cara externa para todos los conectores. Se aumentan todos los redondeos a R=0,5mm.\r\nEstas modificaciones no afectan los planos para control dimensional correspondientes a las piezas nombradas.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:00.048722	2021-09-27 18:49:01.718922	\N	0	\N	\N	337	1	2	f	\N	\N	\N
338	1	2	SBM-NCR-00000	En la revisión interna que se realiza del aIAB se detecta que el resultado de dicha revisión arrojo que el VHDL disponible no seria compatible con la documentación disponible en el FTP CONAE, ensayo FAT, y no se están cumpliendo muchos de los requerimientos propios del VHDL. Se adjunta reporte de la revisión realizada por la empresa EMTECH	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:00.24993	2021-09-27 18:49:01.923293	\N	0	\N	\N	338	1	2	f	\N	\N	\N
339	1	2	SBM-NCR-00000	Al momento de integrar el componente ANTXV1N755AUR se detecta el faltante en la bolsa de kiting de una unidad del mismo.	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:00.424922	2021-09-27 18:49:02.076231	\N	0	\N	\N	339	1	2	f	2021-09-13 20:06:00.424922	\N	\N
340	1	2	SBM-NCR-00000	Se detecta durante el armado de la placa TCB - EM - 001, que los componentes M55342H121310AOR, RES SMD 10 OHM 0.1% 1/10W 0603, designadores R42H (paso 734) y R17H (paso 718), han sido rozados por el operador en su parte superior desprendiéndose una porción del esmaltado color verde, se decide reemplazarlos por componentes del stock de repuestos.	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:00.598792	2021-09-27 18:49:02.259907	\N	0	\N	\N	340	1	2	f	2021-09-13 20:06:00.598792	\N	\N
341	1	2	SBM-NCR-00000	En la placa TAB_EM_001 Se observa que se soldó un resistor en R5L,siendo que en el paso debe\r\nsoldarse R5J (paso n° 100).	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:01.228191	2021-09-27 18:49:02.43453	\N	0	\N	\N	341	1	2	f	\N	\N	\N
342	1	2	SBM-NCR-00000	En proceso de integración placa TAB_EM_001 el operador pierde un componente , el mismo se cae\r\nal piso ( resistencia. M55342H06B470BR, Paso: 258 de integración.)	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:01.414581	2021-09-27 18:49:02.610636	\N	0	\N	\N	342	1	2	f	2021-09-13 20:06:01.414581	\N	\N
343	1	2	SBM-NCR-00000	el siguiente componente, M55342E12B2B71R (pasos n° 210 y 211)\r\ncantidad:2, no se encuentra en la bolsas de kitting.	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:01.601955	2021-09-27 18:49:02.785312	\N	0	\N	\N	343	1	2	f	2021-09-13 20:06:01.601955	\N	\N
344	1	2	SBM-NCR-00000	se posiciona el compnente FPGA U1D con el dispositivo para ajustar el componente con term a gap\r\nen la placa TAB_EM_001 y se sueldan 2 pines del mismo sin tener el componente desdorado y pre estañado,	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:01.772438	2021-09-27 18:49:02.963186	\N	0	\N	\N	344	1	2	f	2021-09-13 20:06:01.772438	\N	\N
345	1	2	SBM-NCR-00000	se sueldaan los Resistores que debían poblarse luego de poblar los componentes conformados, los\r\ndesignadores son: R8H, R14H, R18H, R26H, R34H, R41H, R50H de los pasos n° 63, 67, 69, 73, 78, 80, 86\r\nrespectivamente Placa TAB EM 001	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:01.95553	2021-09-27 18:49:03.142813	\N	0	\N	\N	345	1	2	f	2021-09-13 20:06:01.95553	\N	\N
346	1	2	SBM-NCR-00000	Al colocar los conetores J3N,J3O y J1P en la placa TAB_EM_001 se detecta que los pines no logran pasar en alugunos casos al lado botom imagenes adjuntas.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:02.503377	2021-09-27 18:49:03.32908	\N	0	\N	\N	346	1	2	f	\N	\N	\N
347	1	2	SBM-NCR-00000	al momento de integrar el conector SDD62S4R7NT6G-1144.8 designador J1P se detecta que el\r\nmismo queda mal pocicionado producto de una deformacion en uno de los anclajes laterales,	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:02.672569	2021-09-27 18:49:03.508955	\N	0	\N	\N	347	1	2	f	2021-09-13 20:06:02.672569	\N	\N
348	1	2	SBM-NCR-00000	En proceso de inspeccioin se detecta que el conector designador J2D esta integrado siendo que el\r\ntraveler no indica que se suelde en esta etapa.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:02.849327	2021-09-27 18:49:03.684679	\N	0	\N	\N	348	1	2	f	\N	\N	\N
349	1	2	SBM-NCR-00000	Luego de terminar el montaje de la placa TAB-EM-001, se encuentra un sobrante de 10 resistores M55342E12B4B70R, descripción: RES SMD 4.7K OHM 0.1% 1/10W 0603	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:03.021501	2021-09-27 18:49:03.903427	\N	0	\N	\N	349	1	2	f	2021-09-13 20:06:03.021501	\N	\N
350	1	2	SBM-NCR-00000	Se detecta durante el montaje de la placa GPIO-EM-001, que al reemplazar el Flux que estaban utilizando por el correspondiente al envase "Contact Flux DELTA", lote de fabricante OF: 11764, las soldaduras comenzaron a presentar porosidad y opacidad. Se detectó que al volver al lote utilizado anteriormente las anomalías desaparecieron al instante	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:03.19713	2021-09-27 18:49:04.056695	\N	0	\N	\N	350	1	2	f	\N	\N	\N
351	1	2	SBM-NCR-00000	En la preparación previa a la fabricación de las piezas del housing, el área de fabricaciones solicita una modificación en los radios de empalme de las piezas A1002632 y A1002697. Medida indicada inicialmente R=2mm; modificar a R2,5mm.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:03.905455	2021-09-27 18:49:04.232093	\N	0	\N	\N	351	1	2	f	\N	\N	\N
352	1	2	SBM-NCR-00000	Se detecta en los planos que se citan el faltante de medida en perforaciones indicadas en las siguientes imágenes.\r\n\r\n• SBM-OBC-DR-00015-A Central column A1002643.\r\n• SBM-OBC-DR-00011-A Slotted column A1002604(R,L).	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:04.07956	2021-09-27 18:49:04.416369	\N	0	\N	\N	352	1	2	f	\N	\N	\N
474	9	39	SABIA.FS.PFM.SM.S&M.PAN.-Z.-X	Panel-Z-X	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:46:32.377787	2021-11-24 13:49:54.131388	\N	0	\N	472	463	17	18	f	\N	\N	\N
507	22	49	2	\N	\N	\N	2	\N	1	\N	1	0	2021-12-09 17:10:19.958457	2021-12-09 17:10:19.958457	\N	0	\N	\N	507	1	10	f	\N	\N	\N
517	22	49	2.3	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:48.47775	2021-12-09 18:28:59.375038	\N	0	\N	507	507	6	7	f	\N	\N	\N
514	22	49	1.6	\N	\N	\N	2	\N	1	\N	1	0	2021-12-09 17:11:48.133481	2021-12-09 17:11:48.133481	\N	0	\N	\N	514	1	2	f	\N	\N	\N
508	22	49	3	\N	\N	\N	2	\N	1	\N	1	0	2021-12-09 17:10:20.072872	2021-12-09 17:10:20.072872	\N	0	\N	\N	508	1	18	f	\N	\N	\N
522	22	49	3.4	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:49.825822	2021-12-09 18:30:44.845093	\N	0	\N	508	508	8	9	f	\N	\N	\N
513	22	49	1.5	\N	\N	\N	2	\N	1	\N	1	2	2021-12-09 17:11:45.593944	2021-12-13 14:25:08.171457	\N	0	\N	\N	513	1	2	f	\N	\N	\N
506	22	49	1	\N	\N	\N	2	\N	1	\N	1	0	2021-12-09 17:10:19.830658	2021-12-09 17:10:19.830658	\N	0	\N	\N	506	1	10	f	\N	\N	\N
510	22	49	1.2	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:45.268158	2021-12-09 17:15:43.235031	\N	0	\N	506	506	4	5	f	\N	\N	\N
456	1	2	SBM-NCR-00024	En la placa SBC EM de la caja PMOB, existe una diferencia entre el footrpint de la memoria SDRAM disponible para integración y los pads presentes en el PCB. La parte adquirida viene pre-conformada (versión "deep side-braze") mientras que el footprint en PCB es para la versión "shallow side-braze" (conformado en "omega"). En lo que respecta al conformado de pines, para integrar el componente a la placa, solo se cortaron los pines con la longitud adecuada ya que el componente viene pre conformado en versión (versión "deep side-braze"). Se considera necesario analizar esta NC para evaluar si la integración actual es aceptable o requiere algún tipo de modificación o mitigaciones. Se ve necesidad de analizar particularmente el aspecto mecánico.	\N	\N	2	\N	3	\N	1	9	2021-09-13 20:06:32.089505	2021-09-27 18:48:32.792599	\N	0	\N	\N	456	1	2	f	\N	\N	\N
441	1	2	SBM-NCR-00010	Debido a errores de diseño en la placa IAB EM se detectadron los siguientes problemas:\r\n1) Los transistores 2N2222 tienen invertido el footprint\r\n2) El footprint del PCB del diodo 1N5822 no coincide con el componente adquirido	\N	\N	2	\N	2	\N	1	14	2021-09-13 20:06:28.163873	2021-09-27 18:48:30.001	\N	0	\N	\N	441	1	2	f	\N	\N	\N
442	1	2	SBM-NCR-00021	Al analizar el codigo fuente enviaro por VENG para el Bootloader v2.3 se observa incumplimientos de los requerimientos de calidad, mala codificacion, desprolijidad y agregado de codigo que fue, expresamente NO SOLICITADO por CONAE en el ambito de la resolucion de la NCR 19.\r\nEn el documento adjunto "SB-050403-MM-00100-B SABIA-Mar Memo - PM-OBC Analisis del Driver de la Flash y EEPROM del Bootloader (y del BSW) BL 2.0 y BL 2.3 23-09-2019", Capitulo "III Incorporación cambios versión BL v2.3" se detallan los hallazgos. \r\nSe complementa la informacion con la NCR #19 y en la Anomaly Card #20	\N	\N	2	\N	3	\N	1	12	2021-09-13 20:06:28.36829	2021-09-27 18:48:30.176052	\N	0	\N	\N	442	1	2	f	\N	\N	\N
438	1	2	SBM-NCR-00016	Durante la puesta en marcha de la placa SBC A EM, mientras se trato de programar la FPGA siguiendo el procedimiento SBM-VENG-OBC-RP-007002-A As_Run_SBC EM Bring-Up Test Dynamic Procedure_Pre_Bootloader_Rev32, el programador no detecta la FPGA. Se interrumpe el ensayo y un análisis posterior muestra que existen varios problemas de diseno en el JTAG que afectan no solo la programación de la FPGA sino como el fabricante recomienda disponer el JTAG en vuelo a saber:\r\n- Senal PROG_MODE debe estar NC y esta conectado a GND\r\n- Senal TRST y TCK deben tener una R de pulldown cerca de la FPGA y no lo tienen	\N	\N	2	\N	3	\N	1	20	2021-09-13 20:06:27.250859	2021-09-27 18:48:29.427651	\N	0	\N	\N	438	1	2	f	\N	\N	\N
439	1	2	SBM-NCR-00013	Al soldar el Header J1ñ SMD, que provee alimentacion de 5V a los receptores RS422, en el PCB se levanta el Pad (-)	\N	\N	2	\N	3	\N	1	13	2021-09-13 20:06:27.432431	2021-09-27 18:48:29.57793	\N	0	\N	\N	439	1	2	f	\N	\N	\N
443	1	2	SBM-NCR-00019	Durante los ensayos de puesta en marcha, durante los ensayos del Bootloader para la carga de software aplicativo utilizando la consola del Bootloader, se detectaron anomalias y malfuncionamiento del proceso de escritura. Un analisis detallado determino que de las tres memorias Flash que se utilizan en cada banco, dos de ellas que allmacenan los datos estan configuradas en modo 16bits (logrando los 32bits de datos) mientras que la memoria que almacena los 8 bits del EDAC esta configurada en 8bits lo que ocaciona que el mapeado de los comandos y los sectores de las memorias no coincidan provocando un mal funcionamiento. Ver mas detalles en el adjunto	\N	\N	2	\N	3	\N	1	13	2021-09-13 20:06:28.568777	2021-09-27 18:48:30.385174	\N	0	\N	\N	443	1	2	f	\N	\N	\N
354	1	2	SBM-NCR-00000	Se encuentra error dimensional en las piezas A1002605 y A1002697 que forman parte del Housing de la OBC del Satélite SABIA-Mar.\r\nLos agujeros de montaje para los conectores:\r\n1) Positronic SND y SDD tienen un diámetro de 2.24mm, menor al necesario. Deberían ser de 3 mm.\r\n\r\n2) Micro-D 9 los agujeros de montaje tienen un diámetro de 3.2mm, mayor al requerido. Deberían ser de 2,5 mm	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:04.446642	2021-09-27 18:49:04.806158	\N	0	\N	\N	354	1	2	f	\N	\N	\N
455	1	2	SBM-NCR-00000	Durante los ensayos de depuración del bootloader se detectan problemas de ejecución de código. \r\nSe dan las siguientes situaciones anómalas:\r\nCon las memorias de booteo limpias se puede acceder con el GRMON 2.0 Pro:\r\n Inmediatamente se puede cargar y verificar, pero no se puede ejecutar ningún código\r\n Pasado un tiempo (no determinístico) se pueden cargar y ejecutar aplicaciones cortas \r\n Pasado un tiempo (no determinístico) el procesador se puede utilizar de forma nominal.\r\nCon las memorias de booteo cargadas no se puede acceder con el GRMON 2.0 Pro:\r\n Inmediatamente luego del encendido es necesario presionar el botón DSU Break para que el procesador pueda acceder al módulo DSU. \r\n Luego se repiten las situaciones anteriores.\r\n	\N	\N	4	\N	3	\N	1	238	2021-09-13 20:06:31.574012	2021-09-27 18:48:32.614367	\N	0	\N	\N	455	1	2	f	2021-09-13 20:06:31.574012	\N	\N
353	1	2	SBM-NCR-00000	1 - Se observan diferencias entre el plano y el modelo 3D de la pieza A1002632 Long Side Cover B (power box). En el primero se detalla una perforación de 10mm de profundidad y diámetro para luego hacer una rosca M3 y en el sólido la perforación indicada es de 8mm de profundidad y diámetro para luego hacer una rosca M2.5. Las medidas correctas son las indicadas en el modelo 3D.\r\nPlano involucrado: SBM-OBC-DR-0014-A Long side cover B (power box) A1002632.\r\nModelo 3D: SBM-OBC-MD-00011-B Housing PM-OBC A1002600.\r\n2 – Los agujeros pasantes (x3) ubicados en el centro de la pieza A1002632 tienen un diámetro menor al necesario (2,8mm) necesario (3,5mm).	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:04.25837	2021-09-27 18:49:04.596579	\N	0	\N	\N	353	1	2	f	\N	\N	\N
440	1	2	SBM-NCR-00011	Durante el poblado de la placa SBC EM se detecto que la herramienta de alineado no se puede fijar correctamente en la placa ya que la misma es ligeramente mayor que el estandar de 6U.	\N	\N	2	\N	3	\N	1	10	2021-09-13 20:06:27.615551	2021-09-27 18:48:29.789585	\N	0	\N	\N	440	1	2	f	\N	\N	\N
475	9	39	SABIA.FS.PFM.SM.S&M.PAN.-Z.RNF	Panel-Z Reinforce	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:46:55.287802	2021-11-24 13:49:54.391945	\N	0	\N	472	463	19	20	f	\N	\N	\N
515	22	49	2.1	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:48.243845	2021-12-09 18:28:40.534439	\N	0	\N	507	507	2	3	f	\N	\N	\N
516	22	49	2.2	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:48.361474	2021-12-09 18:28:50.048269	\N	0	\N	507	507	4	5	f	\N	\N	\N
518	22	49	2.4	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:48.58656	2021-12-09 18:29:10.747354	\N	0	\N	507	507	8	9	f	\N	\N	\N
519	22	49	3.1	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:49.50761	2021-12-09 18:30:24.873507	\N	0	\N	508	508	2	3	f	\N	\N	\N
520	22	49	3.2	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:49.609264	2021-12-09 18:30:28.766386	\N	0	\N	508	508	4	5	f	\N	\N	\N
521	22	49	3.3	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:49.727276	2021-12-09 18:30:38.611698	\N	0	\N	508	508	6	7	f	\N	\N	\N
523	22	49	3.5	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:49.933594	2021-12-09 18:30:51.085446	\N	0	\N	508	508	10	11	f	\N	\N	\N
525	22	49	3.7	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:51.492003	2021-12-09 18:31:07.500597	\N	0	\N	508	508	14	15	f	\N	\N	\N
365	1	2	SBM-NCR-00000	Al momento de apertura de la cámara post ciclado térmico se detecta olor no esperado	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:07.082237	2021-09-27 18:44:35.071819	\N	0	\N	\N	365	1	2	f	\N	\N	\N
358	1	2	SBM-NCR-00000	al momento de preestañar el comonente 66266-001 paso 27 de integracion perteneciente a la placa GPIO_EM_001 se detecta el faltante de un componente, teniendo 9 de los 10 indicados en la bolsa provista por personal de storage.	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:05.49629	2021-09-27 18:47:30.562146	\N	0	\N	\N	358	1	2	f	2021-09-13 20:06:05.49629	\N	\N
457	1	2	SBM-NCR-00020	Como resultado de la inspeccion de las tareas de integracion del Backplane al Bastidor del modelo EM se detectaron varias anomalias y defectos al analizar los trabajos reportados en el documento SBM-VENG-OBC-RP-07013-A - Integracion Bastidor PM-OBC EM.\r\nEn el archivo adjunto se encuentran los detalles	\N	\N	4	\N	3	\N	1	11	2021-09-13 20:06:32.266086	2021-09-27 18:48:32.974134	\N	0	\N	\N	457	1	2	f	2021-09-13 20:06:32.266086	\N	\N
356	1	2	SBM-NCR-00000	1) En el procedimiento en la sección de “setup” en la figura se encuentra un borne del resistor de grounding conectando los retornos de ambas fuentes. De no quitarse el resistor conectado al retorno de la Fuente de 5V, se podría generar un un loop de corrientes en ground.\r\n2) Se sugiere modificar el orden de los pasos cambiando el paso 81 por el paso 79. Se mide con la punta del osciloscopio sobre la resistencia R4C y luego se encienden ambas fuentes.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:05.153335	2021-09-27 18:49:05.225002	\N	0	\N	\N	356	1	2	f	\N	\N	\N
368	1	2	SBM-NCR-00000	Durante los ensayos de calificación de pegado de celdas realizado en CNEA sobre el cupón de ensayo provisto por INVAP, en\r\nla inspección de 50 ciclos se observa en algunas zonas del perímetro, el despegado de la cinta Black Kapton (ver "Registro\r\nfotográfico Inspección 50 ciclos" en archivos adjuntos). Tanto en el ensayo de electroluminiscencia como de continuidad no se\r\nobservaron deterioros respecto de las celdas, diodos y adhesivo.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:07.972982	2021-09-27 18:44:58.758136	\N	0	\N	\N	368	1	2	f	\N	\N	\N
367	1	2	SBM-NCR-00037	Moog informo que no puede cumplir con los niveles especificados en los requerimiento de CONAE para cargas cuasiestáticas, vibraciones random y shock.	\N	\N	2	\N	3	\N	1	8	2021-09-13 20:06:07.799259	2021-09-27 18:45:12.669051	\N	0	\N	\N	367	1	2	f	\N	\N	\N
359	1	2	SBM-NCR-00000	En proceso de integracion de placa GPIO_EM_001 se detecta la resistencia perteneciente al paso 9A designador R52A, esta presenta una marca en la parte superior mostrando falta de pintura	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:05.673008	2021-09-27 18:47:30.710624	\N	0	\N	\N	359	1	2	f	2021-09-13 20:06:05.673008	\N	\N
360	1	2	SBM-NCR-00000	En proceso de integración de la placa GPIO_EM_001 se integran resitencias pertenecientes al paso 9A cuyos designadores son ( R32 - R24 - R18 - R14 - R50 ) estas se encuentran en el documento de integración marcadas como no integrar en esta etapa.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:05.846842	2021-09-27 18:47:30.910188	\N	0	\N	\N	360	1	2	f	\N	\N	\N
361	1	2	SBM-NCR-00000	En proceso de inet}gración de la placa GPIO_EM_001 paso 9A se suelda una resistencia en el\r\ndesignador R33A siendo que el documento no indica que se suelde	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:06.356612	2021-09-27 18:47:31.083771	\N	0	\N	\N	361	1	2	f	\N	\N	\N
362	1	2	SBM-NCR-00000	En la placa AVAB_EM_001, se sueldan resistencias (1k .1% 0705) pertenecientes al paso de integracion 82 y 83 cuyos designadores son R10A y R16A en los designadores R5L - R7L,	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:06.548122	2021-09-27 18:47:31.286852	\N	0	\N	\N	362	1	2	f	\N	\N	\N
363	1	2	SBM-NCR-00000	Los led´s (D1A-D2A-D3A-D4A) de la placa COMM-EM-001 se encuentran posicionados al reves	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:06.721184	2021-09-27 18:47:31.475398	\N	0	\N	\N	363	1	2	f	2021-09-13 20:06:06.721184	\N	\N
366	1	2	SBM-NCR-00000	Se encendió muy brevemente la fuente 2 por error (paso 27 del logbook 05-06-2019). Se ejecutó el procedimiento de encendido verificando funcionalidad y corrientes; aparentemente no pasó nada.\r\n0El el reporte SBM-VENG-OBC-SBC-RP-007007 se propone conectar un relay que active la otra fuente, pero no es una solución válida, no se puede verificar el consumo de la SBC desde la fuente, se coloca una ?bobina? en paralelo con la alimentación de la SBC y complica el setup.	\N	\N	2	\N	3	\N	1	3	2021-09-13 20:06:07.624428	2021-09-27 18:47:31.840036	\N	0	\N	\N	366	1	2	f	\N	\N	\N
369	1	2	SBM-NCR-00000	Se detecta durante el poblado parcial de la placa AVAB_EM_01 que al momento de realizar la soldadura de las torretas J3A, J4A,J5A,J7A,J8A,J9A  el estaño no llega a cubrir lo requerido por norma en el lado top de la placa.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:08.163824	2021-09-27 18:47:32.130105	\N	0	\N	\N	369	1	2	f	\N	\N	\N
509	22	49	1.1	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:45.158295	2021-12-09 17:13:59.762483	\N	0	\N	506	506	2	3	f	\N	\N	\N
357	1	2	SBM-NCR-00000	Resistencia 470R codigo (M55342E06B470AR) caida al piso, paso 614 de la placa\r\nAVAB_EM_001	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:05.32056	2021-09-27 18:49:05.388442	\N	0	\N	\N	357	1	2	f	2021-09-13 20:06:05.32056	\N	\N
524	22	49	3.6	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:51.374283	2021-12-09 18:30:58.691934	\N	0	\N	508	508	12	13	f	\N	\N	\N
526	22	49	3.8	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:51.609981	2021-12-09 18:31:13.448012	\N	0	\N	508	508	16	17	f	\N	\N	\N
476	9	39	SABIA.FS.PFM.SM.S&M.NOD	Nodes	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:47:40.813229	2021-11-24 13:49:54.681923	\N	0	\N	466	463	23	28	f	\N	\N	\N
478	9	39	SABIA.FS.PFM.SM.S&M.NOD.-Y+Z	Node-Y+Z	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:48:44.179732	2021-11-24 13:49:55.182763	\N	0	\N	476	463	26	27	f	\N	\N	\N
462	11	1	prueba		\N	\N	10	\N	1	\N	1	2	2021-11-23 14:52:24.588167	2021-12-02 13:33:12.305228	2021-11-23	0	\N	\N	462	1	2	f	\N	\N	\N
370	1	2	SBM-NCR-00000	Se detecta en proceso de preparación para la integración parcial - 1 etapa de la placa TAB_EM_01 que los componentes ACT 8501-7 N° de serie (0673-0666-0668), al abrir el empaque, los mismos no se encuentran asegurados en su posición nominal, teniendo movimiento por lo que presentan pines doblados es sus 4 extremos. Uno de ellos vino fuera de posición dentro del empaque.\r\nEl empaque en el que vinieron es el original del fabricante para estos integrados, pero antes de ser conformados y cortados los pines, estos vienen centrados y asegurados con un marco metálico/plástico dentro de la caja. Este marco yo no es adecuado una vez conformada la parte.\r\nDesde storage se agregó en el envío a INVAP dentro de cada bolsa de cada tipo de componente, cajas extras acondicionadas para colocar las partes conformadas y que no se muevan en su traslado y almacenamiento.  Cuando se realiza la recepción se observa que algunos componentes vinieron dentro de estas cajas acondicionadas y otros en los originales.\r\n	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:08.338706	2021-09-27 18:47:32.371533	\N	0	\N	\N	370	1	2	f	\N	\N	\N
409	1	2	SBM-NCR-00029	El Harness de TM&TC RS422 del GS-GSE no cumple con las especificaciones de SABIA-Mar por los siguientes motivos:\r\n? La impedancia característica del cable (Z) debe ser de 120ohm y es de 100ohm.\r\n? No cumplen con el documento SB-090200-SP-00100-B SABIAMar Grounding-Bonding-Isolation Desing Specifications debido a que el harness no tiene malla en cada par y las carcasas de los conectores no son metálicas.\r\nEl impacto inmediato es que el GS-GSE cumple parcialmente los requerimientos L4-GSE-012 y L4-GSE-013. Aunque las terminaciones de la US se configuraron acorde a los requerimientos, y filosofía de terminación de líneas RS4422, no se satisface el requerimiento ya que no hay adaptación de impedancia.\r\nSe utilizó el harness del GS-GSE de Z=100ohm (heredado de SAOCOM) ya que el harness que se utilizará entre el GS-GSE y el FS también es de 100ohm (también heredado de SAOCOM). De esta manera se evita una desadaptación de impedancias en la interfaz GS-GSE/Harness.\r\nDicha implementación fue validada por el grupo de SE de la misión. Gustavo Gonzalez indicó que se debe elaborar el correspondiente RFW/RFW.	\N	\N	2	\N	3	\N	1	11	2021-09-13 20:06:18.693157	2021-09-27 18:44:20.660373	\N	0	\N	\N	409	1	2	f	\N	\N	\N
372	1	2	SBM-NCR-00034	Previo al comienzo de la integración parcial de la placa TCB EM -1 etapa, se informa desde el LaIE que basados en la experiencia que se tuvo en un proyecto anterior (SAOCOM - NC SAO-CTR-NR-00062) las partes EEE MOSFET a utilizar, de acuerdo a lo indicado en el estándar de la ESA…donde para este tipo de encapsulados indica no soldar directamente sobre el PCB.	\N	\N	2	\N	2	\N	1	10	2021-09-13 20:06:09.123445	2021-09-27 18:47:32.612988	\N	0	\N	\N	372	1	2	f	\N	\N	\N
373	1	2	SBM-NCR-00033	Se detecta en la preparación del therm-a-gap sobre el componente ACT8501-7 (designador U2K) que el mismo a simple vista queda a ras de los pines en vez de sobrepasarlos como se esperaba. \r\nSe decide medir la altura del conformado del componente con la herramienta FANCORT detectando una diferencia dimensional de lo medido vs lo solicitado en el documento “especificaciones de conformado de pines” emitido por CONAE hacia INVAP.  Se decide medir todos los componentes recibidos.	\N	\N	2	\N	2	\N	1	22	2021-09-13 20:06:09.297036	2021-09-27 18:47:32.849691	\N	0	\N	\N	373	1	2	f	\N	\N	\N
536	1	2	asdasd		\N	\N	2	\N	1	\N	1	0	2022-01-07 19:11:15.101936	2022-01-07 19:11:15.101936	2022-01-07	0	\N	\N	536	1	2	f	\N	\N	\N
463	9	39	SABIA	SABIAMAR MISSION	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:37:01.477796	2021-11-24 13:49:51.609845	\N	0	\N	\N	463	1	32	f	\N	\N	\N
465	9	39	SABIA.FS.PFM.SM	Service Module	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:38:59.017378	2021-11-24 13:49:51.857471	\N	0	\N	464	463	3	30	f	\N	\N	\N
467	9	39	SABIA.FS.PFM.SM.S&M.PAN	Panels	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:40:44.763945	2021-11-24 13:49:52.265027	\N	0	\N	466	463	5	22	f	\N	\N	\N
469	9	39	SABIA.FS.PFM.SM.S&M.PAN.+Y		\N	\N	10	\N	1	\N	1	2	2021-11-24 11:43:01.402666	2021-11-24 13:49:52.756564	\N	0	\N	467	463	8	9	f	\N	\N	\N
472	9	39	SABIA.FS.PFM.SM.S&M.PAN.-Z	Panel-Z	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:45:34.652562	2021-11-24 13:49:53.57039	\N	0	\N	467	463	14	21	f	\N	\N	\N
477	9	39	SABIA.FS.PFM.SM.S&M.NOD.+Y+Z	Node+Y+Z	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:48:14.148331	2021-11-24 13:49:54.921106	\N	0	\N	476	463	24	25	f	\N	\N	\N
511	22	49	1.3	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:45.367814	2021-12-09 17:15:06.800853	\N	0	\N	506	506	6	7	f	\N	\N	\N
512	22	49	1.4	\N	\N	\N	2	\N	1	\N	1	1	2021-12-09 17:11:45.485041	2021-12-09 17:15:47.116488	\N	0	\N	506	506	8	9	f	\N	\N	\N
528	22	63	3.1.1	\N	\N	\N	2	\N	1	\N	1	0	2021-12-16 12:28:32.304848	2021-12-16 12:28:32.304848	\N	0	\N	\N	528	1	2	f	\N	\N	\N
529	22	63	3.1.2	\N	\N	\N	2	\N	1	\N	1	0	2021-12-16 12:28:32.408762	2021-12-16 12:28:32.408762	\N	0	\N	\N	529	1	2	f	\N	\N	\N
377	1	2	SBM-NCR-00000	Al momento de integrar la resistencia R14J (paso 136 del procedimiento), el operador detecta una diferencia entre el tamaño del pad en la placa con el componente: en la placa el tamaño es 0705 y el componente entregado y que figura en la lista de integración es 1206.\r\n\r\nEl componente en cuestión es D55342E07B604BR\r\nDe su datasheet se obtiene: \r\n \r\nSe observa que el encapsulado es 1206. \r\n\r\nAl revisar el proyecto en Altium: \r\n\r\nSe observa que el PN es el mismo (D55342E07B604BR) pero el footprint seleccionado es 0705	\N	\N	2	\N	3	\N	1	2	2021-09-13 20:06:10.357518	2021-09-27 18:47:33.571858	\N	0	\N	\N	377	1	2	f	\N	\N	\N
378	1	2	SBM-NCR-00000	Se detecta durante el poblado parcial de las placas AVAB_EM_01 y GPIO_EM_01 que los pines de los conectores d-SUB no sobresalen en el lado Bottom al ser integrados.	\N	\N	2	\N	3	\N	1	11	2021-09-13 20:06:10.538731	2021-09-27 18:47:33.751332	\N	0	\N	\N	378	1	2	f	\N	\N	\N
379	1	2	SBM-NCR-00000	Se detecta durante el poblado parcial de la placa AVAB_EM_01 y GPIO_EM_01 que los agujeros de la platina en su cara frontal para fijar los conectores a la misma son pequeños y no permiten el paso de los tornillos.	\N	\N	2	\N	3	\N	1	2	2021-09-13 20:06:10.722637	2021-09-27 18:47:33.940301	\N	0	\N	\N	379	1	2	f	\N	\N	\N
530	22	63	3.1.3	\N	\N	\N	2	\N	1	\N	1	0	2021-12-16 12:28:32.508484	2021-12-16 12:28:32.508484	\N	0	\N	\N	530	1	2	f	\N	\N	\N
382	1	2	SBM-NCR-00000	Se registra la presente No Conformidad para dar seguimiento a los retrabajos pendientes a raíz de la NC 0965SIE1116, que se deberán realizar sobre las placas EL-1586 S/N V-B335-001 y V-B335-002 cuando se reciban los componentes necesarios; fecha estimada de recepción de los componentes: julio de 2021.\r\nA partir de la presente NC, el servicio de Producción Electrónica cierra la NC 0965SIE1116 y el Plan C254-PVVB-0QREL-335-A, para liberar las placas del proceso de fabricación. Cuando lleguen los componentes se deberán realizar los retrabajos bajo un nuevo Plan del servicio.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:11.651332	2021-09-27 18:44:58.907925	\N	0	\N	\N	382	1	2	f	\N	\N	\N
380	1	2	SBM-NCR-00000	Falta de información para la integracion al pcb (Altura de soldadura) y falta informacion para integración de Therm-a- gap: \r\n1) Componente U2M Fast Sample and Hold HS1B-2420EH/PROTO (Paso 245 AVAB) \r\n2) Componente Q5A TRANS NPN 50V 0.8A TO18 codigo JANTXV2N2222A (Paso 47 AVAB) \r\n3) Componente 66266-001 (Paso 27 GPIO)	\N	\N	2	\N	3	\N	1	3	2021-09-13 20:06:10.905747	2021-09-27 18:47:34.267054	\N	0	\N	\N	380	1	2	f	\N	\N	\N
383	1	2	SBM-NCR-00000	Se registra la presente No Conformidad para dar seguimiento a los retrabajos pendientes a raíz de la NC0965PEM0053, que se deberán realizar sobre las placas EL-1519 S/N V-B343-001 y V-B343-002 cuando se reciban los componentes necesarios; fecha estimada de recepción de los componentes:  2021.\r\nA partir de la presente NC, el servicio de Producción Electrónica cierra la NC 0965PEM0053 y el Plan C254-PVVB-0QREL-343-A , para liberar las placas del proceso de fabricación. Cuando lleguen los componentes se deberán realizar los retrabajos bajo un nuevo Plan del servicio.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:11.831254	2021-09-27 18:44:59.132755	\N	0	\N	\N	383	1	2	f	\N	\N	\N
375	1	2	SBM-NCR-00000	Se detecta que el Therm-a-gap utilizado con los integrados 66066-001 ( U3N -U2N - U5N- U6N -U9N -U10N -) pertenecientes al paso 27 de la placa GPIO_EM_001 presenta un desplazamiento de su ubicación original respecto a la final una vez que se sueldan los componentes, quedando fuera de especificación.	\N	\N	2	\N	3	\N	1	2	2021-09-13 20:06:09.655334	2021-09-27 18:47:33.219928	\N	0	\N	\N	375	1	2	f	\N	\N	\N
376	1	2	SBM-NCR-00000	Se detecta dificultad en soldar el capacitor del paso 120 designador C1M perteneciente a la placa AVAB_EM_001 dentro de los 260° indicados por norma. Se suelda a 320°.	\N	\N	2	\N	3	\N	1	2	2021-09-13 20:06:10.166793	2021-09-27 18:47:33.395328	\N	0	\N	\N	376	1	2	f	\N	\N	\N
381	1	2	SBM-NCR-00004	Durante la preparación y entrega del kitting, la revisión de la documentación asociada y la revisión del Plan de test se detectó inconsistencias entre los diferentes documentos, lo entregado en el kitting y las partes EEE que había que efectivamente popular para el modelo EM. Adicionalmente no quedo claro el proceso que utiliza STI para la recepción de partes, verificación de las mismas y conformado de kittings\r\nTambién se encontraron problemas en los registradores de humedad del kitting\r\n\r\nEn el documento adjunto se detallan las anomalías encontradas	\N	\N	4	\N	3	\N	1	4	2021-09-13 20:06:11.442769	2021-09-27 18:47:34.43417	\N	0	\N	\N	381	1	2	f	2021-09-13 20:06:11.442769	\N	\N
531	22	63	3.1.4	\N	\N	\N	2	\N	1	\N	1	0	2021-12-16 12:28:32.599162	2021-12-16 12:28:32.599162	\N	0	\N	\N	531	1	2	f	\N	\N	\N
532	22	63	3.1.5	\N	\N	\N	2	\N	1	\N	1	0	2021-12-16 12:28:32.699998	2021-12-16 12:28:32.699998	\N	0	\N	\N	532	1	2	f	\N	\N	\N
464	9	39	SABIA.FS.PFM	Flight Segment - Proto-Flight Model	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:38:12.523064	2021-11-24 13:49:51.708164	\N	0	\N	463	463	2	31	f	\N	\N	\N
466	9	39	SABIA.FS.PFM.SM.S&M	Service Module Structures and Mechanisms	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:39:40.262447	2021-11-24 13:49:52.041431	\N	0	\N	465	463	4	29	f	\N	\N	\N
468	9	39	SABIA.FS.PFM.SM.S&M.PAN.-X	Panel-X	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:41:22.592964	2021-11-24 13:49:52.499309	\N	0	\N	467	463	6	7	f	\N	\N	\N
533	22	69	3.7.1	\N	\N	\N	2	\N	1	\N	1	1	2021-12-16 12:28:33.121413	2021-12-16 12:29:22.454766	\N	0	\N	\N	533	1	2	f	\N	\N	\N
534	22	69	3.7.2	\N	\N	\N	2	\N	1	\N	1	1	2021-12-16 12:28:33.226855	2021-12-16 12:29:22.599935	\N	0	\N	\N	534	1	2	f	\N	\N	\N
470	9	39	SABIA.FS.PFM.SM.S&M.PAN.-Y	Panel-Y	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:44:38.80749	2021-11-24 13:49:53.025984	\N	0	\N	467	463	10	11	f	\N	\N	\N
535	22	69	3.7.3	\N	\N	\N	2	\N	1	\N	1	1	2021-12-16 12:28:33.316771	2021-12-16 12:29:22.752655	\N	0	\N	\N	535	1	2	f	\N	\N	\N
479	21	48	R1		\N	1	2	\N	1	\N	1	2	2021-12-01 14:07:37.582994	2021-12-01 14:11:26.567495	\N	0	\N	\N	479	1	2	f	\N	\N	\N
385	1	2	SBM-NCR-00000	Previo al poblado de la placa TCB EM se hace un repaso en conjunto con CONAE de los componentes disponibles físicamente en stock con el listado de componentes solicitado utilizando como base para armar esta NC el Excel Componentes PM-OBC v1.8. 	\N	\N	2	\N	2	\N	1	1	2021-09-13 20:06:12.188363	2021-09-27 18:47:34.805937	\N	0	\N	\N	385	1	2	f	\N	\N	\N
396	1	2	SBM-NCR-00000	al momento de colocar la torreta 1502-3 designador J4-I en la placa PWR -A la misma se rompre.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:15.653772	2021-09-27 18:47:36.847205	\N	0	\N	\N	396	1	2	f	\N	\N	\N
386	1	2	SBM-NCR-00000	Previo al poblado de la placa TAB EM se hace un repaso en conjunto con CONAE de los componentes disponibles físicamente en stock con el listado de componentes solicitado utilizando como base para armar esta NC el Excel Componentes PM-OBC v1.8. \r\n	\N	\N	2	\N	2	\N	1	1	2021-09-13 20:06:13.169765	2021-09-27 18:47:35.008434	\N	0	\N	\N	386	1	2	f	\N	\N	\N
387	1	2	SBM-NCR-00000	Previo al poblado de la placa AVAB EM se hace un repaso en conjunto con CONAE de los componentes disponibles físicamente en stock con el listado de componentes solicitado utilizando como base para armar esta NC el Excel Componentes PM-OBC v1.7. 	\N	\N	2	\N	2	\N	1	1	2021-09-13 20:06:13.345623	2021-09-27 18:47:35.197072	\N	0	\N	\N	387	1	2	f	\N	\N	\N
388	1	2	SBM-NCR-00000	Se detecta que en el documento SBM-OBC-PR-00006-6-B falta la indicaccion para la colocacion de Pad termicopara el componente 66266-001 designador U2F, a esto aclarar que en documento de integración SBM-OBC-PR-0005-B no se indica que componentes llevan este material.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:13.520371	2021-09-27 18:47:35.381764	\N	0	\N	\N	388	1	2	f	\N	\N	\N
389	1	2	SBM-NCR-00000	se detecta en inspección que la resistencia R16B ( CODIGO M55342K09B40D2R)perteneciente a la placa PWR_A_EM_001 presenta una marca	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:13.687414	2021-09-27 18:47:35.593841	\N	0	\N	\N	389	1	2	f	\N	\N	\N
390	1	2	SBM-NCR-00000	en el procedimiento de integración de la placa COMM_EM_001 y la placa PWR_A_EM_001 pide soldar algunos componentes con altura según la norma para placas de vuelo, siendo que en esta etapa no es necesario	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:13.857077	2021-09-27 18:47:35.772439	\N	0	\N	\N	390	1	2	f	\N	\N	\N
391	1	2	SBM-NCR-00000	Al momento de soldar el paso 44, la resistencia R4K el operadon encuentra una resitenciasoldada en el lugar, dicha recistencia fue soldada por indicacion de el paso 43 que tambien pide colocar una resistencia en ese desigador. las resistencias son de distinto valor Paso 43 R4K resistor 1K OHM Paso 44 R4Kresistor 4K7 OHM	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:14.404094	2021-09-27 18:47:35.963544	\N	0	\N	\N	391	1	2	f	\N	\N	\N
392	1	2	SBM-NCR-00000	La resistencia R44K presenta una marca en la parte superior dejando sin mascara a parte del cuerpo del componente,	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:14.581946	2021-09-27 18:47:36.158723	\N	0	\N	\N	392	1	2	f	\N	\N	\N
393	1	2	SBM-NCR-00000	se detecta que la resistencia codigo ( D55342E07B604BR ) perteneciente al paso de integracion 16 es de encapsulado1206 siendo que el pad tiene un tamaño 0705.	\N	\N	2	\N	3	\N	1	2	2021-09-13 20:06:14.7552	2021-09-27 18:47:36.320221	\N	0	\N	\N	393	1	2	f	\N	\N	\N
394	1	2	SBM-NCR-00000	Se detecta resistencia mal posicionada en paso N°13 la misma fue soldada en el designador R14D cuando el lugar correcto es R12D.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:14.931679	2021-09-27 18:47:36.502613	\N	0	\N	\N	394	1	2	f	\N	\N	\N
395	1	2	SBM-NCR-00000	El insumo estaño Kester SN63PB37 44" y estaño Kester SN96.5 AG 0.3 CU 2.2 seencuentran expirado 2 años al dia de la fecha sugerida por el fabricante	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:15.113382	2021-09-27 18:47:36.671692	\N	0	\N	\N	395	1	2	f	\N	\N	\N
397	1	2	SBM-NCR-00000	al momento de realizar la preparación para el pre estañado se detecta que falta la bolsa con el componente m55342e06b20b0rts, que consta de 4 resistencias no se encuentran en el kiting,	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:15.820605	2021-09-27 18:47:37.071215	\N	0	\N	\N	397	1	2	f	\N	\N	\N
398	1	2	SBM-NCR-00000	El largo de los pines del componente 901-10112 no tienen el largo correcto ya que no son los indicados para elespesor de la placa COMM.	\N	\N	2	\N	3	\N	1	2	2021-09-13 20:06:16.024226	2021-09-27 18:47:37.20967	\N	0	\N	\N	398	1	2	f	\N	\N	\N
399	1	2	SBM-NCR-00000	El PCB entregado junto con el Kitting es PWR_B este no coincide con el solicitado por la lista de partes, que es la placa version PWR_A	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:16.214635	2021-09-27 18:47:37.38338	\N	0	\N	\N	399	1	2	f	2021-09-13 20:06:16.214635	\N	\N
400	1	2	SBM-NCR-00000	Previo al poblado de la placa GPIO EM se hace un repaso en conjunto con CONAE de los componentes disponibles físicamente en stock con el listado de componentes solicitado utilizando como base para armar esta NC el Excel Componentes PM-OBC v1.3. 	\N	\N	2	\N	2	\N	1	1	2021-09-13 20:06:16.397668	2021-09-27 18:47:37.56468	\N	0	\N	\N	400	1	2	f	\N	\N	\N
401	1	2	SBM-NCR-00000	\N	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:16.989081	2021-09-27 18:47:37.737029	\N	0	\N	\N	401	1	2	f	\N	\N	\N
402	1	2	SBM-NCR-00000	Durante la confección de la documentación de validación de las placas (previo a su energizado), se detectó que en las placas EWC29 y EWC30 están invertidas algunas serigrafías de señalización de alimentación en conectores. 	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:17.156475	2021-09-27 18:47:37.918122	\N	0	\N	\N	402	1	2	f	\N	\N	\N
471	9	39	SABIA.FS.PFM.SM.S&M.PAN.+Z	Panel+Z	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:45:04.6583	2021-11-24 13:49:53.308066	\N	0	\N	467	463	12	13	f	\N	\N	\N
473	9	39	SABIA.FS.PFM.SM.S&M.PAN.-Z.+X	Panel-Z+X	\N	\N	10	\N	1	\N	1	2	2021-11-24 11:46:06.219759	2021-11-24 13:49:53.84675	\N	0	\N	472	463	15	16	f	\N	\N	\N
480	21	48	R2		\N	2	2	\N	1	1	1	3	2021-12-01 14:11:41.248783	2021-12-01 14:33:36.326862	\N	0	\N	\N	480	1	2	f	\N	\N	\N
419	1	2	SBM-NCR-00000	Durante el ensayo de TVT de acuerdo al plan 0965-PMVV-7QCIT-001-A, operación C003-1: Meseta#1, despresurización, se detectó que la presión se estabilizó en 16 Torr, siendo de 2 Torr el valor objetivo para la primera etapa de despresurización (vacío mecánico).	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:21.674755	2021-09-27 18:44:59.827842	\N	0	\N	\N	419	1	2	f	2021-09-13 20:06:21.674755	\N	\N
420	1	2	SBM-NCR-00000	El día martes 27 de Junio se procedió a recepcionar unos equipos que fueron enviados desde CONAE.\r\n\r\nRespecto a los Camera Interface Simulator CIE \r\n\r\nRecibimos un módulo con el P/N: U1410100 y S/N:162101003. Según la documentación el P/N y S/N corresponden al conjunto completo del Emulador (Módulo + PC + Cableado) \r\n\r\nNo recibimos el P/N: U1418100 y S/N:155101003. Según la documentación corresponde al módulo CIE recibido. \r\n\r\nRecibimos un módulo con el P/N: U1410100 y S/N:162101004. Según la documentación el P/N y S/N corresponden al conjunto completo del Emulador (Módulo + PC + Cableado) \r\n\r\nNo recibimos el P/N: U1418100 y S/N:155101004. Según la documentación correspondería al módulo CIE recibido. (Nota: En el Certificado de Conformidad dice S/N: 155101003 el lugar de S/N: 155101004) \r\n\r\nRespecto a los SSR Interface Simulator SSRIE \r\n\r\nRecibimos un módulo con el P/N: U1420100 y S/N:16301001. Según la documentación el P/N y S/N corresponden al conjunto completo del Emulador (Módulo + PC + Cableado) \r\n\r\nNo recibimos el P/N: U1427100 y S/N:161701001. Según la documentación correspondería al módulo SSRIE recibido. \r\n\r\nAdjunto ambos Certificados de Conformidad con notas en las diferencias encontradas. \r\n\r\nLa documentación recibida esta en: \r\n\r\nPT0965\\03_Sistemas\\03_EGSE\\01_Info\\03_EGSE STI\\01_Emuladores_PM-OBC\\01_CIE\\01_Documentos_CIE \r\n\r\nPT0965\\03_Sistemas\\03_EGSE\\01_Info\\03_EGSE STI\\01_Emuladores_PM-OBC\\02_SSRIE\\01_Documentos_SSRIE	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:21.86066	2021-09-27 18:45:00.018818	\N	0	\N	\N	420	1	2	f	2021-09-13 20:06:21.86066	\N	\N
403	1	2	SBM-NCR-00000	"Previo al poblado de la placa PWR EM se hace un repaso en conjunto con CONAE de los componentes disponibles físicamente en stock con el listado de componentes solicitado utilizando como base para armar esta NC el Excel Componentes PM-OBC v1.1. De este análisis se encuentra que es necesario resolver:\r\n\r\n1) Verificar qué pasó con el componente ""1038\r\n2) Verificar en BoM el P/N: DLT050B/25/M/L/T. Se pidió al Proyecto y se compró: DLT050BM-LT, pero en el BoM figura: DLT050B/25/M/L/T.\r\n3) Se observan diferencias en los códigos de los siguientes componentes: \r\n- Candidato: M55342E06B30B1RTS [30100 Ω] (en BoM: M55342E06B30B0R [30000 Ω])\r\n- Candidato: M55342E06B9B09RWS [9090 Ω] (en BoM: M55342E06B9B10R [9100 Ω]).\r\n\r\n4) Se observan diferencias en la terminación de los códigos Positronic (1901.52, 1543.16, etc) \r\n5)  Verificar ICD confirmando si hay un error en el BoM (verificar principalmente terminaciones T2 y T6):\r\n- Candidato: SDD15M4R7NT6G-1543.14 (en BoM: SDD15M4R7NT2G-1543.14) \r\n- Candidato: SDD15S4R7NT2G-1901.52 (en BoM: SDD15S4R7NT2G-1543.16).\r\n-Cruzar información con ICD, con Excel de Ale, con documentos a nivel placa emitidos por STI y con OCs.\r\n-Cruzar con harness de EGSE.\r\n        6)  Confirmar código de resistores de filas 31, 32 y 33.	\N	\N	2	\N	2	\N	1	1	2021-09-13 20:06:17.329989	2021-09-27 18:47:38.125503	\N	0	\N	\N	403	1	2	f	\N	\N	\N
404	1	2	SBM-NCR-00000	Previo al poblado de la placa COMM EM se hace un repaso en conjunto con CONAE de los componentes disponibles físicamente en stock con el listado de componentes solicitado utilizando el Excel Componentes PM-OBC v1.1. De este análisis se encuentra que es necesario resolver las acciones propuestas y detalladas en el listado de seguimiento.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:17.506809	2021-09-27 18:47:38.304554	\N	0	\N	\N	404	1	2	f	\N	\N	\N
405	1	2	SBM-NCR-00000	Durante el ensayo de puesta en marcha reducida del EGSE OBC SABIA Mar, lado B, se detectan las siguientes anomalías en su hardware. (ver reporte de ensayo SBM-GSE-TR-00010-A)	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:17.679782	2021-09-27 18:47:38.478992	\N	0	\N	\N	405	1	2	f	\N	\N	\N
406	1	2	SBM-NCR-00000	Durante el ensayo de puesta en marcha reducida del EGSE OBC SABIA Mar, lado A, se detectan las siguientes anomalías en su hardware/software.  (ver reporte de ensayo SBM-GSE-TR-00009-A)	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:18.180739	2021-09-27 18:47:38.653292	\N	0	\N	\N	406	1	2	f	\N	\N	\N
407	1	2	SBM-NCR-00000	Durante la inspección de poblado de la placa extender se detecta: \r\n\r\n1)  Se montaron de manera errónea los siguientes conectores: J2A; J2B; J2F; J2E.   Se prepara el kitting con conectores  por error (AGREGAR CÓDIGO)  en vez de los solicitados en el BOM (Agregar código)y se entregan a producción.  En producción no se detecta el error y se integran.\r\n2) Turret solicitados:  1502-4  //  Reemplazo disponible en LIE : 1502-3 (son prácticamente iguales)\r\n3) Faltantes Pines: 929715-10-34-EU  (Cantidad: 8 de 68 -   16 tiras de 34) à Ya gestione/solicite compra local, llegarían el Miércoles 18/11\r\n4) PortaFuse: 01110501Z – error de footprint / parte \r\n Los portafuse (footprint) están rotados 90° respecto al componente 	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:18.346477	2021-09-27 18:47:38.829953	\N	0	\N	\N	407	1	2	f	\N	\N	\N
408	1	2	SBM-NCR-00000	Durante la ejecución del ensayo, en la página 4 de la sección PM CURRENT en la tabla “SAFE 0 (U1W) vs PM-BANK 1 CURRENT 1 (U2U)” se obtienen valores fuera de lo esperado, no hay continuidad entre los puntos 29-29 y 33-33.\r\n\r\nAl consultar con J.Iñigo se detectan errores  en el nombre de los componentes y en los pines solicitados en la tabla.\r\nSe pausa el ensayo, hasta que se envíe el procedimiento actualizado.	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:18.515574	2021-09-27 18:47:39.001871	\N	0	\N	\N	408	1	2	f	2021-09-13 20:06:18.515574	\N	\N
483	21	48	R5		\N	1	2	\N	1	1	1	1	2021-12-01 14:12:10.015581	2021-12-01 14:32:25.862666	\N	0	\N	\N	483	1	2	f	\N	\N	\N
481	21	48	R3		\N	1	2	\N	1	1	1	1	2021-12-01 14:11:50.486953	2021-12-01 14:33:36.438217	\N	0	\N	\N	481	1	2	f	\N	\N	\N
410	1	2	SBM-NCR-00028	Luego de la verificación por RoD (revisión de los manuales de los equipos), se encontró que algunos componentes del GS-GSE-EM v1.2 no cumplen con la certificación CE. La tabla a continuación muestra el detalle. Los casos "No (TBC)" indican que no se ha encontrado el marcado en la documentación disponible pero debido a que son equipos de distribución internacional se supone que deberían tenerla. En futuras verificación se investigará a mayor profundidad. \r\n\r\n(Ver tabla en reporte de NC adjunto)\r\n\r\nPor otro lado, varios componentes aún no están implementados. Por lo tanto elaborará la RFD/RFW en las siguientes etapas cuando se haya verificado la compatibilidad de todos los componentes. El impacto directo es sobre el cumplimiento del requerimiento L4-GSE-084.	\N	\N	2	\N	3	\N	1	10	2021-09-13 20:06:18.88253	2021-09-27 18:44:20.822671	\N	0	\N	\N	410	1	2	f	\N	\N	\N
412	1	2	SBM-NCR-00026	Se observa que no se encuentran en el almacenamiento de producción del LIE todos los componentes necesarios para realizar la integración completa del assembly “PWR-EM”. \r\n\r\nA continuación, se detallan los componentes faltantes: \r\n\r\n(Ver tabla en reporte de NC adjunto)\r\n	\N	\N	2	\N	3	\N	1	9	2021-09-13 20:06:19.999709	2021-09-27 18:47:39.374171	\N	0	\N	\N	412	1	2	f	\N	\N	\N
414	1	2	SBM-NCR-00002	Telecommand bit rate is limited by software.	\N	\N	4	\N	3	\N	1	6	2021-09-13 20:06:20.411955	2021-09-27 18:44:21.034097	\N	0	\N	\N	414	1	2	f	2021-09-13 20:06:20.411955	\N	\N
417	1	2	SBM-NCR-00000	Corriendo el procedimiento 0965-PMNI-3PCEO-001-A Procedimiento PEM GA1280JS-12.5-OEM-NIR, no se puede enviar comandos al OEM.\r\nSe observa que el OEM toma imágenes correctamente.\r\nEsta actividad es la PEM del OEM posterior a la recepción, previo a realizar ensayos.\r\nCuando se intentó realizar la comunicación serie por primera vez y enviar los comandos hacia la cámara, en algunos casos no respondía y en otros casos la respuesta se obtenía incompleta.	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:21.308586	2021-09-27 18:44:59.482976	\N	0	\N	\N	417	1	2	f	2021-09-13 20:06:21.308586	\N	\N
411	1	2	SBM-NCR-00027	Durante la puesta en marcha de la SBC se detectó que el sub-sistema de alimentación de 2.5 Volt del núcleo del microprocesador UT699 posee una temperatura elevada, fuera de lo previsto.\r\n\r\nPrimeras mediciones: Durante los ensayos de SW en las instalaciones de Balcarce-CABA se realizaron mediciones con una cámara térmica y se encontró un punto caliente en un diodo (designador D6P) de salida del sub-sistema de alimentación. (ver informe power point adjunto al reporte de NC)\r\n\r\n Se identificó que el diodo integrado en la SBC no se correspondía con los diseños, sino que se integró, por algún motivo aún desconocido, un diodo equivalente con otro PN y otro encapsulado. \r\n\r\nEl diodo que correspondía por diseño era el 1N5822U (5106/020/02 510602002) y el integrado es SS34, estos suelen ser remplazos dentro de los diseños comerciales, ya que poseen características similares. \r\n\r\nLos encapsulados de los diodos discrepan y se puede observar que tiene características térmicas disimiles. El diodo por diseño tiene 7 C/W de resistencia térmica a los pads (Rjp) y el integrado tiene 17 C/W de Rjp. Esta discrepancia en las características térmicas es uno de los factores por lo cual se está observando el punto caliente en esta parte. 	\N	\N	2	\N	3	\N	1	7	2021-09-13 20:06:19.819887	2021-09-27 18:47:39.183124	\N	0	\N	\N	411	1	2	f	\N	\N	\N
482	21	48	R4		\N	3	2	\N	1	1	1	1	2021-12-01 14:11:58.267095	2021-12-01 14:33:36.557411	\N	0	\N	\N	482	1	2	f	\N	\N	\N
418	1	2	SBM-NCR-00001	Durante la integración de la TC12 sobre el distanciador de la placa PCB del starter kit, con la punta de la pinza de brusela se toca un componente que está próximo al distanciador sobre la placa PCB del starter kit, los detalles del daño y ubicación del componente se pueden observar en la fotografía adjunta.\r\n\r\nComponente dañado STARTER KIT Numero 3\r\nVer mas detalles en el pdf adjunto.	\N	\N	4	\N	3	\N	1	9	2021-09-13 20:06:21.483102	2021-09-27 18:44:59.654829	\N	0	\N	\N	418	1	2	f	2021-09-13 20:06:21.483102	\N	\N
413	1	2	SBM-NCR-00025	Se observa que no se encuentran en el almacenamiento de producción del LIE todos los componentes necesarios para realizar la integración completa del assembly “COMM-EM”. \r\n\r\nA continuación, se detallan los componentes faltantes: \r\n\r\n(Ver tabla en el reporte de NC adjunto)\r\n\r\nA su vez, se detectaron los siguientes componentes sin conformar: \r\n\r\n(Ver tabla en reporte de NC adjunto)\r\n\r\nPor otra parte, los siguientes componentes no se encuentran en stock, y a su vez deberán conformarse cuando se disponga de ellos:\r\n\r\n(Ver tabla en reporte de NC adjunto)\r\n\r\nPor último, los componentes de bottom no se poblarán por incompatibilidad mecánica con el dispositivo de therm-a-gap (workmanship). Remarcado en procedimiento.\r\n	\N	\N	2	\N	3	\N	1	8	2021-09-13 20:06:20.205397	2021-09-27 18:47:39.538961	\N	0	\N	\N	413	1	2	f	\N	\N	\N
416	1	2	SBM-NCR-00000	El 10 de Mayo se comenzó con el análisis de Test Aliveness de la cámara OEM-NIR.\r\n \r\nSe siguió el procedimiento 0965-PMNI-3PCEO-001-A Procedimiento PEM GA1280JS-12.5-OEM-NIR, hasta el Punto 3.2 Chequeos Iniciales, Paso 7 el cual declara "Apagar la PC y conectar la salida digital de la cámara con el Frame Grabber utilizando el cable Camera Link.".\r\n \r\nEn este punto se encontró que, si bien un extremo del cable Camera Link se podía conectar al Frame grabber el otro no coincidía para conectarlo a la cámara.\r\nPor lo que se investigó el cable Camera Link es MDR-SDR y lo que se precisa es SDR-SDR.	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:21.134536	2021-09-27 18:44:59.280384	\N	0	\N	\N	416	1	2	f	2021-09-13 20:06:21.134536	\N	\N
415	1	2	SBM-NCR-00023	During the final Charge retention test of the FM Sabia-Mar battery, the 7e cell went out of the test criterion of 2.6 mV/day max.\r\nDuring Sabia-Mar FM test campaign, it has been observed a self-discharge increase of the 7e cell after vibrations. It increases up to 3.0 mV/day:\r\n\r\nSEE DOCUMENT ATTACHED.  \r\n\r\nNo significant deviation is observed in capacity and internal resistance	\N	\N	4	\N	3	\N	1	8	2021-09-13 20:06:20.59786	2021-09-27 18:45:49.072817	\N	0	\N	\N	415	1	2	f	2021-09-13 20:06:20.59786	\N	\N
429	1	2	SBM-NCR-00000	Por solicitud del area de Producción del LIE a GIC, se retiran los componentes de un armario que pertenecía a STI, que se encuentra en Sala 100K. \r\n\r\nSe recibe una foto de las platinas para la placa 1553 antes de ser retirados y al comparar la misma  con el material recibido, se observa que faltan unas piezas identificadas como "92 x 8 uni". 	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:24.860268	2021-09-27 18:47:40.515992	\N	0	\N	\N	429	1	2	f	\N	\N	\N
421	1	2	SBM-NCR-00000	El día 6 de Diciembre se recibieron desde CONAE dos maletines.\r\n\r\nResponsable de la recepción inicial: Federico Perazzo;\r\n\r\nUno contenía el sensor&nbsp; OEM SN 1542S9569 y el otro contenía el sensor GA1280JS-12.5 SN 1540S9499.\r\n\r\nSe firmo&nbsp;el Formulario en el momento de la recepción (Ver Foto 1). Se identificó que ninguno de los dos maletines tenían precintos o sensores de shock. (ver Fotos 2 y 3).\r\n\r\nSe pusieron a disposición del servicio de Electroóptica ambos maletines.\r\n\r\n\r\nLos maletines se ingresaron al cuarto previo a ingresarlo al laboratorio de óptica.\r\n\r\nResponsable: Ariel Torazza\r\n\r\nSe revistió la parte interna de los maletines con el fin de poder ingresarlos al cuarto limpio. (Ver Foto 4).\r\n\r\nAl inspeccionar visualmente se ha encontrado sucia la superficie de zafiro de ambos sensores.\r\n\r\nLa suciedad de pelusas se quitó con procedimientos de "soplado" (sin tocar superficie).\r\n\r\nSe ha encontrado sucia la superficie de zafiro de ambos OEMs.\r\n\r\n1) La suciedad de pelusas se quitó con procedimientos de "soplado" (sin tocar superficie). De acuerdo al procedimiento&nbsp;&nbsp;C314-7001-DREEC-001-A. (Ver Foto5)\r\n\r\n2) La suciedad de manchas no se limpiaron (son apenas apreciables a simple vista, solo con luz intensa);(Ver Foto 6)\r\n\r\nSe abrirá una NC para comunicar al cliente del tratamiento de los sensores recibidos.	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:23.028728	2021-09-27 18:45:00.246268	\N	0	\N	\N	421	1	2	f	2021-09-13 20:06:23.028728	\N	\N
423	1	2	SBM-NCR-00018	Durante el ensayo de caracterización de los Magnetómetros ( TAM, Tri-axial Magnetometer)  se encontraron los canales R de los magnetómetros C-0965-002 y C-0965-003, con las bobinas desconectadas.	\N	\N	2	\N	3	\N	1	9	2021-09-13 20:06:23.424265	2021-09-27 18:45:00.644076	\N	0	\N	\N	423	1	2	f	\N	\N	\N
430	1	2	SBM-NCR-00000	Se realiza la inspección de recepción de 11 cajas con placas al proyecto SABIAMAR en el edificio C-05 en el CETT el 08/01 provenientes de Bs. As.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:25.032059	2021-09-27 18:47:40.710371	\N	0	\N	\N	430	1	2	f	\N	\N	\N
431	1	2	SBM-NCR-00000	Se realiza la inspección de recepción de Módulos de Energía pertenecientes al proyecto SABIAMAR en el edificio C-05 en el CETT el 06/01 provenientes de Bs. As.\r\nSe recibe el packing secundario abierto, se observa que posee requerimiento de manipulación con pulsera ESD. \r\nSe desconoce el manipuleo que recibió, no se recibe documentación de los ítems.\r\n\r\n\r\n\r\n	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:25.558841	2021-09-27 18:47:40.925656	\N	0	\N	\N	431	1	2	f	\N	\N	\N
432	1	2	SBM-NCR-00000	Se realiza la inspección de recepción de materiales pertenecientes al proyecto SABIAMAR en el edificio C-01 en el CETT entre el 16/10 y el 31/10 y en el C-05 en el CETT entre el 4/11 y 07/11 provenientes de STI.\r\n- cajas abiertas\r\n- documentacion suelta\r\n- equipos sin identificar\r\n\r\n	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:25.741676	2021-09-27 18:47:41.070691	\N	0	\N	\N	432	1	2	f	\N	\N	\N
433	1	2	SBM-NCR-00000	Durante el ensayo de puesta en marcha reducida del EGSE OBC SABIA Mar, lado A, se detectan las siguientes anomalías en su hardware. (ver reporte de ensayo SBM-GSE-TR-00008-A)	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:25.923902	2021-09-27 18:48:28.532069	\N	0	\N	\N	433	1	2	f	\N	\N	\N
434	1	2	SBM-NCR-00000	Durante el ensayo de puesta en marcha reducida del EGSE OBC SABIA Mar, se detectan las siguientes anomalías en su hardware. (ver reporte de ensayo SBM-GSE-TR-00007-A)	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:26.089328	2021-09-27 18:48:28.700973	\N	0	\N	\N	434	1	2	f	\N	\N	\N
435	1	2	SBM-NCR-00000	Durante el ensayo de puesta en marcha reducido del EGSE  PM OBC Side B  U1200100 se detectan las siguientes anomalías en su Software: Falta de drivers para 1553, se adjunta imagen representativa. (ver reporte de ensayo SBM-GSE-TR-00007-A)	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:26.256049	2021-09-27 18:48:28.866634	\N	0	\N	\N	435	1	2	f	\N	\N	\N
436	1	2	SBM-NCR-00000	Durante la inspección KIP se observa:\r\n\r\nEGSE-H-LA1H-CM-001:  En el conector LATCH 50 en lo pines 2,3,4 y 5 se observa daño en la aislación en zona próxima a la salida del conector.\r\nEGSE-H-LA1E-CM-001: Estado NC Se observan extremos libres crimpados en el conector DB50, cuando la especificación solicita que estén libres en el conector LATCH 50 y la longitud de los extremos libres deberían poseer una longitud de 1000mm y se mide 170 mm. \r\n Se repara el cable de acuerdo a estas observaciones y en una nueva inspección se detecta se observa un derretimiento de la aislación de cableado y se detecta en el conector DB50 hembra el cable azul conectado al pin 33, presenta poco aislante dejando los hilos expuestos en exceso.	\N	\N	4	\N	3	\N	1	1	2021-09-13 20:06:26.907001	2021-09-27 18:48:29.046368	\N	0	\N	\N	436	1	2	f	2021-09-13 20:06:26.907001	\N	\N
427	1	2	SBM-NCR-00003	Al avanzar sobre la confección del procedimiento de poblado del PCB Backplane EM de la PM-OBC EM, se encontró un inconveniente: según la lista de partes, las torretas que se van a integrar son las Keystone 1502-3, en el LIE tenían en stock las 1502-2, que tienen el mismo diámetro de base. Utilizando estas últimas para presentarlas sobre el PCB y se detectó que el diámetro del hueco es demasiado grande, se adjunta la información de las torretas y unas fotos de una de dichas torretas sobre el PCB.	\N	\N	4	\N	3	\N	1	6	2021-09-13 20:06:24.505883	2021-09-27 18:47:40.093756	\N	0	\N	\N	427	1	2	f	2021-09-13 20:06:24.505883	\N	\N
422	1	2	SBM-NCR-00007	Documentación Técnica utilizada: Recepción Interna No 120228 y Orden de compra No 465430 \r\nSe realizó la recepción comercial de lentes del Prototipo NIR-SWIR en dos Etapas: (Se adjunta documento con la descripción en detalle de la recepción con imágenes incluídas.\r\n \r\nPrimera Etapa: Sin apertura de embalaje interno. Se realiza una recepción desde el CC314 con toma fotográfica, basada en la Recepción Interna de INVAP No 120228. \r\n\r\nSegunda Etapa: Con apertura de embalaje interno, en condiciones de contaminación controlada, se realiza la apertura de los ítems recibidos, se coteja el material con el consignado en la orden de compra No 465430 y se realiza una inspección de: \r\n\r\nA. Packaging: cumplimiento de control de contaminación.\r\nB. Estado general: rotura, daños visibles, etc.\r\nC. Cumplimiento de requerimientos básicos:\r\n       i. superficie anterior (F1-lado apertura de entrada) y posterior (F2- lado sensor): coating (Coat.), chips y biseles. En este informe no se verifica (N/V): Radio de Curvatura (RC) y Descentrado (Dec.).\r\n \r\n       ii. Envolvente de la lente: estado general de terminación (Term.) y pintura de recubrimiento negra. En este informe no de verifica (N/V): diámetro (Æ) y thickness (Thick.).\r\n \r\n       iii. Asiento u apoyo: se observó la terminación del esmerilado (Term.) y el estado general. No se tomaron dimensiones (Dim.)\r\n \r\n\r\n \r\n Del trabajo realizado se observó:\r\n  \r\n1)    En todos los casos al abrir el envoltorio nos encontramos con desprendimiento de la pintura negra en forma de partículas, en algunos casos también se observan partículas blancas aparentemente provenientes del desprendimiento del papel del envoltorio. Por lo observado,  pareciera que la adherencia de la pintura al vidrio resulta deficiente.\r\n \r\n2)    En todos los casos los bordes pintados de negro muestran no uniformidad (se observan pinceladas y retoques), burbujas de alrededor de 50 a 200 micrones, algunas explotadas sobre la superficie, generando en algunos casos protuberancias y/o depresiones.\r\n \r\n3)    En la zona del esmerilado se observan las rayas del trabajo de las herramientas de esmeril, en forma visible y pintura negra invadiendo la zona de apoyo, en la mayoría de los casos.\r\n \r\n4)    En algunos casos la pintura negra de los bordes muestra fibras adheridas.\r\n \r\n5)    Elemento 3, habría que volver a inspeccionar para ver si presenta posible defecto de coating \r\n\r\n \r\n \r\nSe destaca que No se observó:\r\n \r\n1) Rotura o quiebre en ningún caso.\r\n2) Superficie de coating deteriorada (excepto Elemento 3, a analizar).	\N	\N	4	\N	3	\N	1	5	2021-09-13 20:06:23.218033	2021-09-27 18:45:00.44052	\N	0	\N	\N	422	1	2	f	2021-09-13 20:06:23.218033	\N	\N
425	1	2	SBM-NCR-00015	Durante los ensayos de verificacion electrica del MIP mientras se ejecutaba el proc "SBM-STI-OBC-PR-00022-A SBC Test Procedure - As Run with Reparation Addenda for EM", especificamente la addenda de reparacion, al medir la continuidad del U1LL se dobla un pin al colocar la punta del multimetro.\r\n\r\nNC Interna LIE: 1800 (ver adjunto)	\N	\N	4	\N	3	\N	1	8	2021-09-13 20:06:23.782766	2021-09-27 18:47:39.721967	\N	0	\N	\N	425	1	2	f	2021-09-13 20:06:23.782766	\N	\N
426	1	2	SBM-NCR-00014	Durante la ejecucion del procedimiento de verificacion "SBM-STI-OBC-PR-00022-A SBC Test Procedure - As Run with Reparation Addenda for EM" durante el MIP de la SBC A EM, la placa se cae del soporte y se golpea contra la mesa doblando las terminaciones del transistor 2N2222 Q2P	\N	\N	4	\N	3	\N	1	8	2021-09-13 20:06:24.329619	2021-09-27 18:47:39.907181	\N	0	\N	\N	426	1	2	f	2021-09-13 20:06:24.329619	\N	\N
449	1	2	SBM-NCR-00000	Se observó en el EGSE S/N 163601002, en el equipo S/N U1204100 Level Adapter lado B ubicado en la sala 100K del LIE, que el LED de indicación de encendido destallaba esporádicamente estando el equipo conectado a la alimentación eléctrica (220V) pero apagado. El destello se apreció aproximadamente una vez por minuto.   	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:30.159121	2021-09-27 18:48:31.492228	\N	0	\N	\N	449	1	2	f	\N	\N	\N
450	1	2	SBM-NCR-00000	Durante los ensayos realizados a partir de la NC SBM-OBC-NC-00003 (fallo de escritura flash), se encontró que la señal WE en algunos de los bancos participantes del bus presentan tensiones transitorias fuera de especificación, según hoja de datos de los integrados de memoria.\r\nEl reporte SBM-VENG-OBC-RP-007014-A muestra capturas de osciloscopio donde se observa que la señal WE de los bancos PATCH y CURRENT sufren un sobrepico negativo inferior al nivel de Vss. El banco SAFE no observa el mismo comportamiento.\r\nEn ensayos subsiguientes se volvió a verificar el mismo tipo de sobrepico negativo. Se muestra a continuación las mediciones efectuadas para verificar el timing entre las señales WE (amarillo) y CE (azul).	\N	\N	2	\N	1	\N	1	1	2021-09-13 20:06:30.331854	2021-09-27 18:48:31.711125	\N	0	\N	\N	450	1	2	f	\N	\N	\N
451	1	2	SBM-NCR-00000	Durante la etapa de carga del Bootloader y la preparación de la ejecución de la tarea SBC Load program Memory with test Software se detectaron fallas en el bootloader proporcionado por CONAE de los repositorios de STI.	\N	\N	2	\N	1	\N	1	1	2021-09-13 20:06:30.867187	2021-09-27 18:48:31.89987	\N	0	\N	\N	451	1	2	f	\N	\N	\N
446	1	2	SBM-NCR-00008	Durante el proceso de practica de soldadura de la SBC EM se detecto un no cumplimiento en el largo de los pines de los conectores cPCI que deberian sobresalir un minimo de 0.7mm y no lo cumplen. El detalle en el reporte adjunto\r\n\r\nPara las placas de 4mm (SBC y COMM) se debe intensificar la inspeccion de los conectores cPCI, modificar el SOW/MAIT acorde	\N	\N	2	\N	3	\N	1	12	2021-09-13 20:06:29.609231	2021-09-27 18:48:30.948458	\N	0	\N	\N	446	1	2	f	\N	\N	\N
384	1	2	SBM-NCR-00032	Ya con los requerimientos de software, tanto de Bootloader como de Basic Software, de nivel L5 verificados en placa SBC EM utilizando la aplicación GRMON como cargador de los aplicativos de test, se procede a realizar los ensayos de verificación y validación de los requerimientos L4 según el Plan de Ensayos [2].\r\nDurante la ejecución del ensayo de performance en Placa SBC EM en las facilidades del LIE, Córdoba, al ejecutar la sección PR-24 del procedimiento [1], en estado de depuración, la ejecución se detiene de forma inesperada interrumpiendo el microcontrolador y perdiendo la salida por consola del aplicativo.\r\nSe observa en consola las primeras salidas esperadas probando desde los tres bancos de memorias Flash, lo cual indica que se logró verificar correctamente el CRC de las 3 imágenes y el estado inicial esperado. (continuar descripción en reporte de NC)	\N	\N	2	\N	2	\N	1	15	2021-09-13 20:06:12.006189	2021-09-27 18:47:34.624013	\N	0	\N	\N	384	1	2	f	\N	\N	\N
447	1	2	SBM-NCR-00006	Debido a diversos errores de diseño en la placa SBC EM se detectaron los siguientes problemas que se debn corregir durante el ensamblado de la misma	\N	\N	2	\N	2	\N	1	15	2021-09-13 20:06:29.784458	2021-09-27 18:48:31.128891	\N	0	\N	\N	447	1	2	f	\N	\N	\N
445	1	2	SBM-NCR-00009	Durante la interaccion para el poblado de la placa SBC EM se observa en el PCB que en la zona de montaje de varios IC que llevan Therm-a-gap para facilitar la conduccion termica (segun mapa "ICs with Conductive Gap Fillers") esta recubierta con mascara soldante verde en lugar de tener el area de cobre despejada lo que empeora la conduccion termica\r\nVer Picture1 como ejemplo\r\n\r\nEn el caso de la IAB EM, solo se detecto este inconveniente para el IC U1B ISL705CRHF	\N	\N	2	\N	3	\N	1	13	2021-09-13 20:06:28.932341	2021-09-27 18:48:30.754374	\N	0	\N	\N	445	1	2	f	\N	\N	\N
448	1	2	SBM-NCR-00005	Durante las inspecciones del Backplane de practica de soldadura se detectaron varias anomalías en el diseño del PCB x la facilidad de Workmanship (LIE) lo que hace imposible el correcto soldado de los componentes para cumplir los Estándar de Wormanship requeridos por el proyecto.\r\nEn el documento adjunto se detallan las anomalías encontradas	\N	\N	2	\N	2	\N	1	15	2021-09-13 20:06:29.967118	2021-09-27 18:48:31.329139	\N	0	\N	\N	448	1	2	f	\N	\N	\N
454	1	2	SBM-NCR-00031	Durante la transición de STI a VENG, no se entregaron los servidores con sus respectivos respoitorios versionados. Con lo que se inició un nuevo repositorio con un snapshot del ultimo estado del respoitorio, perdiendose la trazabilidad del avance de los proyectos de Altium de PCB.  Para impactar las NC de diseño de PCB del modelo de ingeniería a vuelo, se debe asegurar que se impactaran los cambios a partir de la versión fabricada o una versión posterior a los PCB EM enviados a fabricar.	\N	\N	2	\N	3	\N	1	18	2021-09-13 20:06:31.400335	2021-09-27 18:48:32.441146	\N	0	\N	\N	454	1	2	f	\N	\N	\N
452	1	2	SBM-NCR-00000	Durante la etapa de preparación de la Fase 1 de puesta en marcha de la SBC:\r\nCONAE no entregó procedimiento de syntesis de VHDL para la FPGA SBC. CONAE nos pide que lo realicemos nosotros.\r\nSe encontraron errores en el comportamiento (probado en un modelo de desarrollo provispo por VENG) del hardware implementado en VHDL en la FPGA. Dichas fallas no respetan el documento de diseño del VHDL \r\nSBM-STI-OBC-SP-00033-B SBC's FPGA - Architectural Design_r31448\r\n	\N	\N	2	\N	1	\N	1	1	2021-09-13 20:06:31.041565	2021-09-27 18:48:32.072458	\N	0	\N	\N	452	1	2	f	\N	\N	\N
453	1	2	SBM-NCR-00022	Se detecta previo a la realización del test de continuidad de pines memorias flash current / patch (procedimiento SBM-VENG-QAP-LI-00091-SBC-EM?D):\r\n\r\n1.)\tIntegrado U2U:  Leve deformación en pin 18 \r\n2.)\tTorreta J2P: Leve deformación lateral\r\n\r\nDurante la ejecución del test de continuidad:	\N	\N	2	\N	3	\N	1	7	2021-09-13 20:06:31.215104	2021-09-27 18:48:32.260591	\N	0	\N	\N	453	1	2	f	\N	\N	\N
371	1	2	SBM-NCR-00035	%{font-size: 11pt;}During the balancing test of the maintenance of the PFM Sabia-Mar battery, the cell in position 4e went out population and out of self-discharge criteria.%\r\n\r\n%{font-size: 11pt;}On May 9%<notextile></notextile><notextile></notextile>%{font-size: 7pt;}th%<notextile></notextile><notextile></notextile>%{font-size: 11pt;}, 2021, during Sabia-Mar PFM maintenance, it has been observed a self-discharge out of population for the cell in position 4e during balancing test as shown in the following graph:%\r\n\r\n!20210616-173559-380.png!\r\n\r\n%{font-size: 11pt;}The higher self-discharge was noticed at first during the balancing, which is performed at 4.1V/cell. This voltage is higher than the threshold voltage from the SBS, so the self-discharge could have been due to either SBS drift or cell internal self-discharge anomaly. So, the battery was discharge at 3.53V/cell (second part of the graph). This voltage is lower than the threshold voltage of the SBS, therefore the anomaly is necessarily due to the internal self-discharge of the 4e cell.%\r\n\r\n%{font-size: 11pt;}Measurement of the self-discharge at 3.5V/cell average between May 9%<notextile></notextile><notextile></notextile>%{font-size: 7pt;}th%<notextile></notextile> <notextile></notextile>%{font-size: 11pt;}and May 11%<notextile></notextile><notextile></notextile>%{font-size: 7pt;}th%<notextile></notextile> <notextile></notextile>%{font-size: 11pt;}is higher than 40mV/day%<notextile></notextile> <notextile></notextile>%{font-size: 11pt;}(usual criteria is ≤2.6mV).%	\N	\N	2	\N	3	\N	1	8	2021-09-13 20:06:08.944708	2021-09-27 18:45:48.932485	\N	0	\N	\N	371	1	2	f	\N	\N	\N
424	1	2	SBM-NCR-00017	Durante el registro con imágenes de las superficies de las probetas tratadas, se presentó un desprendimiento del recubrimiento de la Probeta #2 (Figura 3), luego de haber obtenido una primera imagen (Figura 2) sin anomalía alguna.\r\n\r\nLas probetas fueron inicialmente retiradas de su envoltorio, inspeccionadas visualmente y dispuestas una por una sobre el escáner, el cual fue previamente limpiado con alcohol isopropilico y paño de papel. Se realizó un primer escaneo de las probetas (Figura 2) con total normalidad. Las probetas fueron posteriormente movidas una por una a un costado de su posición original, con el objetivo de obtener una segunda imagen de mayor calidad. Finalizado el escaneo, se detecta la anomalía en la Probeta #2. Se procedió a realizar una inspección visual de la misma, la cual se evidenció el claro desprendimiento (Figuras 4, 5 y 6). Se resuelve proseguir con la inspección visual de las probetas restantes y regresarlas a su envoltorio original. \r\nSe adjuntan imágenes.\r\n\r\nNota: La Probeta #2 se declara como ACEPTADA en el reporte IN-INN-ARAS-634 emitido por CNEA. Se adjunta reporte.	\N	\N	4	\N	3	\N	1	7	2021-09-13 20:06:23.608284	2021-09-27 18:45:00.869582	\N	0	\N	\N	424	1	2	f	2021-09-13 20:06:23.608284	\N	\N
364	1	2	SBM-NCR-00000	Durante la preparación del EGSe para la realización de los ensayos integración hardware-software se detecta que se induce ruido en algunas señales (O_RX_AGC_LEVEL/O_TX_PA_SECONDARY_VOLTAGE) que corresponden al DUT EWC29.\r\nEsta situación puede generar lecturas erróneas en los canales ASM (analógicos) que van desde los DUTs hasta el módulo NI6255 de National Instruments que realiza la lectura y lo muestra en el EGSE.\r\nEsto ocurre solamente cuando el módulo de hardware Ad hoc está encendido y los canales se encuentran al aire (presentan una alta impedancia), ya que cuando esta pagado el ruido en los canales desaparece.\r\nLa Figura 1 muestra como los canales en cuestión presentan un voltaje superior a los 8V cuando no están conectados.	\N	\N	2	\N	3	\N	1	1	2021-09-13 20:06:06.898873	2021-09-27 18:47:31.677192	\N	0	\N	\N	364	1	2	f	\N	\N	\N
428	1	2	SBM-NCR-00036	Durante la ejecución del ensayo Flash completo (SBM-OBC-TP-00010-A) vinculado a las actividades propuestas en la NC SBM-OBC-NC-00003 Falla de escritura en memorias FLASH, CURRENT Y PATCH se observa una desconexión repentina de GRMON en dos situaciones:\r\na) Fallo de ejecución hello world (desconexión GRMON): \r\nSucedió al correr el binario que contenía el ensayo y también con un ejecutable hello world. Se hizo una revisión del setup que incluyó cambio de pc de soporte y eliminación de la BoB (con pruebas Hello World ante cada cambio). Finalmente se solucionó tras inclinar el bastidor que agarra la SBC unos 30 grados y volverlo a su posición de descanso. \r\nb) Fallo ejecución flash completo (desconexión GRMON): \r\nAl ejecutar el binario del ensayo de flash, se observa que el Hello World funcionaba correctamente. Se hicieron una serie de pasos de debug incorporando marcas printf para logar un trace de la ejecución. Con el solo hecho de agregar estos printf se logró escribir.\r\n4-2-21  Se coordina NRB para analisis entre ingenierias involucradas\r\n	\N	\N	2	\N	3	\N	1	13	2021-09-13 20:06:24.675146	2021-09-27 18:47:40.296971	\N	0	\N	\N	428	1	2	f	\N	\N	\N
374	1	2	SBM-NCR-00000	Se detecta durante el poblado parcial de las placas AVAB_EM_01 y GPIO_EM_01 que hay diferentes medidas de capacitores de tantalio para pads iguales\r\n\r\nA continuación, se presentan los capacitores a analizar:\r\nPlaca AVAB:\r\n\r\n (Tabla en reporte adjunto)\r\n \r\nPlaca GPIO:\r\n\r\nTodos los capacitores citados anteriormente presentan footprint 2711. \r\nObservando el datasheet: \r\n\r\n \r\n \r\n\r\nLa penúltima letra corresponde al “Case Code” que, como se puede ver, implica diferencia de tamaño entre uno y otro. En las placas se detectaron 3 “Case Code” diferentes: F, G y H\r\n\r\n \r\n\r\nEsta diferencia de tamaño no está impactada en los footprints del diseño. A modo de ejemplo, en la AVAB: \r\n\r\nC41J: CWR29MH335KCFB                                                            C4A: CWR29FH107KCHB\r\n    \r\n\r\nA continuación, se muestra cómo quedan los capacitores tamaño H en los footprint G/2711 MD:\r\n\r\n \r\n\r\nA nivel workmanship, cumple con los criterios de aceptación.\r\n\r\n(Tablas, gráficos e imágenes en reporte adjunto)	\N	\N	2	\N	3	\N	1	2	2021-09-13 20:06:09.473686	2021-09-27 18:47:33.001837	\N	0	\N	\N	374	1	2	f	\N	\N	\N
444	1	2	SBM-NCR-00012	h6. Durante la preparación de los procedimientos y setup de puesta en marcha de las placas SBC e IAB de la PM-OBC EM se detectó que el harness de interconexión entre el EGSE y dichas placas no condice con la información de los ICDs:\r\n--El harness de interconexión de las interfaces SpW no está mapeado adecuadamente (ver SBM-AHS-SP-05011-A adjunto)-\r\n--El harness de interconexión de los PPS no está mapeado adecuadamente (ver SBM-AHS-SP-05007-A adjunto)-\r\n--El harness de interconexión de las salidas de ciencia de las cámaras no está mapeado adecuadamente (ver SBM-AHS-SP-0500-8 adjunto).-\r\n--El harness de interconexión de las UARTs de la placa COMM no está mapeado adecuadamente (ver SBM-AHS-SP-05009-A adjunto)-\r\n--El harness de interconexión de alimentación VBus de la placa PWR esta mapeado correctamente, pero se debe prestar atención con los nombres de los Latch Relay en el EGSE (aún no se ha implementado el control en el EGSE), el mapeo debería ser: EGSE Latch 1 => SLV B1 EGSE Latch 2 => MST EGSE Latch 3 => SLV B2.-\r\n--El harness de interconexión de las entradas de V y T analógicas del EGSE cable H5003 no está mapeado adecuadamente, cada par trenzado no está agrupado correctamente Ej: OBC_AVOA_EGSE_AN_SRC_1_O y OBC_AVOA_EGSE_AN_RTRN_1_O son pin 1 y 2 según ICD EGSE y el mapeado del harness pin 1 y 39 es un par y 2 y 3 otro (ver SBM-AHS-SP-00003-D). Esto afecta a la placa AVAB y TAB-\r\n--El harness de interconexión del bus MIL-STD-1553B está incompleto, solo se fabricó el harness para conectar el DUT al coupler, pero la suma total del cables dentro y fuera de la cámara es de 6mtrs lo que está demasiado justo con lo que especifica el estándar 1553, teniendo en cuenta a que pasa pro u DB50 y se desadapta la impedancia y tolerancias no es aceptable, se debe reducir el largo del cable H9009 a la mitad y usar la otra mitad para armar el cable de interconexión entre el EGSE y el coupler. Faltan armar los cables para conectar el Bus Monitor y para conectar coupler con coupler (ver imagen 1553)-- El harness de interconexión entre las I/O y Open Collectore de la placa GPIO y el EGSE está mal para, cruzado y no respeta los pares para las salidas Open Collector y Salidas Bilevel. Idem para las entradas Bilevel en ell SubD 62, con la excepción de las que se conectan a D2 en el EGSE que solo tienen mal el nombre. También está mal el nombre en la planilla de fabricación para los harness que se conectan al PCB GPIO ya que el harness H5006 se conecta a los conectores 1 y 2 de la placa y el H5013 al conector 3. Ver detalles en SBM-AHS-SP-00003-D y SBM-AHS-SP-00007-B Las etiquetas de los harness no coinciden con los archivos de fabricación ni con su destino de conexión, hay que revisarlas y hacerlas coincidir con las tablas de fabricación y con donde se conectan\r\nh3. -Todos los Harness que se conectan al EGSE via DB50, poseen carcasas de plástico. Dichas carcasas se deben reemplazar por carcazas metálicas con las conexiones de las mallas metálicas de los cables a la carcasa. Actualmente se están adquiriendo carcazas metálicas D50000ANT2G Backshell Size 5 - Metallic de Positronic	\N	\N	2	\N	2	\N	1	16	2021-09-13 20:06:28.749754	2021-09-27 18:48:30.550819	\N	0	\N	\N	444	1	2	f	\N	\N	\N
355	1	2	SBM-NCR-00000	No se pudo acceder al GRMON, el UT699 no responde.\r\nDebido a esta anomalía primero se intentó reiniciar la máquina remota y volver a ejecutar el procedimiento. Luego del reinicio, la anomalía continuó, es decir, no fue posible conectarse mediante el GRMON al UT699. Acto seguido, se realizó un apagado y encendido de la SBC y se volvió a intentar el acceso por GRMON. La anomalía continuó, no fue posible conectarse al GRMON\r\nDada esta situación, se procedió a verificar si el Bootloader se estaba ejecutando correctamente al encender la SBC. Para esto se apagó la SBC, se abrió una consola con el CUTECOM y se procedió a encender la SBC.\r\nNo se recibió ningún mensaje por el puerto serie. Llegado este punto, vemos que algo sucede al momento de booteo lo que deja al procesador en un estado de error, imposible de ser accedido mediante el DSU. Se procede a apagar la SBC y encenderla con una combinación de pulsadores ya aplicada anteriormente en GRRasta para poder recuperar la conexión al DSU. Esta maniobra consiste en, manteniendo pulsados los botones de Master Reset y DSU Break, encender la SBC. Una vez encendida la misma, soltar el botón de Master Reset y luego el botón de DSU Break.\r\nHabiendo hecho esta maniobra, se vuelve a intentar la conexión con GRMON y se logra establecer la misma.	\N	\N	2	\N	2	\N	1	1	2021-09-13 20:06:04.614544	2021-09-27 18:49:05.009052	\N	0	\N	\N	355	1	2	f	\N	\N	\N
\.


--
-- Data for Name: journal_details; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.journal_details (id, journal_id, property, prop_key, old_value, value) FROM stdin;
1	1	attachment	1	\N	AC10 SBM-OBC-NC-00086 Orden incorrecto de encendido de fuentes power up SBC EM.docx
2	2	attachment	1	AC10 SBM-OBC-NC-00086 Orden incorrecto de encendido de fuentes power up SBC EM.docx	\N
3	398	dmsf_file	22	\N	SBM-OBC-NC-00004 SBC EM Non Conformance Perdida trazabilidad Proyecto PCB
4	398	dmsf_file	23	\N	SBM-OBC-NC-00004 SBC EM Listado Seguimiento No Conformidad Perdida trazabilidad Proyecto PCB
5	399	attachment	4	\N	NCR PM-OBC EM 3 Backplane EM Workmanship PCB design Problems 19-07-18 (1).doc
6	399	attachment	5	\N	RE  NRB NCs de PCB 20-4-21.msg
7	400	attachment	6	\N	RE  NRB NCs de PCB 20-4-21.msg
8	401	attachment	8	\N	LIE-10K-IT-00002-A_Informe Tecnico_SBC.pdf
9	401	attachment	7	\N	RE  NRB NCs de PCB 20-4-21.msg
10	402	attachment	9	\N	Picture1.jpg
11	402	attachment	10	\N	RE  NRB NCs de PCB 20-4-21.msg
12	403	attachment	12	\N	1553.jpg
13	403	attachment	11	\N	SBM-AHS-SP-00003-D (2).xlsm
14	403	attachment	13	\N	SBM-AHS-SP-00007-B (3).xlsm
15	403	attachment	14	\N	SBM-AHS-SP-05007-A (4).xlsm
16	403	attachment	15	\N	SBM-AHS-SP-05008-A (3).xlsm
17	403	attachment	16	\N	SBM-AHS-SP-05008-A (4).xlsm
18	403	attachment	17	\N	SBM-AHS-SP-05009-A (2).xlsm
19	403	attachment	18	\N	SBM-AHS-SP-05011-A (3).xlsm
20	404	attachment	19	\N	RE  NRB NCs de PCB 20-4-21.msg
21	405	attachment	21	\N	RE  NRB NCs de PCB 20-4-21.msg
22	405	attachment	20	\N	SBM-VENG-OBC-PR-00039-B - Procedimiento de Reparación para IAB EM_r77.pdf
23	406	attachment	23	\N	NC_1794.pdf
24	406	attachment	24	\N	RE  NRB NCs de PCB 20-4-21.msg
25	407	attachment	25	\N	AC6 Manual VPUMP.jpg
26	407	attachment	26	\N	AC6 SBM-OBC-PR-00008-A-Procedimiento_de_programación_FPGA_SBC_EM.xlsx
27	407	attachment	28	\N	AC7 Manual JTAG.jpg
28	407	attachment	27	\N	AC7 P1040834.jpg
29	407	attachment	30	\N	AC7 SBM-OBC-PR-00008-A-Procedimiento_de_programación_FPGA_SBC_EM.xlsx
30	407	attachment	29	\N	DSU_EN.jpg
31	407	attachment	31	\N	LIE-10K_NC 1803.pdf
32	407	attachment	33	\N	Modificacion Interface JTAG FPGA a TODOS los PCBs.jpg
33	407	attachment	32	\N	NC GRMON.png
34	407	attachment	34	\N	NC JTAG 2.jpg
35	408	attachment	35	\N	NC JTAG 3.jpg
36	408	attachment	36	\N	NC JTAG 4.jpg
37	408	attachment	37	\N	NC JTAG.jpg
38	408	attachment	38	\N	RE  NRB NCs de PCB 20-4-21.msg
39	408	attachment	40	\N	reset circuit NC.jpg
40	408	attachment	39	\N	Retrabajo Switch SBC EM.pdf
41	409	attachment	41	\N	SBM-OBC-NC-00026 Listado_Seguimiento_No_Conformidad_Desconexion_GRMON_Ensayo_Flash_completo20201022.xlsx
42	410	attachment	42	\N	image001.jpg
43	410	attachment	43	\N	image002.jpg
44	410	attachment	44	\N	image003.jpg
45	410	attachment	48	\N	image004.jpg
46	410	attachment	45	\N	image005.jpg
47	410	attachment	46	\N	image006.jpg
48	410	attachment	47	\N	image007.jpg
49	410	attachment	49	\N	image008.jpg
50	410	attachment	50	\N	SABIAMAR_Template_Reporte_NCR.docx
51	411	attachment	51	\N	SBM-OBC-NC-00026 Listado_Seguimiento_No_Conformidad_Desconexion_GRMON_Ensayo_Flash_completo20201022.xlsx
52	412	attachment	52	\N	NC_1799.pdf
53	412	attachment	53	\N	NC_1799-1.pdf
54	412	attachment	57	\N	SBM-VNG-OBC-DS-00005-A-Soporte_Mecánico_PCBs_rev64.pdf
55	412	attachment	54	\N	trans.png
56	412	attachment	55	\N	VIS-GRAL.jpg
57	412	attachment	56	\N	VIS-SUP.jpg
58	413	attachment	58	\N	NC_1800.pdf
59	413	attachment	59	\N	pin.png
60	414	attachment	60	\N	20190626 0965E&M0011 Mail Federico Larco Actualización Status.pdf
61	414	attachment	62	\N	20190627 Envío de Probetas_1.jpg
62	414	attachment	61	\N	ME-TRIB-2019-001 NC probetas NCr (1).doc
63	414	attachment	63	\N	NC Coatings - Photos.pdf
64	415	attachment	64	\N	20190626 0965E&M0011 Mail Federico Larco Actualización Status.pdf
65	415	attachment	66	\N	20190627 Envío de Probetas_1.jpg
66	415	attachment	65	\N	ME-TRIB-2019-001 NC probetas NCr (1).doc
67	415	attachment	67	\N	NC Coatings - Photos.pdf
68	416	attachment	68	\N	0- INCIDENTE TAM canal R abierto.pdf
69	416	attachment	69	\N	4- Mail.pdf
70	416	attachment	71	\N	5- TAM 002 Rx.pdf
71	416	attachment	70	\N	6- TAM 003 Rx.pdf
72	416	attachment	72	\N	7- Mail.pdf
73	416	attachment	73	\N	8- NC0965SIE0424.pdf
74	417	attachment	74	\N	8- NC0965SIE0424.pdf
75	418	attachment	75	\N	NCR 0965CT0001.pdf
76	419	attachment	77	\N	S3316-19_Sabia-Mar_Retention test_NCR.pdf
77	419	attachment	76	\N	S3316a19_Sabia-Mar_Retention test_NCR - for CONAE sign.pdf
78	420	attachment	78	\N	SBM-OBC-NC-00032 Faltante de componentes para poblado de placa COMM EM.docx
79	421	attachment	79	\N	SBM-OBC-NC-00033 Faltante de componentes para poblado de placa PWR EM.docx
80	422	attachment	80	\N	ncr SAB-5340.pdf
81	423	attachment	81	\N	ncr SAB-5339.pdf
82	423	attachment	82	\N	Re  Reunion semanal de aseguramiento con GS.msg
83	424	attachment	83	\N	SBM-OBC-NC-00037 No cumplimiento de standars de workmanship, Pin de componente no sobrepasa PCB lado Bottom placa COMM EM.docx
84	424	attachment	84	\N	SBM-OBC-NC-00037 No cumplimiento de standars.docx
85	425	attachment	85	\N	SBM-OBC-NC-00042 Footprint en PCB de tamaño diferente respecto al componente.docx
86	426	attachment	86	\N	Consultas_INVAP_20210422.docx
87	426	attachment	87	\N	RE  SBM-OBC-NC-00031 - NRB#2.msg
88	426	attachment	91	\N	SBM-OBC-NC-00031 -  Datapackage.rar
89	426	attachment	88	\N	SBM-OBC-NC-00031 Falla en la ejecución de SW Aplicativo cargado por el Bootloader (ensayo de desempeño SBC EM).pdf
90	426	attachment	89	\N	SBM-OBC-NC-00042 Footprint en PCB de tamaño diferente respecto al componente.docx
91	426	attachment	90	\N	SWs.zip
96	429	attachment	96	\N	SBM-OBC-NC-00066 Falta de información para colocación de Therm-a-gap y componentes en altura .docx
92	427	attachment	92	\N	NCR PM-OBC EM 2 Backplane EM Wormanship documentation and process Problems 19-07-18 (1).doc
93	428	attachment	93	\N	RE  Therm-a-gap NRB NC SBM-OBC-NC-00066 (1).msg
94	428	attachment	94	\N	RE  Therm-a-gap NRB NC SBM-OBC-NC-00066.msg
95	428	cf	5	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01\r\nSABIA.FS.EM.PM.PM-OBC.A.GPIO_01	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01SABIA.FS.EM.PM.PM-OBC.A.GPIO_01
97	430	attachment	97	\N	SBM-OBC-NC-00052 Platina de alineación para conectores DB con agujeros pequeños AVAB y GPIO.docx
98	430	cf	5	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01\r\nSABIA.FS.EM.PM.PM-OBC.A.GPIO_01	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01SABIA.FS.EM.PM.PM-OBC.A.GPIO_01
99	431	attachment	98	\N	SBM-OBC-NC-00053 Pines de conectores d-SUB no pasan al lado Bottom.docx
100	431	cf	5	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01 \r\nSABIA.FS.EM.PM.PM-OBC.A.GPIO_01	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01 SABIA.FS.EM.PM.PM-OBC.A.GPIO_01
101	432	attachment	99	\N	IMG_20210407_150704309.jpg
102	432	attachment	100	\N	IMG_20210407_150658111.jpg
103	432	attachment	101	\N	IMG_20210407_150726460.jpg
104	432	attachment	104	\N	IMG_20210407_150720999.jpg
105	432	attachment	102	\N	IMG_20210407_151219184_HDR.jpg
106	432	attachment	103	\N	IMG_20210407_151221724.jpg
107	432	attachment	105	\N	IMG_20210407_151223611.jpg
108	432	attachment	106	\N	IMG_20210407_151245704.jpg
109	432	attachment	107	\N	IMG_20210407_151251372_HDR.jpg
110	432	attachment	108	\N	IMG_20210407_150736445.jpg
111	433	attachment	109	\N	IMG_20210407_151330506.jpg
112	433	attachment	110	\N	IMG_20210407_151352936.jpg
113	433	attachment	112	\N	IMG_20210407_151335048.jpg
114	433	attachment	111	\N	IMG_20210408_155305270.jpg
115	433	attachment	114	\N	IMG_20210408_155312605.jpg
116	433	attachment	113	\N	IMG_20210408_155322289.jpg
117	433	attachment	115	\N	IMG_20210408_155444656.jpg
118	433	attachment	116	\N	IMG_20210408_155427143_HDR.jpg
119	433	attachment	117	\N	IMG_20210407_151410119_HDR.jpg
120	433	attachment	118	\N	IMG_20210407_151355810.jpg
121	434	attachment	119	\N	IMG_20210408_155453379.jpg
122	434	attachment	120	\N	IMG_20210408_155510334.jpg
123	434	attachment	121	\N	IMG_20210408_155514864.jpg
124	434	attachment	122	\N	IMG_20210408_155523900.jpg
125	434	attachment	123	\N	IMG_20210408_155532304.jpg
126	434	attachment	127	\N	IMG_20210408_155537953.jpg
127	434	attachment	124	\N	IMG_20210408_155540137.jpg
128	434	attachment	125	\N	IMG_20210408_155546917.jpg
129	434	attachment	126	\N	IMG_20210408_155601586.jpg
130	434	attachment	128	\N	IMG_20210408_155613537.jpg
131	435	attachment	129	\N	SBM-OBC-NC-00053 Pines de conectores d-SUB no pasan al lado Bottom (1).docx
132	435	attachment	130	\N	IMG_20210408_155607850.jpg
133	435	attachment	132	\N	IMG_20210408_155629923.jpg
134	435	attachment	131	\N	IMG_20210408_155633372.jpg
135	435	attachment	133	\N	IMG_20210408_155640694.jpg
136	435	attachment	135	\N	IMG_20210408_155700381.jpg
137	435	attachment	134	\N	IMG_20210408_155642866.jpg
138	436	attachment	136	\N	IMG_20210407_161337589.jpg
139	436	attachment	137	\N	IMG_20210407_161341682.jpg
140	436	attachment	139	\N	IMG_20210407_161353336.jpg
141	436	attachment	138	\N	IMG_20210407_161400577.jpg
142	436	attachment	140	\N	IMG_20210407_161323986.jpg
143	436	attachment	145	\N	IMG_20210407_161406478.jpg
144	436	attachment	141	\N	IMG_20210407_161422228.jpg
145	436	attachment	142	\N	IMG_20210407_161637092.jpg
146	436	attachment	143	\N	IMG_20210407_161642421.jpg
147	436	attachment	144	\N	IMG_20210407_161410400.jpg
148	437	dmsf_file	24	\N	IMG 20210407 161410400
149	437	dmsf_file	25	\N	IMG 20210407 161704651
150	437	dmsf_file	26	\N	IMG 20210407 161710250
151	437	dmsf_file	27	\N	IMG 20210407 161733171
152	437	dmsf_file	28	\N	IMG 20210407 161730452
153	437	dmsf_file	29	\N	IMG 20210408 122820646
154	437	dmsf_file	30	\N	IMG 20210408 122855052
155	437	dmsf_file	31	\N	IMG 20210408 122832506
156	437	dmsf_file	32	\N	IMG 20210408 122857764
157	437	dmsf_file	33	\N	IMG 20210408 122931872 BURST000 COVER
158	438	attachment	156	\N	IMG_20210408_122925424.jpg
159	438	attachment	157	\N	IMG_20210408_122936046.jpg
160	438	attachment	159	\N	IMG_20210408_122957751.jpg
161	438	attachment	158	\N	IMG_20210408_123020030.jpg
162	438	attachment	160	\N	IMG_20210408_123045108.jpg
163	438	attachment	161	\N	IMG_20210408_123053911.jpg
164	438	attachment	162	\N	IMG_20210408_123102421.jpg
165	438	attachment	164	\N	IMG_20210408_123108956.jpg
166	438	attachment	163	\N	IMG_20210408_123026763.jpg
167	439	attachment	165	\N	SBM-OBC-NC-00059 Footprint en PCB de tamaño diferente respecto al componente.docx
168	440	attachment	166	\N	SBM-OBC-NC-00060 Dificultad para soldar capacitor ceramico dentro de valores de temperatura indicados por norma.docx
169	441	attachment	167	\N	SBM-OBC-NC-00062 Desplazamiento de thermagap una vez integrado el componente.docx
170	442	attachment	168	\N	SBM-OBC-NC-00064 Discrepancias entre componentes y footprints.docx
171	442	cf	5	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01\r\nSABIA.FS.EM.PM.PM-OBC.A.GPIO_01	SABIA.FS.EM.PM.PM-OBC.A.AVAB_01SABIA.FS.EM.PM.PM-OBC.A.GPIO_01
172	443	attachment	169	\N	IMG_20210510_112432366_HDR.jpg
173	443	attachment	170	\N	IMG_20210510_112443619.jpg
174	443	attachment	171	\N	IMG_20210510_112446422.jpg
175	443	attachment	172	\N	IMG_20210510_112455676.jpg
176	443	attachment	173	\N	Especificaciones Conformado de Pines.xls
177	443	attachment	175	\N	IMG_20210517_154003205.jpg
178	443	attachment	174	\N	IMG_20210517_154028944.jpg
179	443	attachment	176	\N	IMG_20210517_154311122.jpg
284	508	cf	75	\N	VENG
180	443	attachment	178	\N	IMG_20210517_154329592.jpg
181	443	attachment	177	\N	IMG_20210517_154340487.jpg
182	443	cf	5	SABIA.FS.EM.PM.PM-OBC.A.TAB_01\r\nSABIA.FS.EM.PM.PM-OBC.A.COMM_01	SABIA.FS.EM.PM.PM-OBC.A.TAB_01SABIA.FS.EM.PM.PM-OBC.A.COMM_01
183	444	attachment	180	\N	IMG_20210517_154358454.jpg
184	444	attachment	179	\N	IMG_20210517_154738694.jpg
185	444	attachment	181	\N	IMG_20210517_154744597.jpg
186	444	attachment	182	\N	IMG_20210517_154800471.jpg
187	444	attachment	183	\N	IMG_20210517_154805952.jpg
188	444	attachment	186	\N	IMG_20210517_154809113.jpg
189	444	attachment	184	\N	IMG_20210517_160413489.jpg
190	444	attachment	185	\N	IMG_20210517_160418467.jpg
191	444	attachment	187	\N	IMG_20210517_160424360.jpg
192	444	attachment	188	\N	IMG_20210517_160430619.jpg
193	445	attachment	189	\N	IMG_20210517_160431124.jpg
194	445	attachment	190	\N	IMG_20210517_160441837.jpg
195	445	attachment	191	\N	IMG_20210517_160450475.jpg
196	445	attachment	193	\N	IMG_20210517_160454904.jpg
197	445	attachment	192	\N	IMG_20210518_105747822.jpg
198	445	attachment	196	\N	IMG_20210518_105938667.jpg
199	445	attachment	194	\N	SBM-OBC-NC-00068 Listado de seguimiento de acciones.xlsx
200	445	attachment	195	\N	RE  Invitación  NRB NC diferencias dimensionales altura de conformado componentes (SBM-OBC-NC-00068).msg
201	445	attachment	197	\N	RE  Modificaciones de PCBs por NCs de Poblado.msg
202	445	attachment	198	\N	RE  Modificaciones de PCBs por NCs de Poblado (1).msg
203	446	attachment	199	\N	SBM-OBC-NC-00068 Diferencias dimensionales en altura de componentes.pdf
204	447	attachment	202	\N	20210616-173559-380.png
205	447	attachment	203	\N	S1389-21_Sabia-Mar_Delivery preparation_MoM Signed.pdf
206	447	attachment	205	\N	S1819-21.pdf
207	447	attachment	204	\N	Sabia Mar - PFM battery pack activity progress (138 MB).msg
208	447	dmsf_file	34	\N	S1300-21 CONAE - SABIA MAR - NCR - 4e cell self-discharge
209	447	dmsf_file	35	\N	S1389-21 Sabia-Mar Delivery preparation MoM Signed
210	448	attachment	206	\N	20210804-102619-217.png
211	448	attachment	207	\N	Historial NC SBM-NCR-00037 v210818.docx
212	448	dmsf_file	36	\N	Especificación de requerimientos y compliance matrix
213	448	dmsf_file	37	\N	Informacion técnica adicional
214	448	dmsf_file	38	\N	selección del actuador de Moog
215	449	attachment	212	\N	AC10 SBM-OBC-NC-00086 Orden incorrecto de encendido de fuentes power up SBC EM.docx
216	449	dmsf_file	39	\N	SBM-OBC-NC-00086 Orden incorrecto de encendido de fuentes power up SBC EM
217	450	attachment	213	\N	SBM-OBC-NC-00004 SBC EM Non_Conformance_Perdida_trazabilidad_Proyecto_PCB.docx
218	450	attachment	214	\N	SBM-OBC-NC-00004 SBC_EM_Listado_Seguimiento_No_Conformidad_Perdida_trazabilidad_Proyecto_PCB.xlsx
219	451	attachment	215	\N	SBM-OBC-NC-00028 diodo caliente SBC.docx
220	452	attachment	216	\N	LIE-10K_NC 1791.pdf
221	453	attachment	89	SBM-OBC-NC-00042 Footprint en PCB de tamaño diferente respecto al componente.docx	\N
222	454	attachment	217	\N	SBM-OBC-RP-00090-A FALLA DE CARGA DE APLICATIVO EN MODO NOMINAL - SBC.pdf
223	455	attachment	51	SBM-OBC-NC-00026 Listado_Seguimiento_No_Conformidad_Desconexion_GRMON_Ensayo_Flash_completo20201022.xlsx	\N
224	456	attachment	66	20190627 Envío de Probetas_1.jpg	\N
225	457	attachment	67	NC Coatings - Photos.pdf	\N
226	458	attachment	64	20190626 0965E&M0011 Mail Federico Larco Actualización Status.pdf	\N
227	459	attachment	65	ME-TRIB-2019-001 NC probetas NCr (1).doc	\N
228	460	attachment	218	\N	IMG_20210517_154729844.jpg
229	461	attachment	219	\N	IMG_20210408_155457070.jpg
230	462	attachment	220	\N	IMG_20210407_161704651.jpg
231	462	attachment	221	\N	IMG_20210407_161710250.jpg
232	462	attachment	223	\N	IMG_20210407_161733171.jpg
233	462	attachment	222	\N	IMG_20210407_161730452.jpg
234	462	attachment	224	\N	IMG_20210408_122820646.jpg
235	462	attachment	226	\N	IMG_20210408_122855052.jpg
236	462	attachment	225	\N	IMG_20210408_122832506.jpg
237	462	attachment	227	\N	IMG_20210408_122857764.jpg
238	462	attachment	228	\N	IMG_20210408_122931872_BURST000_COVER.jpg
239	463	cf	75	\N	ASCENTIO
240	464	cf	75	\N	ASCENTIO
241	465	cf	75	\N	ASCENTIO
242	466	cf	75	\N	CNEA
243	467	cf	75	\N	INVAP
244	468	cf	75	\N	INVAP
245	469	cf	75	\N	INVAP
246	470	cf	75	\N	INVAP
247	471	cf	75	\N	INVAP
248	472	cf	75	\N	INVAP
249	473	cf	75	\N	INVAP
250	474	cf	75	\N	INVAP
251	475	cf	75	\N	INVAP
252	476	cf	75	\N	INVAP
253	477	cf	75	\N	INVAP
254	478	cf	75	\N	INVAP
255	479	cf	75	\N	MOOG
256	480	cf	75	\N	SAFT
257	481	cf	75	\N	SAFT
258	482	cf	75	\N	VENG
259	483	cf	75	\N	VENG
260	484	cf	75	\N	VENG
261	485	cf	75	\N	VENG
262	486	cf	75	\N	VENG
263	487	cf	75	\N	VENG
264	488	cf	75	\N	VENG
265	489	cf	75	\N	VENG
266	490	cf	75	\N	VENG
267	491	cf	75	\N	VENG
268	492	cf	75	\N	VENG
269	493	cf	75	\N	VENG
270	494	cf	75	\N	VENG
271	495	cf	75	\N	VENG
272	496	cf	75	\N	VENG
273	497	cf	75	\N	VENG
274	498	cf	75	\N	VENG
275	499	cf	75	\N	VENG
276	500	cf	75	\N	VENG
277	501	cf	75	\N	VENG
278	502	cf	75	\N	VENG
279	503	cf	75	\N	VENG
280	504	cf	75	\N	VENG
281	505	cf	75	\N	VENG
282	506	cf	75	\N	VENG
283	507	cf	75	\N	VENG
285	509	cf	75	\N	VENG
286	510	cf	75	\N	VENG
287	511	cf	75	\N	VENG
288	512	cf	75	\N	VENG
289	513	cf	75	\N	VENG
290	514	cf	75	\N	VENG
291	515	cf	75	\N	VENG
292	516	cf	75	\N	VENG
293	517	cf	75	\N	VENG
294	518	cf	75	\N	VENG
295	519	cf	75	\N	VENG
296	520	cf	75	\N	VENG
297	521	cf	75	\N	VENG
298	522	cf	75	\N	VENG
299	523	cf	75	\N	VENG
300	524	cf	75	\N	VENG
301	525	cf	75	\N	VENG
302	526	cf	75	\N	VENG
303	527	cf	75	\N	VENG
304	528	cf	75	\N	VENG
305	529	cf	75	\N	VENG
306	530	cf	75	\N	VENG
307	531	cf	75	\N	VENG
308	532	cf	75	\N	VENG
309	533	cf	75	\N	VENG
310	534	cf	75	\N	VENG
311	535	cf	75	\N	VENG
312	536	cf	75	\N	VENG
313	537	cf	75	\N	VENG
314	538	cf	75	\N	VENG
315	539	cf	75	\N	VENG
316	540	cf	75	\N	VENG
317	541	cf	75	\N	VENG
318	542	cf	75	\N	VENG
319	543	cf	75	\N	VENG
320	544	cf	75	\N	VENG
321	545	cf	75	\N	VENG
322	546	cf	75	\N	VENG
323	547	cf	75	\N	VENG
324	548	cf	75	\N	VENG
325	549	cf	75	\N	VENG
326	550	cf	75	\N	VENG
327	551	cf	75	\N	VENG
328	552	cf	75	\N	VENG
329	553	cf	75	\N	VENG
330	554	cf	75	\N	VENG
331	555	cf	75	\N	VENG
332	556	cf	75	\N	VENG
333	557	cf	75	\N	VENG
334	558	cf	75	\N	VENG
335	559	cf	75	\N	VENG
336	560	cf	75	\N	VENG
337	561	cf	75	\N	VENG
338	562	cf	75	\N	VENG
339	563	cf	75	\N	VENG
340	564	cf	75	\N	VENG
341	565	cf	75	\N	VENG
342	566	cf	75	\N	VENG
343	567	cf	75	\N	VENG
344	568	cf	75	\N	VENG
345	569	cf	75	\N	VENG
346	570	cf	75	\N	VENG
347	571	cf	75	\N	VENG
348	572	cf	75	\N	VENG
349	573	cf	75	\N	VENG
350	574	cf	75	\N	VENG
351	575	cf	75	\N	VENG
352	576	cf	75	\N	VENG
353	577	cf	75	\N	VENG
354	578	cf	75	\N	VENG
355	579	cf	75	\N	VENG
356	580	cf	75	\N	VENG
357	581	cf	75	\N	VENG
358	582	cf	75	\N	VENG
359	583	cf	75	\N	VENG
360	584	cf	75	\N	VENG
361	585	relation	duplicates	\N	455
362	586	relation	duplicated	\N	456
363	587	relation	duplicates	\N	452
364	588	relation	duplicated	\N	456
365	589	relation	duplicates	452	\N
366	590	relation	duplicated	456	\N
367	591	relation	duplicates	455	\N
368	592	relation	duplicated	456	\N
369	593	relation	relates	\N	458
371	595	relation	relates	458	\N
373	597	relation	relates	\N	458
375	599	relation	relates	458	\N
379	603	relation	relates	\N	458
383	607	relation	copied_to	\N	470
384	608	relation	copied_from	\N	469
385	609	attr	status_id	25	1
386	610	attr	status_id	25	1
387	611	attr	status_id	25	1
388	612	attr	status_id	25	1
389	613	attr	status_id	25	1
390	614	attr	status_id	25	1
391	615	attr	status_id	25	1
392	616	attr	status_id	25	1
393	617	attr	status_id	25	1
394	618	attr	status_id	25	1
395	619	attr	status_id	25	1
396	620	attr	status_id	25	1
397	621	attr	status_id	25	1
398	622	attr	status_id	25	1
399	623	attr	status_id	25	1
400	624	attr	status_id	25	1
401	625	attr	status_id	1	10
402	626	attr	status_id	1	10
403	627	attr	status_id	1	10
404	628	attr	status_id	1	10
405	629	attr	status_id	1	10
406	630	attr	status_id	1	10
407	631	attr	status_id	1	10
408	632	attr	status_id	1	10
409	633	attr	status_id	1	10
410	634	attr	status_id	1	10
411	635	attr	status_id	1	10
412	636	attr	status_id	1	10
413	637	attr	status_id	1	10
414	638	attr	status_id	1	10
415	639	attr	status_id	1	10
416	640	attr	status_id	1	10
417	641	attr	category_id	\N	1
418	642	attr	subject	R!	R1
419	642	cf	159		Flight Segment
420	643	relation	copied_to	\N	480
421	644	relation	copied_from	\N	479
422	645	attr	fixed_version_id	\N	1
423	646	attr	fixed_version_id	\N	1
424	647	attr	fixed_version_id	\N	1
425	648	attr	fixed_version_id	\N	1
426	649	dmsf_file	3	\N	SB-010100-LI-00100-B SABIA-Mar 1 WORK BREAKDOWN STRUCTURE
427	650	dmsf_file	50	\N	SB1-G-SUM-D-D01-025 v1.1 ManualdeUsuarioX-BandDownloader-v1.1
458	664	attr	parent_id	\N	508
461	665	attr	parent_id	\N	508
435	656	attr	parent_id	\N	506
436	656	cf	164	\nThis WP includes the following tasks:\nCoordinate and generate the consensus on the detailed plan (resources, schedule, tasks definition) for the Preliminary Design Phase;\nConfirm technical solution for the system and operations concept and their feasibility with respect to programmatic constraints;\nDefine the Project Management Plan and auxiliary plans;\nGenerate the WBS and and organize it into a structure showing the hierarchical work packages breakdown;\nCoordinate the preparation of Product Tree;\nMonitoring and control of the program;\n\n	This WP includes the following tasks:Coordinate and generate the consensus on the detailed plan (resources, schedule, tasks definition) for the Preliminary Design Phase;Confirm technical solution for the system and operations concept and their feasibility with respect to programmatic constraints;Define the Project Management Plan and auxiliary plans;Generate the WBS and and organize it into a structure showing the hierarchical work packages breakdown;Coordinate the preparation of Product Tree;Monitoring and control of the program;
437	656	cf	165	\nMission Concept and Feasibility Phase\nSABIA-Mar Model Philosophy Plan\nSABIA-Mar Work Breakdown Structure\nProject Management Plan\n\n\n	Mission Concept and Feasibility PhaseSABIA-Mar Model Philosophy PlanSABIA-Mar Work Breakdown StructureProject Management Plan
438	657	attr	parent_id	\N	506
439	657	cf	164	\nThis WP includes the following tasks:\nVerify and control Mission Requirements as well as constraints.\nRefine Project Planning in all levels in the customer-supplier chain.\nConfirm the Mission Statement.\nVerify availability to develop new technologies.\nDefine communication and reporting tools.\n	This WP includes the following tasks:Verify and control Mission Requirements as well as constraints.Refine Project Planning in all levels in the customer-supplier chain.Confirm the Mission Statement.Verify availability to develop new technologies.Define communication and reporting tools.
440	657	cf	165	SABIA-Mar Sattfing Plan\nSABIA-Mar Descope Plan\nSABIA-Mar Mission Reports 	SABIA-Mar Sattfing PlanSABIA-Mar Descope PlanSABIA-Mar Mission Reports 
441	658	attr	parent_id	\N	506
442	658	cf	164	\nThis WP includes the following tasks:\nDevelop and control the Risk Management Plan.\nIdentify Risks and monitoring them.\nPlan Risk Responses.\nPerform Quality Risk Analysis.\n	This WP includes the following tasks:Develop and control the Risk Management Plan.Identify Risks and monitoring them.Plan Risk Responses.Perform Quality Risk Analysis.
443	658	cf	165	Risk Management Plan \nCritical Items List	Risk Management Plan Critical Items List
444	659	attr	parent_id	\N	506
445	659	cf	164	This WP includes generate  and organize the reviews milestone that will be conducted during the mission lifecycle acording to the SABIA- Mar Mission Review Plan\n	This WP includes generate  and organize the reviews milestone that will be conducted during the mission lifecycle acording to the SABIA- Mar Mission Review Plan
446	659	cf	165	Phase A Final Report\nPhase B Final Report\nPhase C Final Report\nPhase D Final Report 	Phase A Final ReportPhase B Final ReportPhase C Final ReportPhase D Final Report 
447	660	attr	parent_id	\N	507
448	660	cf	164	This WP includes the following tasks:\nCoordinate all Work Packages of the System Engineering branch.\nManage and Control System Engineering meetings and approve proposed alternatives of implementation of each equipment/assembly.\nUpdate design definition for the selected system.\nPrepare the next level specification.\nInitiate development work on critical technologies to reduce the development risks.\nPrepare technical requirements at system level\nPrepare interface requirements at system and subsystems level\nEstablish high level function, product and specification trees	This WP includes the following tasks:Coordinate all Work Packages of the System Engineering branch.Manage and Control System Engineering meetings and approve proposed alternatives of implementation of each equipment/assembly.Update design definition for the selected system.Prepare the next level specification.Initiate development work on critical technologies to reduce the development risks.Prepare technical requirements at system levelPrepare interface requirements at system and subsystems levelEstablish high level function, product and specification trees
449	660	cf	165	SABIA-Mar L2B Mission System Requirement\nSABIA- Mar L2B Environmental Requirement \nSABIA-Mar Mission Requirement Management\nSABIA-Mar Technical Resources Management Plan\nSABIA-Mar System Engineering Plan\nSystem Technical Requirements Specification\nInterface Requirements Document\nFunction, Product and Specification Trees\n	SABIA-Mar L2B Mission System RequirementSABIA- Mar L2B Environmental Requirement SABIA-Mar Mission Requirement ManagementSABIA-Mar Technical Resources Management PlanSABIA-Mar System Engineering PlanSystem Technical Requirements SpecificationInterface Requirements DocumentFunction, Product and Specification Trees
450	661	attr	parent_id	\N	507
451	661	cf	164	This WP includes the following tasks:\nRefine orbit analyses\nRefine analyses for the data generation of each instrument on-board\nRefine analyses for the required on-board storage capability and data downlink requirements.\nUpdate RF contacts\nGenerate the Mission Plan\n	This WP includes the following tasks:Refine orbit analysesRefine analyses for the data generation of each instrument on-boardRefine analyses for the required on-board storage capability and data downlink requirements.Update RF contactsGenerate the Mission Plan
452	661	cf	165	SABIA-Mar Mission Plan\nSABIA-Mar Mission Analisys and Scenarios\nSABIA-Mar Collision Avoidance Plan\nSABIA-Mar Orbit Determination and Maintenance Plan	SABIA-Mar Mission PlanSABIA-Mar Mission Analisys and ScenariosSABIA-Mar Collision Avoidance PlanSABIA-Mar Orbit Determination and Maintenance Plan
453	662	attr	parent_id	\N	507
454	662	cf	164	Generate the specifications that must be met by the Mission's SW providers, including\nSoftware management requirements\nGeneral software requirements\nSoftware validation and verification requirements\nSoftware maintenance requirements	Generate the specifications that must be met by the Mission's SW providers, includingSoftware management requirementsGeneral software requirementsSoftware validation and verification requirementsSoftware maintenance requirements
455	663	attr	parent_id	\N	507
456	663	cf	164	This WP includes the following tasks:\nApply logical decomposition\nAllocate requirements and establish traceability\nDefine V&V plan\nAnalyze and maintain the architecture\nIdentify interfaces and interactions between systemelements (including human elements of the system) and with external and enabling system	This WP includes the following tasks:Apply logical decompositionAllocate requirements and establish traceabilityDefine V&V planAnalyze and maintain the architectureIdentify interfaces and interactions between systemelements (including human elements of the system) and with external and enabling system
457	663	cf	165	Mission Verification and Validation Plan\nSABIA-Mar Interface Control Document\nSABIA EMC Control Plan	Mission Verification and Validation PlanSABIA-Mar Interface Control DocumentSABIA EMC Control Plan
459	664	cf	164	This WP Includes the following tasks:\nGenerate and Execute the Mission Assurance Plan including operations activities.\nControl the organizational structure of the SABIA-Mar project.\nDefine the "SPARD Requirements Verification Plan". (See Verification Matrix)\nReview, approve and control the execution of the "PA Implementation Plan" (all contractors).\nCoordinate SMA activities for SABIA-Mar reviews.\nCoordination meeting with the different PA of the project suppliers.\nConduct monthly (or as necessary) team telecom to assess significant assurance issues. Regulate inter-supplier and customer-supplier communications.	This WP Includes the following tasks:Generate and Execute the Mission Assurance Plan including operations activities.Control the organizational structure of the SABIA-Mar project.Define the "SPARD Requirements Verification Plan". (See Verification Matrix)Review, approve and control the execution of the "PA Implementation Plan" (all contractors).Coordinate SMA activities for SABIA-Mar reviews.Coordination meeting with the different PA of the project suppliers.Conduct monthly (or as necessary) team telecom to assess significant assurance issues. Regulate inter-supplier and customer-supplier communications.
460	664	cf	165	SABIA-Mar L2B Safety And Mission Assurance Requirements\nSABIA-Mar Mission Assurance Plan\nSABIA-Mar Review Plan\n\n	SABIA-Mar L2B Safety And Mission Assurance RequirementsSABIA-Mar Mission Assurance PlanSABIA-Mar Review Plan
463	666	attr	parent_id	\N	508
464	666	cf	164	\nProvide support in all stages of the project to ensure compliance with the requirements defined in the SABIAMAR Environmental Requirements Document (ERD).\n	Provide support in all stages of the project to ensure compliance with the requirements defined in the SABIAMAR Environmental Requirements Document (ERD).
467	668	attr	parent_id	\N	508
468	668	cf	164	\nProvide support in electrical, electronic and electromechanical (EEE) parts engineering to internal project agents (CONAE) and contractors. Its activities include the validation of the reception, inspection, storage and management processes of EEE parts to the project, whether carried out by CONAE or in the facilities of the contractors / suppliers; define and manage the process of analyzing the use of non-standard EEE parts (NSEPAR); participate and coordinate the MRBs related to materials, EEE parts and processes; provide support for the selection and purchase of EEE parts, materials, equipment, etc; verify compliance with the related requirements.\n	Provide support in electrical, electronic and electromechanical (EEE) parts engineering to internal project agents (CONAE) and contractors. Its activities include the validation of the reception, inspection, storage and management processes of EEE parts to the project, whether carried out by CONAE or in the facilities of the contractors / suppliers; define and manage the process of analyzing the use of non-standard EEE parts (NSEPAR); participate and coordinate the MRBs related to materials, EEE parts and processes; provide support for the selection and purchase of EEE parts, materials, equipment, etc; verify compliance with the related requirements.
469	668	cf	165	SABIAMAR Materials and processes Control Plan\nSABIAMAR EEE Part Control Plan\nNon Standart EEE Parts Evaluated List (TBC)\nNon Standart EEE Parts Aprobal Request Forms	SABIAMAR Materials and processes Control PlanSABIAMAR EEE Part Control PlanNon Standart EEE Parts Evaluated List (TBC)Non Standart EEE Parts Aprobal Request Forms
472	670	attr	parent_id	\N	508
462	665	cf	164	\nProvide spacecraft and payload systems safety engineering to the project. Includes monitoring subcontractors and payload providers; launch campaign; system safety facility surveys; etc.. Products include initial and follow-on hazard analysis for the SABIAMAR Spacecraft and payloads.\n	Provide spacecraft and payload systems safety engineering to the project. Includes monitoring subcontractors and payload providers; launch campaign; system safety facility surveys; etc.. Products include initial and follow-on hazard analysis for the SABIAMAR Spacecraft and payloads.
465	667	attr	parent_id	\N	508
466	667	cf	165	Single Failure Point Lists\nSABIAMAR Reliability Plan\nSABIAMAR Reliability Matrix	Single Failure Point ListsSABIAMAR Reliability PlanSABIAMAR Reliability Matrix
470	669	attr	parent_id	\N	508
471	669	cf	164	\nDefine, implement and control the execution of the Contamination Control Plan for the SABIA-MAR mission, either in-house, in the facilities of the contractors or in the instrument providers, in order to ensure that through its implementation SABIA- Mar1 Satellite will complete its mission without degradation produced by contamination.\n	Define, implement and control the execution of the Contamination Control Plan for the SABIA-MAR mission, either in-house, in the facilities of the contractors or in the instrument providers, in order to ensure that through its implementation SABIA- Mar1 Satellite will complete its mission without degradation produced by contamination.
473	671	attr	parent_id	\N	508
474	671	cf	164	\nEnsure operations staff follow proper processes and procedures during operations phase, Include pre-launch preparation activities, and trainning support from operations assurance manager. Includes activities such as:\nDefine and manage the continuous improvement process for the SABIAMAR mission.\n	Ensure operations staff follow proper processes and procedures during operations phase, Include pre-launch preparation activities, and trainning support from operations assurance manager. Includes activities such as:Define and manage the continuous improvement process for the SABIAMAR mission.
475	672	cf	164	This WP includes the following tasks:\nConfirm the entire project life cycle cost and schedule.\nDetermine Budget.\nControl cost and schedule\nBuild a data base with estimates of cost for each subsystem, instrument, assembly, as result of the heritage from previous satellite missions developed in each country.\nDefine and update the Project Integrated Schedule.\n\n	This WP includes the following tasks:Confirm the entire project life cycle cost and schedule.Determine Budget.Control cost and scheduleBuild a data base with estimates of cost for each subsystem, instrument, assembly, as result of the heritage from previous satellite missions developed in each country.Define and update the Project Integrated Schedule.
476	672	cf	165	Mission Cost Evaluation\nBudget update\nIntegrated Project Schedule	Mission Cost EvaluationBudget updateIntegrated Project Schedule
477	672	dmsf_file	51	\N	cost & schedule
478	673	relation	relates	\N	513
479	674	relation	relates	\N	457
480	675	dmsf_file	51	\N	cost & schedule
481	676	relation	relates	\N	513
482	677	relation	relates	\N	451
483	678	attr	project_id	63	69
484	679	attr	project_id	63	69
485	680	attr	project_id	63	69
\.


--
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) FROM stdin;
1	366	Issue	1		2021-09-22 14:42:35.571516	f
2	366	Issue	1		2021-09-22 14:43:14.567554	f
3	455	Issue	1	Se siguen las acciones del AC#10 en esta NC\r\n\r\nNotas de Damian Fernandez del 5-8-2021 al respecto\r\n\r\nCOM_DAM: OK para el cierre. Continuar seguimiento en la NC SBM-OBC-NC-00086 para cumplir con lo solicitado en la AC10: “se mantiene abierta mientras se siga trabajando con alimentación externa en el modelo EM para asegurar la implementación en los próximos procedimientos”.\r\n\r\nExportar Reporte de la AC#10 junto a todos los documentos adjuntos de la UAM y subirlos a Redmine explicando que se continua el seguimiento desde la NC.	2021-09-22 20:25:37.812985	f
4	367	Issue	1	Los puntos de la especificación no cumplidos son los:\r\n\r\n3.3.1-ID4.4. Quasi-Static Accel. :\r\n(Non-Operating; any direction)\r\n70 g\r\n\r\n3.3.1-ID6. Random Vibration Qualification\r\nLevel\r\n(Non-Operating; any direction)\r\n16.8 g rms\r\nSee note 2\r\n\r\n3.3.1-ID7. Shock (Non-Operating; any\r\ndirection) :\r\n\r\n!20210804-102619-217.png!	2021-09-22 20:25:41.904491	f
5	455	Issue	1	None	2021-09-22 20:25:53.151561	f
6	455	Issue	1	None	2021-09-22 20:25:53.617785	f
7	455	Issue	1	None	2021-09-22 20:25:54.013654	f
8	455	Issue	1	NRB 06/04/21: (N.balbi / M.Ferrer/M.Alvarez Bocco)\r\nUna vez finalizada la soldadura desde el Bottom, inspeccionar el Top y, en caso de ser necesario, realizar aporte de soldadura del lado Top, completando la soldadura. Autorizado por Nicolás Balbi – PM SABIA-Mar VENG.\r\nAplica a todas las placas de producción EM.\r\n\r\nNRB 11/05/2021: CONAE: A.Ambrosino, A.Alvarez, D.Fernandez   y VENG: N.Balbi, M.Ferrer, M.Toledo, M.Alvarez Bocco)\r\nEn instancia EM:\r\nA.I. 1) Realizar estudio de Rx de como queda la soldadura de las torretas al realizar la integración de las mismas, con aporte de estaño del lado bottom inicialmente y top finalmente. (M.Ferrer)\r\nA.I. 2) Analizar los dos métodos de integración que se estan probando en esta etapa, soldar del lado bottom y lado top y el de soldar del lado bottom con dos soldadores en simultáneo para determinar cual es el mas efectivo para su aplicación. (M.Ferrer)\r\n\r\nNRB 03/06/2021:  A.Alvarez, D.Fernandez   y VENG: N.Balbi, M.Ferrer, M.Toledo, M.Alvarez Bocco\r\nSe actualiza A.I 1) Realizar estudio de Rx de cómo queda la soldadura de las torretas al realizar la integración de las mismas bajo ambos métodos descritos en AI 2. (M.Ferrer)	2021-09-22 20:25:54.53333	f
9	455	Issue	1	None	2021-09-22 20:25:55.105501	f
10	455	Issue	1	None	2021-09-22 20:25:55.750327	f
11	455	Issue	1	NRB 21/05/2021 (M.Toledo – M.Ferrer – M.Alvarez): por el tipo de deformación que presentan los pines, se los acomoda con una brusela, previo a su integración.\r\n\r\n03/06/2021: (D.Fernandez, A.Alvarez, A.Ambrosino, M.Ferrer, N.Balbi, M.Alvarez Bocco) se presenta la NC al proyecto (CONAE) para que tenga conocimiento y se tengan en cuenta todos estos factores al momento de realizar un nuevo pedido de conformado a INVAP.\r\n	2021-09-22 20:25:57.159335	f
12	455	Issue	1	None	2021-09-22 20:25:58.309558	f
13	455	Issue	1	None	2021-09-22 20:25:58.890733	f
14	455	Issue	1	None	2021-09-22 20:26:02.32237	f
15	371	Issue	1	None	2021-09-22 20:26:04.423704	f
16	371	Issue	1	None	2021-09-22 20:26:05.424592	f
17	372	Issue	1	NRB 21/05/2021 (N.Balbi – M.Ferrer – M.Alvarez): se define no integrar estos componentes hasta que no se analice y defina junto al proyecto los pasos a seguir.\r\n\r\nNRB 27/05/2021 (P.Ordoñez - D.Fernandez - A.Alvarez - N.Balbi – J.Santarelli - M.Ferrer – M.Alvarez Bocco):\r\n\r\n- Sobre la NC se deberá realizar un Analisis, evaluar alternativas, definir soluciones propuestas y un plan de implementación.\r\n- AI#1 - Revisar en que otras placas tenemos este mismo componente. Enviar información a Manuel y calidad conae. (N.Balbi)\r\n27/05/2021: CUMPLIDO. N.Balbi envía correo con el análisis realizado.\r\n- AI#2 - Abrir no conformidad Mayor e ir adjuntando información. Registrar las acciones y comentarios de este primer NRB. Vincular la NC a todas las placas afectadas según AI#1. (M.Alvarez Bocco)\r\n27/05/2021: CUMPLIDO. M.Alvarez genera la NC “SBM-OBC-NC-00071” incluyendo en el alcance a la placa PWR.\r\n- AI#3 - Compartir Analisis y Reportes de Calificación de SAOCOM para tomar como referencia. (J.Santarelli)\r\n27/05/2021: J.Santarelli envía por correo documentación perteneciente a la NC que se realizó en SAOCOM\r\n- AI#4 –Adjuntar a la NC los datasheets para evaluar diferencias entre el Part Number SAOCOM y Part Number SABIA-Mar. (Veng/CoNAE)\r\n27/05/2021: N.Balbi envía por correo los datasheet de los mosfets utilizadso en SABIA. (Datasheet JANSR2N7422U.pdf y Datasheet JANSR2N7587U3.pdf)\r\nPara el Modelo EM:\r\n- AI#5 Avanzar con el poblado del modelo EM. Poblar al menos un MOSFET con la implementación del CU Ribbon de SAOCOM. Seleccionar el/los componentes para el peor caso de dificultad desde el punto de vista de workmanship. (VENG)\r\n31/05/2021: M.Ferrer informa que se reanudan las tareas de integración de los mosfet en la placa TCB\r\nPara el modelo FM\r\n- AI#6 - Especialistas de PCBs. Ir evaluando modificación del PAD para opciones de carrier y de CU ribbon. Evaluar la dificultad de ampliar el pad del Mosfet. Marcos dimensionar el corrimiento e involucrar a Stephan diseñador de PCBs. (M.Ferrer)\r\n- AI#7 - Revisar Stock de CU Ribbon, Mosfets (144) y placas para hacer probetas. Revisar si existe stock de SMD carrier Assembly/chapitas equivalentes y placas EM de SABIA-Mar. (M.Ferrer)\r\n27/05/2021: M.Ferrer envía correo con la información solicitada.\r\n- AI#8 - Evaluar compra de SMD Carrier Assembly/chapita equivalente. (D.Fernandez)\r\n - AI#9 -Ver posibles implementaciones para vuelo. (Veng / Conae)\r\n- AI#10 - Analizar diferencias entre el Part Number SAOCOM y Part Number SABIA-Mar. Diferencias mecánicas/encapsulado. (vinculada AI#4) (Veng/Conae)	2021-09-22 20:26:07.23552	f
18	372	Issue	1	2) SBM-OBC-NC-00071\r\n\r\nSe actualiza A.I 6)  Especialistas de PCBs. Ir evaluando modificación del PAD para opciones de carrier y de CU ribbon. Evaluar la dificultad de ampliar el pad del Mosfet. Marcos dimensionar el corrimiento e involucrar a Stephan diseñador de PCBs. (M.Ferrer)\r\n10/06/2021: N.Balbi envía correo con información en carácter de “borrador” con lo relevado por el equipo de M.Ferrer. Archivos adjuntos: “INFORMACION SOLDADO DE MOSFET-1” y “Análisis de footrpint de MOSFET en placas TCB y PWR”	2021-09-22 20:26:07.664245	f
19	372	Issue	1	None	2021-09-22 20:26:08.834566	f
20	372	Issue	1	None	2021-09-22 20:26:11.91671	f
21	372	Issue	1	None	2021-09-22 20:26:13.251615	f
22	372	Issue	1	None	2021-09-22 20:26:13.689179	f
23	372	Issue	1	9-9-21 Entra con el grupo de reportes del PCB	2021-09-22 20:26:15.405825	f
24	373	Issue	1	NRB 18/05/2021: (M.Ferrer- N.Balbi)   se define no integrar estos componentes hasta que no se define junto a CONAE como proseguir.\r\n\r\nNRB 26/05/2021: (M.Ferrer- N.Balbi – D.Fernandez – A.Alvarez – A.Perez – M.Alvarez Bocco)   Se analizan en esta NRB los componentes de las placas COMM y TAB solamente.\r\nA.I.1) Enviar por correo documentos de análisis térmicos de TAB y COMM, nota en word redactada por Gustavo Gonzalez (presión ejercida - cond. térmica) y datasheet del proveedor PARKER del therm-a-gap (A.Perez / N.Balbi)  \r\nAnalisis térmicos y datasheet ya enviados. A.Perez 26/05/2021\r\nWord gustavo Gonzalez enviados. N.Balbi 26/05/2021\r\nA.I.2) Enviar por correo el listado de los therm-a-gap que se poseen del proyecto SABIA-Mar incluyendo en esta lista los part number de los que posee VENG no pertenecientes a este proyecto. Incluir en el correo la información de contacto del representante de PARKER.  (M.Ferrer)\r\n27/05/2021: M.Ferrer envía por correo\r\nModelo\tEspesor (mm)\tEspesor (pulg)\t\r\n62-09-0909-A579 \t2,286\t0,09\tSABIA-Mar\r\n69-12-20685-A579 \t1,778\t0,07\tSABIA-Mar\r\n62-04-0909-A579\t1,016\t0,04\tSABIA-Mar\r\n69-12-28540-A579 \t0,381\t0,015\tSABIA-Mar\r\n62-02-0909-A579\t0,508\t0,02\tLIE\r\n\r\nContacto técnico PARKER:  Brian Poor  (bpoor@parker.com)\r\n\r\nSe adjuntan además en el archivo “consultas Parker.PDF” los intercambios por mail ya realizados con el proveedor desde el LaIE.\r\nA.I.3) Enviar por correo la tabla de registro de las mediciones de los componentes conformados, en donde se agreguen columnas indicando el espesor del therm-a-gap indicado por diseño, otra con las distintas opciones de reemplazo y una tercera con el estimado de presion aplicada. (N.Balbi)\r\nTabla 210526-Medicion Altura conformados - V2 enviada. N.Balbi 26/05/2021\r\nA.I.4) Analizar la información de los AI 1, 2 y 3 ordenando por criticidad los componentes, distintas alternativas de reemplazo, factibilidad de uso (presión, conductividad térmica, etc.) y la solución más viable. (D.Fernandez / A.Perez)\r\nTabla “210531 - Altura Conformados - Impacto Termico” enviada. D.Fernandez 31/05/2021\r\nA.I.5) Realizar consulta a INVAP para obtener información de cómo se ejecutó el proceso de conformado y verificaciones realizadas, siendo de interés la verificación de coplanaridad. (D.Fernandez)\r\nA.I.6) Investigar si es posible en el LaIE (VENG) realizar verificaciones de coplanaridad de componentes conformados.  (M.Ferrer)\r\nA.I.7) Analizar la posibilidad de comprar más números de parte, para disponer de mayores opciones al momento de poblar las placas FM.  (faltaría definir a quien se le asigna esta acción)\r\nA.I.8) Se disponen de dos familias diferentes de therm-a-gap, la 62 y la 69. La diferencia entre ambas es que una posee adhesivo y la otra no. Esto es correcto? Se debería definir por algún de las dos, pensando en hacer compras en el corto plazo. (faltaría definir a quien se le asigna esta acción)\r\nA.I.9) En la tabla 210526-Medicion Altura conformados - V2, ver Fila 6, de hoja TAB. Aunque esté cumpliendo las tolerancias pedidas, queda con una deflexión del 46%, aproximadamente 17,5 psi. No me parece un problema para el EM, pero si deberíamos mirarlo pensando en el FM. (faltaría definir a quien se le asigna esta acción)\r\n31/05/2021 D.Fernandez por correo envía los siguientes comentarios:\r\n•\tEstamos ok para avanzar con el modelo EM con los espesores de term-a-gap propuestos en el Excel.\r\n•\tTenemos un componente (U2A de la COMM) que está comprometido térmicamente. No se ve particularmente afectado por el espesor de therm a gap. Ya se veía con temperaturas elevadas en los analisis térmicos de las placas de STI. Para revisar en vistas al FM.\r\n•\tPor lo que estuve leyendo, 10psi es la presión máxima admisible. Aceptamos el “Use as is” con 11psi para algunos componentes del EM.\r\n•\tParece haber un error la descripción de dos componentes (U1J y U2J) de la COMM (ver Excel).\r\nM.Ferrer: Respecto a la descripción de los transeiver 1553, efectivamente copié y pegué la descripción errónea sin darme cuenta cuando armé el Excel.\r\n•\tParece haber un error en el analisis térmico del al TAB (ACT8501-7, mismo componente con distintas temperaturas máximas). Si el error es solo ese, no sería grave.\r\n\r\n(Las tablas están disponibles en los adjuntos)	2021-09-22 20:26:20.08938	f
58	455	Issue	1	NRB 07/04/21: (N.balbi / M.Ferrer/M.Alvarez Bocco)\r\nContinuar con el poblado en curso, soldar los conectores con las platinas puestas, pero sin los tornillos: referencia visual. \r\nNRB 08/04/21: (N.balbi / M.Ferrer/M.Alvarez Bocco)\r\nSe resuelve retirar la platina para probar si mejora la conductividad térmica, ya que se presentan dificultades a la hora de soldar los conectores.	2021-09-22 20:27:39.248491	f
59	455	Issue	1	NRB 13-05-21\r\nA.I.1) Revisar diseño de la platina de alineado de conectores vs frente de conexión del modelo FM para relevar si se genera algún tipo de impacto (D.Fernandez)	2021-09-22 20:27:39.822587	f
60	455	Issue	1	None	2021-09-22 20:27:40.241758	f
61	455	Issue	1	None	2021-09-22 20:27:42.202272	f
62	455	Issue	1	None	2021-09-22 20:27:44.376121	f
152	409	Issue	1	Root Cause:\r\nFue decisión a nivel misión la de reutilizar el harness de la Misión SAOCOM que no cumple con la impedancia requerida por SABIA-Mar y tampoco con el SB-090200-SP-00100-B SABIAMar Grounding-Bonding-Isolation Desing Specifications.	2021-09-22 20:30:39.046964	f
153	409	Issue	1	Root Cause:  Implementation Deviation	2021-09-22 20:30:42.969497	f
154	409	Issue	1	None	2021-09-22 20:30:43.459091	f
155	409	Issue	1	None	2021-09-22 20:30:48.714476	f
165	412	Issue	1	None	2021-09-22 20:31:41.580465	f
413	425	Issue	1		2021-09-24 14:07:00.926475	f
25	373	Issue	1	Se actualiza A.I.6) Investigar si es posible en el LaIE (VENG) realizar verificaciones de coplanaridad de componentes conformados.  (M.Ferrer)\r\n10/06/2021: M.Ferrer informa que en VENG no se posee conocimientos/Know how para realizar verificaciones de coplanaridad\r\n\r\n\r\nSe actualiza A.I.7) Analizar la posibilidad de comprar más números de parte, para disponer de mayores opciones al momento de poblar las placas FM.  (D.Fernandez / N.Balbi)\r\n10/06/2021: en la lista de excel "210608 - Altura Conformados - Impacto Termico V1" se agregaron las nuevas medidas a comprar.  Falta agregar part number. D.Fernandez activa la compra.\r\n\r\nSe actualiza A.I.8) Se disponen de dos familias diferentes de therm-a-gap, la 62 y la 69. La diferencia entre ambas es que una posee adhesivo y la otra no. Esto es correcto? Se debería definir por algún de las dos, pensando en hacer compras en el corto plazo.\r\n10/06/2021: Desde CONAE se confirma que el therm-a-gap a utilizar es con adhesivo.  M.Ferrer envía correo  en donde se evidencia que las caracterisiticas de ambos parr number son iguales. Varían solamente en el tamaño de la plancha.  \r\n\r\nSe actualiza A.I.9) En la tabla 210526-Medicion Altura conformados - V2, ver Fila 6, de hoja TAB. Aunque esté cumpliendo las tolerancias pedidas, queda con una deflexión del 46%, aproximadamente 17,5 psi. No me parece un problema para el EM, pero si deberíamos mirarlo pensando en el FM. (D.Fernandez)\r\n10/06/2021: Realizar repaso general de todos los componentes (cumplen y no cumplen)\r\n\r\nSe genera A.I. 12)  Realizar pruebas de posicionamiento / compresión con therm-a-gap con diferentes geometrias de corte para cada componente. (M.Ferrer)\r\n                                         a) para un mismo espesor realizar 2 cortes con areas bien distintas (una grande y una chica) para definir si es posible que la deformación del therm-agap depende del area.\r\n                                         b) para un mismo espesor  realizar 4 cortes con geometria diferentes (ej. 4 cuadraditos) \r\n                                         c) para el espesor de diseño de la FPGA,  en un solo serial numbre, buscar el area de therm-a-gap optima para lograr los 10 PSI.\r\n                                         d) Realizar pequeños tajos en diferentes lugares sin lograr el corte total \r\nSe genera A.I. 13) Enviar fotos de como quedaron los componentes con therm-a-gap de las placas ya integradas (M.Ferrer) \r\n10/06/2021 M.Ferrer envía correo con las fotos solicitadas. Archivo “Img FPGA-LDO-ACT8501-7 – Mferrer”\r\n\r\nSe genera A.I. 14) Enviar procedimiento de calibración MGSE de therm-a-gap. (M.Ferrer)\r\n\r\n10/06/2021: M.Ferrer envía por correo la documentación asociada al MGSE. Archivo "MGSE_Fixture.zip”	2021-09-22 20:26:22.473055	f
26	373	Issue	1	None	2021-09-22 20:26:23.755596	f
27	373	Issue	1	None	2021-09-22 20:26:27.228554	f
28	373	Issue	1	None	2021-09-22 20:26:27.623863	f
29	373	Issue	1	None	2021-09-22 20:26:28.222453	f
30	373	Issue	1	*SBM-OBC-NC-00068 - MoM NRB 20210806*\r\n\r\n*+Participantes:+*\r\n\r\nManuel Alvarez, Marcos Ferrer, Joaquín Sanchez Magarinos, Alejandro Ugarte, Alejandro Franzetti, Juan Pablo Gonzalez Maina, Anibal Ambrosino, Alicia Alvarez y Damián Fernández.\r\n\r\n*+Resumen:+*\r\n\r\nDurante la reunión se explica que Fancort especifica tolerancias esperadas para el conformado pero que no deben tomarse como valores máximos. La máquina utilizada requiere que, para cada tipo de componente a conformar, se realicen ajustes y la selección de herramientas específicas. Esta es una de las razones por la cual las tolerancias esperadas podrían no cumplirse.\r\n\r\nPor otro lado, es esperable que, después de conformar el primer componente de un determinado tipo, sea necesario realizar un ajuste final de la máquina para luego continuar con el resto. Por esta razón, el primer componente conformado puede presentar un desvío mayor que las partes siguientes. \r\n\r\nEs recomendable destinar un componente de cada tipo para realizar el primer conformado. De esta manera se podrán tomar decisiones de continuar, frenar o definir mitigaciones en base al resultado.\r\n\r\n*+Acciones propuestas para mitigar el impacto en el FM:+*\r\n\r\n- Programar la actividad con una anticipación mínima de 20 días para asegurar disponibilidad de personal y recursos.\r\n\r\n- Para el envío desde el CETT a INVAP\r\n\r\n                - Especificar y/o aclarar cuestiones respecto al embalaje y cajas a utilizar para los componentes ya conformados.\r\n\r\n                - De tener disponibles, enviar PCBs en físico para realizar Fitcheck. En su defecto, enviar los gerbers.\r\n\r\n                - Considerar que el primer componente de cada tipo suele tener un desvío mayor que el resto. Evaluar enviar spares o dummies.\r\n\r\n- Luego de recibidos los componentes en INVAP, hacer una reunión en conjunto (VENG-CONAE-INVAP) para evacuar dudas antes de empezar el conformado.\r\n\r\n- Considerar la presencia de personal de Conae y/o Veng durante el conformado para tomar decisiones en caso de desvíos.\r\n\r\n- Realizar registro fotográfico. Incluir fotos de los componentes ya conformados dentro del embalaje. El objetivo es tener trazabilidad en caso de detectar defectos o pines doblados durante el incoming inspection en Veng.	2021-09-22 20:26:29.076562	f
31	373	Issue	1	9-9-21  Manu manda correo a Damian con dudas a revisar	2021-09-22 20:26:31.846065	f
32	373	Issue	1	16-9-21\r\n\r\nSe revisaron las dudas, Damian le responde a MA.  No se pone OC hasta Enero.	2021-09-22 20:26:32.30792	f
33	455	Issue	1	NRB 13-05-21\r\nF) SBM-OBC-NC-00064:\r\nA.I.1) Analizar internamente por si amerita realizar cambio en el PCB o en los componentes. (D.Fernandez)	2021-09-22 20:26:35.570012	f
34	455	Issue	1	Mail de Damian del 4-6-21\r\nCorregir Altium con los footprint correctos y agregando separación entre componentes para los PCBs FM.	2021-09-22 20:26:39.287526	f
35	455	Issue	1	None	2021-09-22 20:26:41.105638	f
36	455	Issue	1	None	2021-09-22 20:26:41.623795	f
37	455	Issue	1	None	2021-09-22 20:26:42.878289	f
38	455	Issue	1	NRB 13-05-21\r\nE) SBM-OBC-NC-00062:\r\nA.I.1) Redireccionarla a la NC SBM-OBC-NC-00066 que es la que engloba todos los inconvenientes con el therm-a-gap	2021-09-22 20:26:43.745276	f
39	455	Issue	1	None	2021-09-22 20:26:46.205612	f
40	455	Issue	1	None	2021-09-22 20:26:46.804759	f
41	455	Issue	1	None	2021-09-22 20:26:49.044093	f
42	455	Issue	1	NRB 13-05-21\r\nD) SBM-OBC-NC-00060:\r\nA.I.1) Monitorear / Verificar aplicación de cambios solicitados en la NC  SBM-OBC-NC-00015 / NCR5 de modificaciones de PCBs donde ya se solicita thermal relief en los capacitores.\r\nA.I.2) Revisar en detalle al capacitor C1M en el diseño del PCB para tratar de encontrar la cuasa que dificulta el soldado de este componente en etapa de integración.	2021-09-22 20:26:49.890672	f
43	455	Issue	1	None	2021-09-22 20:26:50.381758	f
44	455	Issue	1	None	2021-09-22 20:26:52.486104	f
45	455	Issue	1	None	2021-09-22 20:26:53.100456	f
46	455	Issue	1	NRB 11-05-21\r\nd) SBM-OBC-NC-00059:\r\nA.I.8) Revisar el stock de componentes  verificando si se posee resistores de 604KOhm en 0705 (M.Ferrer)\r\nA.I. 9) De existir el resistor del A.I8 verificar compatibilidad termica del mismo. (D.Fernandez)\r\nA.I 10) revisar las placas EM/FM si se usa este resistor y si se verifica este problema de footprint (N.Balbi / M.Ferrer)\r\n	2021-09-22 20:26:55.766459	f
47	455	Issue	1	AI 4) para la versión FM se dispone modificar el footprint de estos componentes en los PCBS de AVAB y PWR (TBC)\r\nAI 5) para la versión EM, incluir foto del PCB con el resistor presentado para aportar más detalle de la situación y alguna posible alternativa de uso sin cambio del componente. (M.Ferrer)	2021-09-22 20:26:58.367589	f
48	455	Issue	1	Mail de Damian del 4-6-21\r\nVer de corregir en Altium la discrepancia con el footprint y actualizar PCBs FM.	2021-09-22 20:27:00.823911	f
49	455	Issue	1	None	2021-09-22 20:27:04.601037	f
50	455	Issue	1	None	2021-09-22 20:27:10.910394	f
51	455	Issue	1	None	2021-09-22 20:27:12.77413	f
52	455	Issue	1	NRB 08/04/21: (N.balbi / M.Ferrer/M.Alvarez Bocco)\r\nSoldar los conectores Sub-D sin alcanzar los requerimientos de workmanship en etapa EM.\r\n	2021-09-22 20:27:15.151912	f
53	455	Issue	1	NRB 13-05-21\r\nB) SBM-OBC-NC-00053:\r\nA.I.1) Incluir fotos del conector soldado y de las soldaduras del lado top y bottom en la NC  (M.Ferrer)\r\nA.I.2) Ampliar/completar el detalle de los inconvenientes que genera esta situacion de que no asome el pin del lado bottom (M.Ferrer)\r\nA.I.3) Analisar la posibilidad de compra de conectores con pines mas largos (D.Fernandez)	2021-09-22 20:27:27.15392	f
54	455	Issue	1	Se termina de definir lo solicitado por D.Fernandez en su correo del 28/05/2021 y se genera A.I.4\r\nA.I 4) se requiere realizar RX a la soldadura de los conectores SUB D (de una de las dos placas) ya integrados para poder analizarlos en detalle y si quedan funcionales.  (M.Ferrer) 	2021-09-22 20:27:36.393517	f
55	455	Issue	1	None	2021-09-22 20:27:36.798528	f
56	455	Issue	1	None	2021-09-22 20:27:37.227933	f
57	455	Issue	1	None	2021-09-22 20:27:37.806275	f
63	455	Issue	1	Disposición:\r\nComponentes en altura: Se dispone soldar en altura solamente los componentes indicados en el procedimiento EM, y solicitar información de altura para modelos FM\r\nTherm-a-gap: en consonancia con SBM-OBC-NC-00062, desarrollar un documento más completo para la colocación del mismo. Actualmente, para los casos en duda, omitir el poblado y dejar para próximas etapas\r\n\r\nNRB 11-05-21\r\nb) SBM-OBC-NC-00066:  \r\nA.I.4) Analizar el poblado en las placas de los componentes con therm-a-gap,tratando dentro de lo posible de integrarlos al final para que de esta manera estén en el menor tiempo posible en contacto del alcohol isopropilico. (M.Ferrer)\r\nA.I5) Revisar y analizar la manera de aplicación del therm-a-gap del UT699/Leon3 por los esfuerzos mecánicos a los que puede ser sometidos y el lugar de aplicación de los mismos. (D.Fernandez)	2021-09-22 20:27:45.288615	f
64	455	Issue	1	None	2021-09-22 20:27:48.360083	f
65	455	Issue	1	None	2021-09-22 20:27:49.129725	f
66	455	Issue	1	None	2021-09-22 20:27:49.551288	f
67	455	Issue	1	NRB 07/07/2021 Participantes: D.Fernandez, A.alvarez, M.Ferrer, N.Balbi, M.toledo, M.Alvarez Bocco\r\nSe analiza el reporte SBM-OBC-RP-104-C enviado por M.Ferrer con los resultados de las pruebas realizadas. (vinculadas al AI 12 NC SBM-OBC-NC-00068)\r\nA.I.4) Listar los componentes que faltan poblar en la etapa EM de todas las placas, informando los valores esperados y reales de altura de conformado, el therm a gap que por diseño le corresponde . (M.Ferrer)\r\nA.I 5) Con el listado generado en el A.I.4 hacer verificación de análisis térmicos de estos componentes.  En base a la aprobación térmica, se podria definir para la FPGA la ubicación de los 4 cortes de therm-a gap. (D.Fernandez)\r\nA.I 6) Componente HS9: una vez obtenido el ok térmico del A.I.5, tratar de soldar el componente con therm a gap pre comprimido y de no obtener el resultado esperado ya que queda algo elevado, tratar de soldarlo igual.  Esto es exclusivo para el modelo EM. (M.Ferrer)\r\nA.I 7) Agregar al reporte SBM-OBC-RP-00104-C una tabla con mediciones empíricas de deformación/expansión del therm-a-gap en los diferentes espesores.  (M.Ferrer)\r\nA.I8) Componente LDO: en etapa EM, soldarlo utilizando therm a gap, previo ok térmico (AI5) (M.Ferrer)	2021-09-22 20:27:50.389137	f
68	381	Issue	1	Remedial Actions:\r\nSe cerrará la NCR cuando:\r\n1)\tSe corrija la documentación de Backplane A y B FM: Procedimiento de test, documentación de populado\r\n\r\nSe corrigio la documentacion de Backplane\r\n\r\n2)\tSe actualice el MAIT Plan de la PM-OBC y se ejecute el proceso actualizado en al menos una placa de la PM-OBC y se evalúen los resultados de dicho proceso\r\n\r\nDurante el ARR de la SBC A EM 14-01-19 y el ARR de la IAB A EM 18-02-19 no se detecto incosistencia ni problema alguno, en abmas placas se ejecuto el plan de MAIT actualizaddo por lo que se considera que los puntos de control agregados tuvieron exito\r\n\r\n3)\tSe acuerde y documente el proceso de control de stock y recepción de materiales\r\n\r\nSe genero un SOW y acordo el proceso con el LIE para el control de stock y recepcion de materiales	2021-09-22 20:27:52.159933	f
69	381	Issue	1	None	2021-09-22 20:27:52.921818	f
70	455	Issue	1	Calidad del Servicio de Electrónica solicitó registrar una NC a nivel Proyecto para dar seguimiento a los retrabajos pendientes que se deberán realizar sobre las placas EL-1586 S/N V-B335-001 y V-B335-002 cuando se reciban los componentes necesarios; fecha estimada de recepción de los componentes: julio de 2021.\r\nEl servicio de Producción Electrónica cierra la NC 0965SIE1116 y el Plan C254-PVVB-0QREL-335-A, para liberar las placas del proceso de fabricación. Cuando lleguen los componentes se deberán realizar los retrabajos bajo un nuevo Plan del servicio.\r\n\r\nAdjuntos en la NC Original\r\nNRB - NRB#1 NC0965PAQ0025 - Solicitu de NC a nivel Proyecto\r\nAdjunto NRB#1 NC 0965PAQ0025 - Correo QA Electrónica.pdf\r\n	2021-09-22 20:27:55.059467	f
71	455	Issue	1	None	2021-09-22 20:27:55.639548	f
72	455	Issue	1	None	2021-09-22 20:27:56.086986	f
73	455	Issue	1	Attachments en la NC Original\r\nNRB - NRB#1 NC0965PAQ0024 - Solicitu de NC a nivel Proyecto\r\nAdjunto NRB#1 NC 0965PAQ0024.pdf\r\nNRB - NRB#3 NC0965PAQ0024 - Información de retrabajos a realizar\r\nAdjunto #1 NRB#3 - Correo A Tellarini - Retrabajos a realizar.pdf\r\nAdjunto #2 NRB#3 - Resistencias NC0965PEM0053.pdf\r\nNRB - NRB#2 NC 0965PAQ0024 - NC 0965PEM0053 cerrada\r\nNCR 0965PEM0053.pdf	2021-09-22 20:27:56.76526	f
74	455	Issue	1	None	2021-09-22 20:27:57.284972	f
75	455	Issue	1	None	2021-09-22 20:27:57.715544	f
76	384	Issue	1	MoM – SBM-OBC-NC-00031 - NRB#1 - 20210416\r\n\r\nPresentes\r\nVENG: Eduardo Kunysz, Nicolás Balbi, Manuel Álvarez, Fernando Rodríguez Brizuela, Alejandro Perez, Sebastian Nieto\r\nINVAP: Rosmarie, Gerardo Toledo, Gustavo Fabbri, Matias Pinedo, Santiago, Carlos Caretti, Martín Morixe, D Sukkiennik\r\nCONAE: Adrián Orellano, Damián Fernández, Alicia Alvarez, Florencia Zuccolo\r\n\r\nDescripción de los ensayos realizados\r\nSe presentó la secuencia de ensayos realizados por Veng, los diversos problemas encontrados y las hipótesis sobre posibles causas raíz.\r\n•\tSBM-OBC-NC-00031 - NC Flow.pdf\r\n•\tSBM-OBC-NC-00031 - Falla en carga nominal de aplicativos SBC.pdf\r\n\r\nTambién se presentaron los resultados de los ensayos realizados durante la mañana del viernes (minutos antes de la reunión). Muy resumidamente, se observa que:\r\nEl MKProm podría estar configurando mal el tamaño de la memoria RAM al inicializar el UT699. Por esta razón, se probó cambiando la configuración de tamaño de memoria RAM Hardcodeando el valor a 64, luego de ejecutar el load. Se cargo bien pero no hizo el jump de EEPROM (donde está el bootloader) a RAM (donde se cargó el programa). Se verifica que el programa fue copiado correctamente de Flash a RAM. \r\nConectados con GRmon, se fuerza la ejecución del programa presente en RAM y se ejecuta exitosamente. \r\nEl bootloader se ejecuta desde EEPROM, carga el programa aplicativo de un banco FLASH a una RAM, luego tiene que hacer el jump de la EEPROM a la RAM y ejecutar el aplicativo. Se está investigando por qué no se realizó el jump.\r\n\r\nPróximos Pasos\r\n+ VENG: Ordenar las pruebas que hicieron en una tabla con la configuración de los test cases y resultados, incluyendo información como ser: Aplicativos utilizados (con algún tipo de ID), objetivos del ensayo, resultado esperado, resultado obtenido, configuraciones en general (habilitaciones de EDAC y Cache, registros de memoria, etc) desde dónde se bootea, dónde se encontraba guardado el SW aplicativo (EEPROM o Flash) desde donde se ejecutó el aplicativo, uso de GRmon, etc.\r\n+ INVAP: Revisar documentación y enviar consultas.\r\n+ VENG: Definir próximos pasos y compartir con el board para comentarios y sugerencias.	2021-09-22 20:27:58.494783	f
77	384	Issue	1	Mail de Gerardo Toledo de INVAP del 26-4-21:\r\nEnvío los comentarios/sugerencias del grupo de Invap hacia la 1er entrega de documentación del 16/04/21   :\r\n\r\nRespecto al documento "SBM-OBC-NC-00031 - NC Flow.pdf":\r\nVemos que hay muchas pruebas de configuraciones no nominales, así que para arrancar proponemos el siguiente plan:\r\nSi es posible, intentar hacer funcionar las cosas en el setup Nominal SBC+App+bootloader\r\nREVISIÓN INTERNA INVAP\r\nPor favor enviar:\r\n- código fuente de la aplicación "Nominal", con la información de cómo se está compilando y cómo lo empaquetan en el binario que termina grabándose en Flash.\r\n- código fuente del bootloader y cómo lo están compilando.\r\nSESIÓN DE DEBUG EN CONJUNTO- una vez que tengamos esta primera revisión interna, proponemos hacer una sesión de debug en conjunto con los desarrolladores de VENG, siguiendo el paso a paso.\r\nPor lo pronto, para las reuniones de los viernes proponemos para lado Invap poner solo a Carlos Caretti, Gerardo Toledo  y en copia poner a Santiago Eggers, Gustavo Fabbri, así liberamos al resto de estas reuniones de seguimiento.Muchas gracias, saludos Gerardo	2021-09-22 20:27:59.886899	f
150	455	Issue	1	None	2021-09-22 20:30:23.515464	f
151	455	Issue	1	None	2021-09-22 20:30:29.365904	f
164	411	Issue	1	None	2021-09-22 20:31:31.229779	f
415	424	Issue	1		2021-09-24 14:13:07.368733	f
78	384	Issue	1	MoM – SBM-OBC-NC-00031 - NRB#2 - 20210423\r\nPresentes\r\nVENG: Eduardo Kunysz, Nicolás Balbi, Manuel Álvarez, Fernando Rodríguez Brizuela, Alejandro Perez, Sebastian Nieto\r\nINVAP: Carlos Caretti \r\nCONAE: Adrián Orellano, Damián Fernández, Alicia Alvarez, Florencia Zuccolo\r\n \r\nTemas tratados\r\nDurante la reunión, Veng presentó un conjunto de consultas sobre dudas que hay respecto a diversos temas en relación a la NC. Se repasaron y explicó el contexto de cada una de las consultas para que Caretti pueda transferirlas al equipo de INVAP.\r\nSe solicitó a Veng complementar las consultas presentadas con una descripción del contexto y observaciones que dan lugar a la consulta para compartir por escrito con INVAP y facilitar la interpretación por parte de los especialistas.\r\nSe acuerda que Veng preparará un paquete de documentación con información y códigos fuente para compartir con INVAP para que sea revisado. Información a incluir en dicho paquete:\r\n-\tCódigo fuente del bootloader y detalle de cómo se está compilando.\r\n-\tCódigo fuente del aplicativo. Información de cómo se está compilando y cómo se empaqueta en el binario que se termina grabando en Flash.\r\n-\tUltima versión de BSW\r\n\r\nSe acuerda definir POCs de lado de Veng e INVAP para facilitar el intercambio de información y avanzar con las consultas y dudas respecto al tema, manteniendo en copia a los responsables.\r\nSe define que, luego de aclarar algunas de las dudas actuales, se realizaran sesiones de debugging junto a los especialistas de INVAP participando de manera remota.\r\n \r\nPróximos Pasos\r\n+ VENG: Enviar consultas agregando más detalle y explicando contexto para facilitar la interpretación de los especialistas de INVAP.\r\n+ VENG/INVAP: Definir POCs para intercambiar consultas e información técnica en relación a la NC.\r\n+ VENG: Enviar a INVAP\r\n-\tCódigo fuente del bootloader y cómo lo están compilando.\r\n-\tCódigo fuente del aplicativo. Información de cómo se está compilando y cómo lo empaquetan en el binario que termina grabándose en Flash.\r\n-\tUltima versión de BSW\r\n\r\n+ VENG/INVAP/CoNAE: Coordinar una sesión de debugging entre Veng y especialistas de INVAP conectados de manera remota.  \r\nPróxima reunión: TBD	2021-09-22 20:28:00.315874	f
79	384	Issue	1	None	2021-09-22 20:28:01.656349	f
80	384	Issue	1	None	2021-09-22 20:28:02.180174	f
81	384	Issue	1	9-9-21 Falta actualizar con NRBs de INVAP, MA la revisa con AP si se dispone para proponer para cierre.  MA me envía los reportes para actualizarla	2021-09-22 20:28:03.936653	f
82	455	Issue	1	None	2021-09-22 20:28:05.193147	f
83	455	Issue	1	None	2021-09-22 20:28:08.49622	f
84	455	Issue	1	None	2021-09-22 20:28:11.504865	f
85	455	Issue	1	None	2021-09-22 20:28:12.260441	f
86	455	Issue	1	None	2021-09-22 20:28:12.845921	f
87	455	Issue	1	None	2021-09-22 20:28:13.314535	f
88	455	Issue	1	None	2021-09-22 20:28:14.462665	f
89	455	Issue	1	None	2021-09-22 20:28:19.675164	f
90	455	Issue	1	None	2021-09-22 20:28:20.985998	f
91	455	Issue	1	None	2021-09-22 20:28:21.413321	f
92	455	Issue	1	None	2021-09-22 20:28:22.630859	f
93	455	Issue	1	None	2021-09-22 20:28:23.110442	f
94	455	Issue	1	LIE-10K_NC1844	2021-09-22 20:28:24.845494	f
95	455	Issue	1	None	2021-09-22 20:28:25.315871	f
96	455	Issue	1	None	2021-09-22 20:28:25.785046	f
97	455	Issue	1	LIE-10K_NC1843	2021-09-22 20:28:26.50126	f
98	455	Issue	1	None	2021-09-22 20:28:26.921113	f
99	455	Issue	1	None	2021-09-22 20:28:27.2815	f
100	455	Issue	1	LIE-10K_NC1842	2021-09-22 20:28:27.839557	f
101	455	Issue	1	None	2021-09-22 20:28:28.840507	f
102	455	Issue	1	None	2021-09-22 20:28:29.937099	f
103	455	Issue	1	LIE-10K_NC1838	2021-09-22 20:28:32.30553	f
104	455	Issue	1	None	2021-09-22 20:28:37.162009	f
105	455	Issue	1	None	2021-09-22 20:28:40.969696	f
106	455	Issue	1	LIE-10K_NC1837	2021-09-22 20:28:46.747939	f
107	455	Issue	1	None	2021-09-22 20:28:47.201399	f
108	455	Issue	1	None	2021-09-22 20:28:47.686027	f
109	455	Issue	1	LIE-10K_NC1836	2021-09-22 20:28:50.45407	f
110	455	Issue	1	AI 4) para la versión FM se dispone modificar el footprint de estos componentes en los PCBS de AVAB y PWR (TBC)\r\nAI 5) para la versión EM, incluir foto del PCB con el resistor presentado para aportar más detalle de la situación y alguna posible alternativa de uso sin cambio del componente. (M.Ferrer)	2021-09-22 20:28:51.437418	f
111	455	Issue	1	Mail de Damian del 4-6-21\r\nVer de corregir en Altium la discrepancia con el footprint y actualizar PCBs FM.	2021-09-22 20:28:52.844698	f
112	455	Issue	1	None	2021-09-22 20:28:53.279096	f
113	455	Issue	1	None	2021-09-22 20:28:53.783272	f
114	455	Issue	1	LIE-10K_NC1835	2021-09-22 20:28:54.382514	f
115	455	Issue	1	None	2021-09-22 20:28:54.8178	f
116	455	Issue	1	None	2021-09-22 20:28:55.265089	f
117	455	Issue	1	LIE-10K_NC1834	2021-09-22 20:28:55.815987	f
118	455	Issue	1	None	2021-09-22 20:28:56.25627	f
119	455	Issue	1	None	2021-09-22 20:28:56.665067	f
120	455	Issue	1	LIE-10K_NC1833	2021-09-22 20:28:57.251336	f
121	455	Issue	1	None	2021-09-22 20:28:57.766444	f
122	455	Issue	1	None	2021-09-22 20:28:58.256501	f
123	455	Issue	1	LIE-10K_NC1832	2021-09-22 20:28:58.830617	f
124	455	Issue	1	None	2021-09-22 20:29:01.366834	f
125	455	Issue	1	None	2021-09-22 20:29:01.755677	f
126	455	Issue	1	LIE-10K_NC1831	2021-09-22 20:29:02.856309	f
127	455	Issue	1	NRB 13-05-21\r\nC) SBM-OBC-NC-00037:\r\nA.I.1) Investigar la funcionalidad /importancia / Criticidad de este conector dentro de la placa (A.Perez / D.Fernandez)\r\nA.I.2) Agregar fotografias al reporte de NC del conector ya soldado (top y bottom) (M.Ferrer)	2021-09-22 20:29:04.615758	f
128	455	Issue	1	Se actualiza A.I.1) D.Fernandez informa que el conector SMA es para acceder al Clock, en la especificación de ensayos de las placas está el setup usando esos conectores. Su uso no es indispensable. No critico para el EM. \r\nAsegurar incluir en los procedimientos de integración mayor información de detalle de inspección a tener en cuenta en los KIP del FM en el soldado de componentes con estos problemas de largo de pines. (M.Ferrer)	2021-09-22 20:29:07.649447	f
129	455	Issue	1	None	2021-09-22 20:29:08.510405	f
130	455	Issue	1	None	2021-09-22 20:29:11.196709	f
131	455	Issue	1	LIE-10K_NC1830	2021-09-22 20:29:11.862747	f
132	455	Issue	1	None	2021-09-22 20:29:17.870947	f
133	455	Issue	1	None	2021-09-22 20:29:21.676148	f
134	455	Issue	1	None	2021-09-22 20:29:23.222968	f
135	455	Issue	1	None	2021-09-22 20:29:33.701346	f
136	455	Issue	1	None	2021-09-22 20:29:47.157201	f
137	455	Issue	1	None	2021-09-22 20:29:50.154324	f
138	455	Issue	1	None	2021-09-22 20:29:50.632992	f
139	455	Issue	1	None	2021-09-22 20:29:53.176366	f
140	455	Issue	1	None	2021-09-22 20:29:56.324107	f
141	455	Issue	1	None	2021-09-22 20:29:58.74689	f
142	455	Issue	1	None	2021-09-22 20:30:00.978721	f
143	455	Issue	1	None	2021-09-22 20:30:03.638642	f
144	455	Issue	1	None	2021-09-22 20:30:04.275975	f
145	455	Issue	1	None	2021-09-22 20:30:04.726303	f
146	455	Issue	1	None	2021-09-22 20:30:06.898995	f
147	455	Issue	1	None	2021-09-22 20:30:10.401251	f
148	455	Issue	1	None	2021-09-22 20:30:15.899118	f
149	455	Issue	1	None	2021-09-22 20:30:19.367513	f
156	410	Issue	1	Root Cause: Fue decisión a nivel misión la de reutilizar equipamiento de la Misión SAOCOM, el cual al someterse a una verificación por diseño del requerimiento, no cumplió con el mismo en su totalidad.\r\n\r\nRemedial Action: En un principio se complementará el tipo de revisión con una revisión por inspección visual del hardware y su embalaje original. En caso de que se siga sin cumplir el requerimiento, la disposición que se usara es “use as is” generando el respectivo RFD o RFW.	2021-09-22 20:30:51.325956	f
157	410	Issue	1	Root cause:  Implementation Deviation	2021-09-22 20:30:55.545574	f
158	410	Issue	1	None	2021-09-22 20:30:59.587871	f
159	410	Issue	1	None	2021-09-22 20:31:03.007449	f
160	411	Issue	1	Root Cause:  Se integró un componente por otro por falta de disponibilidad	2021-09-22 20:31:07.50342	f
161	411	Issue	1	None	2021-09-22 20:31:28.092508	f
162	411	Issue	1	Detectado durante Puesta en marcha SBC durante ensayos de verificación de SW en Balcarce	2021-09-22 20:31:29.318736	f
163	411	Issue	1	Se acuerda el cambio a MENOR en la reunión del 29-4-21 entre Ingeniería y PA VENG y CONAE	2021-09-22 20:31:30.563686	f
184	418	Issue	1	None	2021-09-22 20:33:26.545807	f
185	455	Issue	1	None	2021-09-22 20:33:41.306986	f
186	455	Issue	1	None	2021-09-22 20:33:42.253003	f
187	455	Issue	1	None	2021-09-22 20:33:45.206909	f
188	455	Issue	1	None	2021-09-22 20:33:49.32484	f
189	455	Issue	1	None	2021-09-22 20:33:53.527585	f
190	455	Issue	1	Se realizó la solución propuesta y se documentó en el protocolo 0965PAQ0017	2021-09-22 20:33:55.676708	f
191	455	Issue	1	None	2021-09-22 20:33:58.84039	f
192	455	Issue	1	None	2021-09-22 20:34:00.113442	f
193	422	Issue	1	Archivo NCR 0965PAQ0014  excede el limite de capacidad de almacenamiento	2021-09-22 20:34:01.1242	f
194	422	Issue	1	None	2021-09-22 20:34:02.048512	f
195	422	Issue	1	None	2021-09-22 20:34:05.909712	f
196	423	Issue	1	Archivos:\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/cmd.aspx\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/fileupload-1.aspx\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/fileupload.aspx\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/shell.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/shell2.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/shell3.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/shell4.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/shell5.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/up-1.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/up.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/up1.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/up3.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/up4-1.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/up4-1.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/up5.html\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/upload.asp\r\nhttps://uam.conae.gov.ar/NCR/UserFiles/18/webshell.asp\r\nEl archivo 1- protocolo_0965SIE0249 excede el tamaño para carga\r\nEl archivo 2- protocolo_0965SIE0268 excede el tamaño para carga\r\nEl archivo 3- protocolo_0965SIE0297 excede el tamaño para carga	2021-09-22 20:34:07.104705	f
197	423	Issue	1	None	2021-09-22 20:34:07.590401	f
227	455	Issue	1	None	2021-09-22 20:34:59.421209	f
228	455	Issue	1	None	2021-09-22 20:35:00.469244	f
229	455	Issue	1	None	2021-09-22 20:35:01.71808	f
166	412	Issue	1	Detectado durante durante etapa de preparación de integración parcial de la placa\r\n\r\nDisposición:  No poblar los componentes faltantes. No poblar aquellos componentes que puedan afectar el futuro poblado de los faltantes actuales. \r\n28/01/21 Email de D. Fernández post IRR poblado placa PWR EM\r\n•    El opto acoplador (66266-001) necesita conformado pero aún no arribo según la información con la que contamos. Entendemos que debería estar como faltante en la NC SBM-OBC-NC-00033.  En el documento “Componentes Conformados.doc” figura como disponible y conformado.      \r\nNO POBLAR. Deberían estar como faltantes y sin conformar. CONFIRMAR con LIE. Por qué no figura como faltante?\r\n•    DCDCs. Del reporte “Componentes Conformados.doc” se entiende que los DCDCs están disponibles y conformados.\r\nM3GB2803R3S/EM Hybrid Hi-Rel Rad-Hard DC-DC Converter \r\nM3GB280512T/EM Hybrid Hi-Rel Rad-Hard DC-DC Converter\r\nEstán disponibles? Ya están conformados?\r\nNO POBLAR. Aclarar si están en stock. Indicar si están conformados.\r\n•    Los siguientes componentes nos figuran como faltantes pero no los vemos en la NC. Llegarían el 05/2021. Recomendamos no poblar hasta aclarar la discrepancia.\r\nFLTM/C/47 Capacitive 10 Amp. Feed-thru Panel Mount \r\nFLTM/P/5000 LC Pi - 10 Amp. Feedthru Panel Mount\r\nNO POBLAR\r\n•    RES SMD 100K OHM 0.1% 1/8W 0805 M55342E06B100BR. Entendemos que está en Stock el equivalente M55342E06B100BRWS.\r\nREVISAR. SE PODRIA POBLAR	2021-09-22 20:31:45.28645	f
167	412	Issue	1	No poblar los componentes faltantes. No poblar aquellos componentes que puedan afectar el futuro poblado de los faltantes actuales. \r\n28/01/21 Email de D. Fernández post IRR poblado placa PWR EM\r\n•    El opto acoplador (66266-001) necesita conformado pero aún no arribo según la información con la que contamos. Entendemos que debería estar como faltante en la NC SBM-OBC-NC-00033.  En el documento “Componentes Conformados.doc” figura como disponible y conformado.      \r\nNO POBLAR. Deberían estar como faltantes y sin conformar. CONFIRMAR con LIE. Por qué no figura como faltante?\r\n•    DCDCs. Del reporte “Componentes Conformados.doc” se entiende que los DCDCs están disponibles y conformados.\r\nM3GB2803R3S/EM Hybrid Hi-Rel Rad-Hard DC-DC Converter \r\nM3GB280512T/EM Hybrid Hi-Rel Rad-Hard DC-DC Converter\r\nEstán disponibles? Ya están conformados?\r\nNO POBLAR. Aclarar si están en stock. Indicar si están conformados.\r\n•    Los siguientes componentes nos figuran como faltantes pero no los vemos en la NC. Llegarían el 05/2021. Recomendamos no poblar hasta aclarar la discrepancia.\r\nFLTM/C/47 Capacitive 10 Amp. Feed-thru Panel Mount \r\nFLTM/P/5000 LC Pi - 10 Amp. Feedthru Panel Mount\r\nNO POBLAR\r\n•    RES SMD 100K OHM 0.1% 1/8W 0805 M55342E06B100BR. Entendemos que está en Stock el equivalente M55342E06B100BRWS.\r\nREVISAR. SE PODRIA POBLAR\r\n\r\nSe realizará integración parcial de componentes hasta la llegada del resto. SBM-OBC-MM-00057-A	2021-09-22 20:31:45.71487	f
168	412	Issue	1	None	2021-09-22 20:31:53.89856	f
169	412	Issue	1	None	2021-09-22 20:31:55.369545	f
170	413	Issue	1	None	2021-09-22 20:32:04.715998	f
171	413	Issue	1	Detectado durante etapa de preparación de integración parcial de la placa.\r\n\r\nDisposición:   No poblar los componentes faltantes. No poblar aquellos componentes que puedan afectar el futuro poblado de los faltantes actuales. \r\n28/01/21 Email de D. Fernández, post IRR de poblado parcial placa COMM EM:\r\n•    HS9G-26C31RH/PROTO \r\n\r\nA nosotros nos figura que el componente "HS9G-26C31RH/PROTO" no arribó y que necesita conformado. Entendemos que debería figurar en la NC “SBM-OBC-NC-00032”.  Tampoco lo identificaron en el listado de “Componentes Conformados.doc” como componente que requiera conformado.\r\n\r\nPEDIMOS NO POBLAR HASTA ACLARAR	2021-09-22 20:32:07.469713	f
172	413	Issue	1	None	2021-09-22 20:32:14.546228	f
173	413	Issue	1	None	2021-09-22 20:32:21.106685	f
174	414	Issue	1	Archivo asociado, no se puede subir porque excede el limite de los 5Mb:   SB1-G-RPT-I-D01-001_v1.0_ReporteActualizacionLicenciaCORTEX	2021-09-22 20:32:23.09904	f
175	414	Issue	1	None	2021-09-22 20:32:28.98533	f
176	414	Issue	1	None	2021-09-22 20:32:37.657374	f
177	415	Issue	1	None	2021-09-22 20:32:43.529892	f
178	415	Issue	1	None	2021-09-22 20:32:49.80003	f
179	455	Issue	1	None	2021-09-22 20:32:57.484784	f
180	455	Issue	1	None	2021-09-22 20:32:57.956649	f
181	455	Issue	1	None	2021-09-22 20:32:59.437178	f
182	455	Issue	1	None	2021-09-22 20:33:01.458702	f
183	418	Issue	1	None	2021-09-22 20:33:11.497152	f
198	423	Issue	1	A través de una tomografía se identificó que en la unión del cabezal y la base hay un cable cortado. La hipótesis más probable de cómo se pudo haber cortado, es que se pudo haber dañado durante la limpieza de un excedente de Scotchweld en la base de los TAMs.\r\n\r\nFabricar dos TAMs nuevos. Además, en el procedimiento de armado de los TAM se colocará una recomendación para la etapa de Poteado de cabezales con Scotchweld.	2021-09-22 20:34:10.432474	f
199	423	Issue	1	None	2021-09-22 20:34:13.651698	f
200	424	Issue	1	El archivo NCR 0965E&M0011.pdf excede la capacidad de carga	2021-09-22 20:34:16.549099	f
201	424	Issue	1	None	2021-09-22 20:34:17.458055	f
202	424	Issue	1	None	2021-09-22 20:34:18.925876	f
203	425	Issue	1	"Ya que este inconveniente surgió sobre una addenda de inspección de la reparación que hubo de realizarse sobre el PCB de acuerdo a la NCR6 y no se deberá ejecutar sobre el FM, dicha adenda al procedimiento en cuestión no se volverá a ejecutar y no requiere actualización, sin embargo se deberá verificar los procedimientos de inspección de todas las placas para ver en aquellos casos donde se mida continuidad sobre algún IC especificar q se haga en el pad de soldadura o, en caso que no sea factible, eliminar esa medición del procedimiento\r\nSe realizó la inspección sobre la IAB A EM sin inconvenientes, no se midió sobre ningún pin, la medición de la la SBC fue debida a la reparación requerida"	2021-09-22 20:34:19.488513	f
204	425	Issue	1	None	2021-09-22 20:34:20.608119	f
205	425	Issue	1	None	2021-09-22 20:34:22.34372	f
206	425	Issue	1	None	2021-09-22 20:34:23.466661	f
207	426	Issue	1	Se deberá modificar el soporte de forma tal que quede el PCB fijo en el mismo sin posibilidad de deslizarse\r\nSe fabricó un soporte para sostener los PCBs durante su inspección y puesta en marcha como se observa en las figuras adjuntas.\r\nEl mismo fue utilizado durante la puesta en marcha de la SBC sin inconvenientes	2021-09-22 20:34:25.140313	f
208	426	Issue	1	None	2021-09-22 20:34:26.701542	f
209	426	Issue	1	None	2021-09-22 20:34:28.020358	f
210	426	Issue	1	None	2021-09-22 20:34:30.42698	f
255	438	Issue	1	"Se generara un set de nueva documentacion: Esquematico (si aplica), pcbDoc y Gerber, BOM y lista de poblado (si aplica), mapa de poblado (si aplica)\r\n29-10 Vinculada al rediseño de los PCB\r\n12-11  Modificacion en curso\r\n4-2-21  VENG nos va a enviar un up date ya que todavia se estan trabajando"	2021-09-22 20:35:34.28382	f
264	438	Issue	1	15/07/21: Reportes de  modificacion de PCBs ya emitidos.Se estan revisando librerias de los modelos fm del 2 lote con el fin de liberarlo para compra.	2021-09-22 20:35:42.408381	f
211	427	Issue	1	Se tomaron acciones para revisar todas los PCBs de la PM-OBC no solo para el caso de las torretas sino para todos los casos de thruholes de partes cuyos agujeros sean no estándar.\r\nPara el caso del PCB del modelo EM de la PM-OBCs la disposición será ?use as is? utilizando el siguiente procedimiento.\r\nPasos:\r\n1) ""Remachado"" de Turret con la herramienta correspondiente antes de posicionar en la placa (sin montar en el PCB)\r\n2) Montaje de Turret sobre el PCB (insertando por Bottom)\r\n3) Soldado de Turret (image005.jpg)\r\nSe implementó esta solución en la placa EM sin inconvenientes:\r\n(image006.jpg)\r\nPara el caso de la PM-OBC FM, se rediseñará el PCB utilizando agujeros de 2,29mm para arreglar el problema.\r\nCon respecto al resto de los PCBs de la PM-OBC, se rediseñarán no solo el Backplane sino también los PCBs de Power lado A y B y el Extender Board ya que tienen el mismo inconveniente. El resto de las placas (SBC, IAB, GPIO, TAB, AVAB, COMM, TCB) no se rediseñarán ya que, si bien tienen este inconveniente, las torretas en dichas placas se utilizarían para alimentar la placa stand alone, cosa q es factible hacer también con el extender por lo que para los ensayos se utilizará el extender para alimentar los diferentes PCBs populados y las torretas no se popularan \r\n\r\nSe verifican los gerber de final de fase C y se observa que se corrigió el plano de fabricación\r\nPower A y B:\r\n(image007.jpg)\r\nBackplane A y B:\r\n(image008.jpg)	2021-09-22 20:34:31.397728	f
212	427	Issue	1	None	2021-09-22 20:34:32.98933	f
213	427	Issue	1	None	2021-09-22 20:34:35.139517	f
214	428	Issue	1	Se siguen las acciones listadas en SBM-OBC-NC-00026_Listado_Seguimiento_No_Conformidad_Desconexion_GRMON_ensayo_flash_completo.xlsx\r\n29-10 Se revisa en reunión del viernes 30-10\r\n5-11 hacer análisis de FDIR, se realizó y está en revisión el documento.\r\nAnálisis de la línea de 3.3, está en análisis con AP\r\nRevisar as run de ensayo de marzo, para consultarlo. Esta con Eduardo\r\n12-11  Reporte se manda a revisión.\r\nAnalisis de línea 3,3 todavía en curso	2021-09-22 20:34:36.168911	f
215	428	Issue	1	None	2021-09-22 20:34:37.697438	f
216	428	Issue	1	None	2021-09-22 20:34:39.310774	f
217	428	Issue	1	Detectado durante:  implementación de Acciones propuestas en NC SBM-OBC-NC-00003	2021-09-22 20:34:41.651609	f
218	428	Issue	1	24-6  MA la revisa con AP a ver si se volvió a repetir el problema.	2021-09-22 20:34:44.277277	f
219	428	Issue	1	None	2021-09-22 20:34:47.037768	f
220	428	Issue	1	None	2021-09-22 20:34:48.485645	f
221	428	Issue	1	15/07/2021: se consulta a A.pérez, para revisar logbooks por si se repitio el evento. Se deja NC como puntero de registro de estos eventos durante el PM OBC EM	2021-09-22 20:34:50.197347	f
222	428	Issue	1	9-9-21 Cuando se finaliza la campaña de SBC stand alone	2021-09-22 20:34:52.676604	f
223	455	Issue	1	None	2021-09-22 20:34:55.107099	f
224	455	Issue	1	None	2021-09-22 20:34:56.362377	f
225	455	Issue	1	None	2021-09-22 20:34:56.927589	f
226	455	Issue	1	1) Realizar inventario del material inspeccionado y almacenar en el C-05.  (A.I: M.Ferrer)\r\n2) Solicitar a quien corresponda que no abra los paquetes que son para el LIE. (A.I: N.Balbi)\r\n3) De ser necesaria la inspección, solicitar que primeramente consulten con GIC si el ítem en cuestión necesita de requerimientos específicos de manipuleo (como control ESD o apertura en ambiente ISO 7/8). Además, se debe comunicar el procedimiento aplicable para tal fin y enviar a GIC el reporte de recepción correspondiente. NOTA: el procedimiento que se use debe estar aprobado por GIC. Si no se dispone de procedimiento aplicable, puede utilizarse el documento “LIE-LYT-PR-00003-A PRODECIMIENTO DE INSPECCION E INGRESO DE COMPONENTES”. (A.I: N.Balbi) 	2021-09-22 20:34:57.976053	f
230	455	Issue	1	1) Realizar inventario del material inspeccionado y almacenar en el C-05.  (A.I: M.Ferrer)\r\n2) Solicitar a quien corresponda que no abra los paquetes que son para el LIE. (A.I: N.Balbi)\r\n3) De ser necesaria la inspección, solicitar que primeramente consulten con GIC si el ítem en cuestión necesita de requerimientos específicos de manipuleo (como control ESD o apertura en ambiente ISO 7/8). Además, se debe comunicar el procedimiento aplicable para tal fin y enviar a GIC el reporte de recepción correspondiente. NOTA: el procedimiento que se use debe estar aprobado por GIC. Si no se dispone de procedimiento aplicable, puede utilizarse el documento “LIE-LYT-PR-00003-A PRODECIMIENTO DE INSPECCION E INGRESO DE COMPONENTES”. (A.I: N.Balbi)	2021-09-22 20:35:03.51459	f
231	455	Issue	1	None	2021-09-22 20:35:05.955941	f
232	455	Issue	1	None	2021-09-22 20:35:07.374582	f
233	455	Issue	1	None	2021-09-22 20:35:09.885684	f
234	455	Issue	1	1) Se realiza inventario del material inspeccionado y se almacena en el C-05.\r\n2) Solicitar a quién corresponda, que no abra los paquetes que son para el LIE. \r\n3) De ser necesaria la inspección, se solicita que primeramente consulten con GIC si el ítem en cuestión necesita de requerimientos específicos de manipuleo (como control ESD o apertura en ambiente ISO 7/8). Además, deben comunicar el procedimiento aplicable para tal fin y enviar a GIC el reporte de recepción correspondiente. NOTA: el procedimiento que usen debe estar aprobado por GIC. Si no se dispone de procedimiento aplicable, puede utilizar el documento “LIE-LYT-PR-00003-A PRODECIMIENTO DE INSPECCION E INGRESO DE COMPONENTES”.	2021-09-22 20:35:10.677149	f
235	455	Issue	1	None	2021-09-22 20:35:12.83109	f
236	455	Issue	1	None	2021-09-22 20:35:13.417902	f
237	455	Issue	1	None	2021-09-22 20:35:14.189276	f
238	455	Issue	1	None	2021-09-22 20:35:17.045473	f
239	455	Issue	1	None	2021-09-22 20:35:18.148271	f
240	455	Issue	1	None	2021-09-22 20:35:20.701473	f
241	455	Issue	1	None	2021-09-22 20:35:22.187449	f
242	455	Issue	1	None	2021-09-22 20:35:23.047304	f
243	455	Issue	1	None	2021-09-22 20:35:24.395581	f
244	455	Issue	1	None	2021-09-22 20:35:26.761037	f
245	455	Issue	1	None	2021-09-22 20:35:28.302831	f
246	455	Issue	1	None	2021-09-22 20:35:28.753285	f
247	455	Issue	1	None	2021-09-22 20:35:29.207592	f
248	455	Issue	1	Retrabajar los defectos detectados en el KIP	2021-09-22 20:35:29.788115	f
249	455	Issue	1	None	2021-09-22 20:35:30.707233	f
250	455	Issue	1	None	2021-09-22 20:35:31.141462	f
251	455	Issue	1	1.- Devolver componentes al storage (A.I.: N.ATENCIO)\r\n2.- Realizar pedido de compra de los integrados con el encapsulado correspondiente. (A.I.: F.AGHEMO)\r\n3.- Confirmar pedido de compra (A.I.: F.AGHEMO) \r\n4.- Actualizar BOM (A.I.: N.ATENCIO)\r\n5.- Actualizar Traveler de INTEGRACION 1_ “1/2 EGSE PM OBC – SABIA Mar” (LA2)  [Paso 10 y 11]  (A.I.: A.Ochoa)	2021-09-22 20:35:31.637524	f
252	455	Issue	1	None	2021-09-22 20:35:32.626365	f
253	455	Issue	1	None	2021-09-22 20:35:33.155649	f
254	455	Issue	1	None	2021-09-22 20:35:33.642374	f
316	444	Issue	1	None	2021-09-22 20:36:55.425106	f
317	444	Issue	1	None	2021-09-22 20:36:56.396265	f
256	438	Issue	1	Se generara un set de nueva documentación: Esquemático (si aplica), pcbDoc y Gerber, BOM y lista de poblado (si aplica), mapa de poblado (si aplica)\r\n29-10 Vinculada al rediseño de los PCB\r\n12-11  Modificación en curso\r\n4-2-21  VENG nos va a enviar un update ya que todavia se estan trabajando	2021-09-22 20:35:34.776323	f
257	438	Issue	1	None	2021-09-22 20:35:35.208997	f
258	438	Issue	1	25-2-21 El 22-2 se envia a CONAE para OK final la documentación de la IAB, además se envia para comienzo de corrección/aprobación la documentación asociada a la SBC y BKP	2021-09-22 20:35:36.783672	f
259	438	Issue	1	None	2021-09-22 20:35:37.948067	f
260	438	Issue	1	NRB#1\r\nFecha: 20-04-21\r\nParticipantes:  Damian Fernandez, Anibal Ambrosino, Manuel Alvarez, Nicolas Balbi, Alejandro Perez, Marcos Ferrer, Stephan Schindler, Gerardo Ortiz y Alicia Alvarez\r\n\r\n-\tSe realiza revisión del documento SB-050403-RG-00300-D y se comparte nueva versión (DF)\r\n-\tDamian va a pasar un memo con los puntos que consideran que faltan para que VENG los verifique mencionados en el documento USI-ELE-RP-00001-A\r\n-\tSe coordina nueva reunión para próximo martes 27\r\n-\tVeng realiza reuniones internas para análisis de reportes previo al martes 27	2021-09-22 20:35:38.432382	f
261	438	Issue	1	Para el modelo FM se rediseñara el PCB para incorporar los cambios de la figura adjunta y el footprint correspondiente al Switch de Reset. En el caso de la Rs para TRST y TCK se observa que en el resto de los PCBs están conectados pero con una R de 2.7K por lo que se debe aclarar que ese valor es válido si se conecta el Daisy Chain, sino dichas Rs se deben cambiar a 1K. Se generará un set de nueva documentación: Esquemático (si aplica), pcbDoc y Gerber, BOM y lista de poblado (si aplica), mapa de poblado (si aplica)	2021-09-22 20:35:39.398678	f
262	438	Issue	1	24-6  En proceso de fabricación	2021-09-22 20:35:39.829617	f
263	438	Issue	1	None	2021-09-22 20:35:40.388872	f
282	440	Issue	1	None	2021-09-22 20:36:07.655436	f
283	440	Issue	1	9-9-21  Se propone para cierre con la herramienta modificada, a definir si se trabaja alguna herramienta más y se incluye como cierre de la NC.	2021-09-22 20:36:08.126477	f
284	441	Issue	1	29-10 El plano ya está modificado.  A citar los entregables en el reporte.  Manuel le consulta a Eduardo sobre novedades de las acciones.\r\n12-11  La modificación realizada.  Queda pendiente el reporte final\r\n19-11  Va junto a reporte general de todas las modificaciones\r\n4-2-21  VENG nos va a enviar un update ya que todavía se están trabajando	2021-09-22 20:36:09.253372	f
285	441	Issue	1	None	2021-09-22 20:36:09.737996	f
301	442	Issue	1	15/07/2021: posterior a la verificacion de requerimiento L4 , es posible realizar el cierre de esta NC	2021-09-22 20:36:37.031441	f
302	442	Issue	1	9-9-21 Se cierra una vez ensayados y OK los L4 de la SBC	2021-09-22 20:36:38.645884	f
303	443	Issue	1	Se generara un set de nueva documentación: Esquemático (si aplica), pcbDoc y Gerber, BOM y lista de poblado (si aplica), mapa de poblado (si aplica)\r\n29-10 NC cerrada por Villa Elisa.  2 primeras acciones están cerradas.  A verificar documentación si esta OK para el cierre.\r\n12-11  Consultar la OC de las carcazas para ver a que cables corresponden, DF.	2021-09-22 20:36:39.216093	f
304	443	Issue	1	None	2021-09-22 20:36:41.516823	f
305	443	Issue	1	El archivo SB-050403-MM-00100-B SABIA-Mar Memo - PM-OBC Analisis del Driver de la Flash y EEPROM del Bootloader (y del BSW) BL 2.0 y BL 2.3 23-09-2019 (2)\r\nexcede el tamaño de carga	2021-09-22 20:36:43.296119	f
306	443	Issue	1	25-2-21 El 22-2 se envia a CONAE para OK final la documentación de la IAB, además se envia para comienzo de corrección/aprobación la documentación asociada a la SBC y BKP	2021-09-22 20:36:43.717214	f
307	443	Issue	1	None	2021-09-22 20:36:45.226012	f
308	443	Issue	1	NRB#1\r\nFecha: 20-04-21\r\nParticipantes:  Damian Fernandez, Anibal Ambrosino, Manuel Alvarez, Nicolas Balbi, Alejandro Perez, Marcos Ferrer, Stephan Schindler, Gerardo Ortiz y Alicia Alvarez\r\n\r\n-\tSe realiza revisión del documento SB-050403-RG-00300-D y se comparte nueva versión (DF)\r\n-\tDamian va a pasar un memo con los puntos que consideran que faltan para que VENG los verifique mencionados en el documento USI-ELE-RP-00001-A\r\n-\tSe coordina nueva reunión para próximo martes 27\r\n-\tVeng realiza reuniones internas para análisis de reportes previo al martes 27	2021-09-22 20:36:45.675835	f
309	443	Issue	1	24-6  En proceso de fabricación	2021-09-22 20:36:46.648103	f
310	443	Issue	1	None	2021-09-22 20:36:47.49685	f
311	443	Issue	1	15/07/21: Reportes de  modificacion de PCBs ya emitidos.Se estan revisando librerias de los modelos fm del 2 lote con el fin de liberarlo para compra.	2021-09-22 20:36:48.20733	f
312	444	Issue	1	05/11/2020: SE GENERAL LISTA DE SEGUIMIENTO DE ACCIONES:  SBM-OBC-NC-00019 Problemas en mapeado de pin out harness de EGSE PM-OBC \r\n29-10 Se hizo la revisión, pero hay dudas.  Se solicita NRB con participación de ambas partes técnicas (AA)\r\n5-11  Se realizó NRB hoy y se definió lista de seguimiento con acciones\r\n12-11  NB realiza acciones y NA incluye en el cronograma de tareas	2021-09-22 20:36:49.916467	f
313	444	Issue	1	None	2021-09-22 20:36:50.598341	f
314	444	Issue	1	None	2021-09-22 20:36:54.18429	f
265	438	Issue	1	Se sigue en esta NC los actions ítems de la AC#6\r\n\r\nNotas de Damian Fernandez al respecto:\r\n\r\nCOM_DAM: OK para cerra AC y dar seguimiento desde la NCR 16. Exportar Reporte de la AC6 junto a todos los documentos adjuntos de la UAM y subirlos a Redmine explicando que se continúa el seguimiento desde la NC.\r\n\r\nIncluir en la NC el problema del JTAG del UT699. Ver con Ale Perez.\r\n\r\nNOTA: Agregar al listado de acciones pendientes de la NC lo solicitado.	2021-09-22 20:35:42.936886	f
266	438	Issue	1	Se sigue en esta NC los actions ítems de la AC#6\r\n\r\nNotas de Damian Fernandez al respecto:\r\n\r\nCOM_DAM: OK para cerra AC y dar seguimiento desde la NCR 16. Exportar Reporte de la AC6 junto a todos los documentos adjuntos de la UAM y subirlos a Redmine explicando que se continúa el seguimiento desde la NC.\r\n\r\nIncluir en la NC el problema del JTAG del UT699. Ver con Ale Perez.\r\n\r\nNOTA: Agregar al listado de acciones pendientes de la NC lo solicitado.	2021-09-22 20:35:43.911176	f
267	438	Issue	1	Se sigue en esta NC los actions ítems de la AC#6\r\n\r\nNotas de Damian Fernandez al respecto:\r\n\r\nCOM_DAM: OK para cerrar AC y dar seguimiento también desde desde la NCR 16. Exportar Reporte de la AC7 junto a todos los documentos adjuntos de la UAM y subirlos a Redmine explicando que se continúa el seguimiento desde la NC.\r\n\r\nQuedará pendiente la verificación de programar con las frecuencias Default de programación una vez se cuente con cables apropiados para confirmar que la causa raíz y descartar problemas de deformación de las señales a nivel placa.\r\n\r\nNOTA: Agregar al listado de acciones pendientes de la NC lo solicitado.	2021-09-22 20:35:45.485377	f
268	438	Issue	1	9-9-21  Lo revisa AP para proponer para el cierre	2021-09-22 20:35:47.425905	f
269	439	Issue	1	29-10 Vinculada al rediseño de los PCB.\r\n5-11 A confirmar con Eduardo y Alejandro.  \r\nVerificar disposición sobre pad levantado en la NC del LIE. MA\r\n12-11  La modificación está en curso	2021-09-22 20:35:51.992696	f
270	439	Issue	1	None	2021-09-22 20:35:54.393436	f
271	439	Issue	1	25-2-21 El 22-2 se envia a CONAE para OK final la documentación de la IAB, además se envia para comienzo de corrección/aprobación la documentación asociada a la SBC y BKP	2021-09-22 20:35:55.321877	f
272	439	Issue	1	None	2021-09-22 20:35:57.289601	f
273	439	Issue	1	NRB#1\r\nFecha: 20-04-21\r\nParticipantes:  Damian Fernandez, Anibal Ambrosino, Manuel Alvarez, Nicolas Balbi, Alejandro Perez, Marcos Ferrer, Stephan Schindler, Gerardo Ortiz y Alicia Alvarez\r\n\r\n-\tSe realiza revisión del documento SB-050403-RG-00300-D y se comparte nueva versión (DF)\r\n-\tDamian va a pasar un memo con los puntos que consideran que faltan para que VENG los verifique mencionados en el documento USI-ELE-RP-00001-A\r\n-\tSe coordina nueva reunión para próximo martes 27\r\n-\tVeng realiza reuniones internas para análisis de reportes previo al martes 27	2021-09-22 20:35:58.569903	f
274	439	Issue	1	24-6  En proceso de fabricación	2021-09-22 20:36:00.019338	f
275	439	Issue	1	None	2021-09-22 20:36:00.621583	f
276	439	Issue	1	15/07/21: Reportes de  modificacion de PCBs ya emitidos.Se estan revisando librerias de los modelos fm del 2 lote con el fin de liberarlo para compra.	2021-09-22 20:36:02.30387	f
277	440	Issue	1	29-10 A confirmar status con el LIE\r\n5-11 no se empezó la fabricación de la herramienta, se estaría comenzando en el transcurso de noviembre\r\n4-2-21  Se realizó la herramienta, se prueba en la próxima integración, una vez que funciono sin problema, estaría lista para cierre	2021-09-22 20:36:03.328784	f
278	440	Issue	1	None	2021-09-22 20:36:03.928146	f
279	440	Issue	1	Disposición:  Rework - Para la SBC EM se alinearan los conectores sin utilizar la herramienta, para las futuras placas se mecanizara la herramienta para rebajarle los laterales.  Se debe aguardar el retrabajo de la herramienta  y su prueba para obtener la evidencia de su funcionamiento.	2021-09-22 20:36:04.906081	f
280	440	Issue	1	None	2021-09-22 20:36:05.414313	f
281	440	Issue	1	24-6  La herramienta se esta usando, presentar evidencia que esta siendo funcional y esta disponible para el cierre	2021-09-22 20:36:05.880105	f
286	441	Issue	1	25-2-21 El 22-2 se envia a CONAE para OK final la documentación de la IAB, además se envia para comienzo de corrección/aprobación la documentación asociada a la SBC y BKP	2021-09-22 20:36:12.173647	f
287	441	Issue	1	Disposición:  Rework - Para el modelo EM se utilizará la placa como esta ya que la misma fue fabricada, se genero un documento de reparación para el proceso de workmanship. Para el modelo FM se corregirá el PCB con el footprint correspondiente .Se generara un set de nueva documentación: pcbDoc y Gerber, mapa de poblado 	2021-09-22 20:36:14.155636	f
288	441	Issue	1	None	2021-09-22 20:36:14.64934	f
289	441	Issue	1	NRB#1\r\nFecha: 20-04-21\r\nParticipantes:  Damian Fernandez, Anibal Ambrosino, Manuel Alvarez, Nicolas Balbi, Alejandro Perez, Marcos Ferrer, Stephan Schindler, Gerardo Ortiz y Alicia Alvarez\r\n\r\n-\tSe realiza revisión del documento SB-050403-RG-00300-D y se comparte nueva versión (DF)\r\n-\tDamian va a pasar un memo con los puntos que consideran que faltan para que VENG los verifique mencionados en el documento USI-ELE-RP-00001-A\r\n-\tSe coordina nueva reunión para próximo martes 27\r\n-\tVeng realiza reuniones internas para análisis de reportes previo al martes 27	2021-09-22 20:36:15.092457	f
290	441	Issue	1	24-6  En proceso de fabricación	2021-09-22 20:36:22.706607	f
291	441	Issue	1	None	2021-09-22 20:36:24.785724	f
292	441	Issue	1	None	2021-09-22 20:36:25.706367	f
293	441	Issue	1	15/07/21: Reportes de  modificacion de PCBs ya emitidos.Se estan revisando librerias de los modelos fm del 2 lote con el fin de liberarlo para compra.	2021-09-22 20:36:27.030304	f
294	442	Issue	1	29-10 Manuel lo revisa con Eduardo.\r\n10-12  Se hizo un PEER review con CONAE e INVAP, quedo la revisión 2,6, con esto se podría dar ok final ya testeada para el cierre de la NC.  MA sube la info a la NC y al DMS para validar el cierre.	2021-09-22 20:36:30.736318	f
295	442	Issue	1	None	2021-09-22 20:36:31.485186	f
296	442	Issue	1	None	2021-09-22 20:36:32.017062	f
297	442	Issue	1	Disposición:  Se rechaza el código fuente del Bootloader v2.3, en el adjunto "SB-050403-MM-00100-B SABIA-Mar Memo - PM-OBC Análisis del Driver de la Flash y EEPROM del Bootloader (y del BSW) BL 2.0 y BL 2.3 23-09-2019" se presenta una solución integral para la codificación.\r\nHasta la fecha el riesgo que representa el proveedor sigue en WATCH sin mitigación alguna dispuesta por parte del Proyecto.\r\n Mayo/junio 2020: Se realiza peer review de bootloader con INVAP y CONAE, en donde se analiza la forma y el contenido de la codificación del bootloader V 2.5.  \r\nSe acuerdan metodologías de trabajo y codificación de acuerdo al standar BSSC2000_C_and_C++_Coding_Standards. (enviada por correo G.González (09-06-2020) y de este peer review se genera la versión de BL 2.6 candidate released.\r\n	2021-09-22 20:36:32.449267	f
298	442	Issue	1	24-6 MA tiene que revisar y estaría lista para el cierre	2021-09-22 20:36:33.903929	f
299	442	Issue	1	None	2021-09-22 20:36:34.259338	f
300	442	Issue	1	None	2021-09-22 20:36:35.076013	f
315	444	Issue	1	24-6  Lo revisa MA con NB	2021-09-22 20:36:54.703916	f
318	444	Issue	1	9-9-21 MA y NB revisan los pedidos de modificaciones.	2021-09-22 20:37:00.660259	f
319	444	Issue	1	16-9-21\r\n\r\nHoy hubo NRB, en proceso de trabajo.	2021-09-22 20:37:01.892078	f
320	445	Issue	1	Para el modelo EM se utilizara el PCB como se encuentra, para el modelo FM se debe rediseñar el gerber limpiando las zonas que requieran contacto térmico de mascara soldante\r\n\r\nSe generará un set de nueva documentación: pcbDoc y Gerber, mapa de poblado (si aplica)\r\n29-10 Están en modificación de los planos.\r\n12-11  Modificación realizada para la SBC FM e IAB.  Faltaria reporte final.\r\n19-11  Va junto a reporte general de todas las modificaciones\r\n4-2-21  VENG nos va a enviar un update ya que todavia se estan trabajando	2021-09-22 20:37:02.756077	f
321	445	Issue	1	None	2021-09-22 20:37:05.043453	f
322	445	Issue	1	25-2-21 El 22-2 se envia a CONAE para OK final la documentación de la IAB, además se envia para comienzo de corrección/aprobación la documentación asociada a la SBC y BKP	2021-09-22 20:37:06.538276	f
323	445	Issue	1	None	2021-09-22 20:37:07.702768	f
324	445	Issue	1	NRB#1\r\nFecha: 20-04-21\r\nParticipantes:  Damian Fernandez, Anibal Ambrosino, Manuel Alvarez, Nicolas Balbi, Alejandro Perez, Marcos Ferrer, Stephan Schindler, Gerardo Ortiz y Alicia Alvarez\r\n\r\n-\tSe realiza revisión del documento SB-050403-RG-00300-D y se comparte nueva versión (DF)\r\n-\tDamian va a pasar un memo con los puntos que consideran que faltan para que VENG los verifique mencionados en el documento USI-ELE-RP-00001-A\r\n-\tSe coordina nueva reunión para próximo martes 27\r\n-\tVeng realiza reuniones internas para análisis de reportes previo al martes 27	2021-09-22 20:37:08.197189	f
325	445	Issue	1	24-6  En proceso de fabricación	2021-09-22 20:37:10.083369	f
326	445	Issue	1	None	2021-09-22 20:37:10.897309	f
327	445	Issue	1	15/07/21: Reportes de  modificacion de PCBs ya emitidos.Se estan revisando librerias de los modelos fm del 2 lote con el fin de liberarlo para compra.	2021-09-22 20:37:12.016839	f
328	446	Issue	1	29-10 Se puede cerrar agregando puntos de inspección.  Damián le consulta a Gustavo González por causa raíz y acciones.\r\n12-11  Se van a realizar inspecciones de workmanship, se van a definir puntos de inspección.  MA habla con NB para que el procedimiento de integración de SBC y COM se cite el hacer foco en el punto en base a esta NC	2021-09-22 20:37:13.318285	f
329	446	Issue	1	None	2021-09-22 20:37:14.019179	f
330	446	Issue	1	Detectado durante: Proceso de practica de soldadura de componentes previo al poblado de placas\r\n\r\nDisposición: Se van a realizar inspecciones de workmanship, se van a definir puntos de inspección. En el procedimiento de integración de SBC y COM se cite el hacer foco en el punto en base a esta NC	2021-09-22 20:37:15.232579	f
331	446	Issue	1	None	2021-09-22 20:37:15.68477	f
332	446	Issue	1	24-6  Se realizaron las inspecciones, falta subir evidencia para el cierre.	2021-09-22 20:37:17.186507	f
333	446	Issue	1	None	2021-09-22 20:37:17.628236	f
334	446	Issue	1	9-9-21  VENG actualiza su NC, carga reportes y cierra.	2021-09-22 20:37:18.745054	f
335	447	Issue	1	VENG PM-OBC: Rediseño PCBs PM-OBC para FM\r\n29-10  Reporte vinculado a la NCR5.  En trabajo con AP\r\n12-11  Se investiga integración errada de componente RS-042226C32, ver si es necesaria trasladar la corrección a la GPIO y a la COM\r\n19-11  Acciones disparadas para ser corregidas en la PCB del FM\r\n A verificar los componentes que también se duplican en la COMM y la GPIO. AP\r\n10-12  Se incluyo como verificación del diseño para la placa COMM y GPIO\r\n4-2-21  VENG nos va a enviar un update ya que todavia se estan trabajando	2021-09-22 20:37:19.492701	f
336	447	Issue	1	VENG PM-OBC: Rediseno PCBs PM-OBC para FM\r\n29-10 En trabajo ahora con Alejandro Perez\r\n12-11  Modificaciones en curso, se emite reporte final\r\n19-11  Siguen en curso las acciones\r\n4-2-21  VENG nos va a enviar un up date ya que todavia se estan trabajando	2021-09-22 20:37:20.056928	f
337	447	Issue	1	None	2021-09-22 20:37:20.725577	f
338	447	Issue	1	El archivo SBM-STI-OBC-PR-00037-B - Procedimiento de Reparación para SBC EM excede el tamaño de carga	2021-09-22 20:37:21.37702	f
339	447	Issue	1	25-2-21 El 22-2 se envia a CONAE para OK final la documentación de la IAB, además se envia para comienzo de corrección/aprobación la documentación asociada a la SBC y BKP	2021-09-22 20:37:22.886533	f
340	447	Issue	1	None	2021-09-22 20:37:24.271099	f
341	447	Issue	1	NRB#1\r\nFecha: 20-04-21\r\nParticipantes:  Damian Fernandez, Anibal Ambrosino, Manuel Alvarez, Nicolas Balbi, Alejandro Perez, Marcos Ferrer, Stephan Schindler, Gerardo Ortiz y Alicia Alvarez\r\n\r\n-\tSe realiza revisión del documento SB-050403-RG-00300-D y se comparte nueva versión (DF)\r\n-\tDamian va a pasar un memo con los puntos que consideran que faltan para que VENG los verifique mencionados en el documento USI-ELE-RP-00001-A\r\n-\tSe coordina nueva reunión para próximo martes 27\r\n-\tVeng realiza reuniones internas para análisis de reportes previo al martes 27	2021-09-22 20:37:24.696295	f
342	447	Issue	1	24-6  En proceso de fabricación	2021-09-22 20:37:25.617057	f
343	447	Issue	1	None	2021-09-22 20:37:26.879377	f
344	447	Issue	1	15/07/21: Reportes de  modificacion de PCBs ya emitidos.Se estan revisando librerias de los modelos fm del 2 lote con el fin de liberarlo para compra.	2021-09-22 20:37:27.904129	f
345	448	Issue	1	VENG PM-OBC: Rediseno PCBs PM-OBC para FM\r\n29-10 En trabajo ahora con Alejandro Perez\r\n12-11  Modificaciones en curso, se emite reporte final\r\n19-11  Siguen en curso las acciones\r\n4-2-21  VENG nos va a enviar un up date ya que todavia se estan trabajando	2021-09-22 20:37:29.02526	f
346	448	Issue	1	None	2021-09-22 20:37:30.445545	f
347	448	Issue	1	25-2-21  El 22-2 se envia a CONAE para OK final la documentación de la IAB, además se envia para comienzo de corrección/aprobación la documentación asociada a la SBC y BKP	2021-09-22 20:37:31.299292	f
348	448	Issue	1	None	2021-09-22 20:37:32.14578	f
349	448	Issue	1	NRB#1\r\nFecha: 20-04-21\r\nParticipantes:  Damian Fernandez, Anibal Ambrosino, Manuel Alvarez, Nicolas Balbi, Alejandro Perez, Marcos Ferrer, Stephan Schindler, Gerardo Ortiz y Alicia Alvarez\r\n\r\n-\tSe realiza revisión del documento SB-050403-RG-00300-D y se comparte nueva versión (DF)\r\n-\tDamian va a pasar un memo con los puntos que consideran que faltan para que VENG los verifique mencionados en el documento USI-ELE-RP-00001-A\r\n-\tSe coordina nueva reunión para próximo martes 27\r\n-\tVeng realiza reuniones internas para análisis de reportes previo al martes 27\r\n\r\n	2021-09-22 20:37:32.595728	f
350	448	Issue	1	24-6  En proceso de fabricación	2021-09-22 20:37:33.488479	f
351	448	Issue	1	None	2021-09-22 20:37:35.812255	f
352	448	Issue	1	15/07/21: Reportes de  modificacion de PCBs ya emitidos.Se estan revisando librerias de los modelos fm del 2 lote con el fin de liberarlo para compra.	2021-09-22 20:37:37.038372	f
412	426	Issue	1		2021-09-24 14:05:05.965503	f
414	424	Issue	1		2021-09-24 14:09:06.92468	f
416	423	Issue	1		2021-09-24 14:18:12.150112	f
417	423	Issue	1		2021-09-24 14:19:13.975026	f
418	418	Issue	1		2021-09-24 14:21:14.53299	f
353	455	Issue	1	Habiendo cumplimentado lo solicitado por la NRB anterior se emite reporte SBM-OBC-RP-00013-A “Reporte técnico No Conformidad SBM-OBC-NC-00011”\r\nEn donde se detallan las tareas realizadas sobre el EGSE y se finaliza con el EGSE armado en y listo para su uso sin volver a observar la falla antes mencionada.\r\nNo se cierra la NC hasta que sea utilizado nuevamente el EGSE monitoreando su funcionameiento	2021-09-22 20:37:38.6084	f
354	455	Issue	1	None	2021-09-22 20:37:39.807851	f
355	455	Issue	1	None	2021-09-22 20:37:40.885754	f
356	455	Issue	1	None	2021-09-22 20:37:41.727957	f
357	455	Issue	1	12-11  MA la revisa con AP y EK	2021-09-22 20:37:42.346447	f
358	455	Issue	1	18-2  En revisión con AP a ver si es menor o no clasifica como NC.	2021-09-22 20:37:43.081615	f
359	455	Issue	1	None	2021-09-22 20:37:46.022668	f
360	455	Issue	1	None	2021-09-22 20:37:46.590747	f
361	455	Issue	1	None	2021-09-22 20:37:47.076071	f
362	455	Issue	1	None	2021-09-22 20:37:47.535149	f
363	455	Issue	1	se sigue lista de acciones NR-00098_SBC_EM_Listado_Seguimiento_No_Conformidad_Correcciones_del_bootloader.xlsx.	2021-09-22 20:37:48.147072	f
364	455	Issue	1	None	2021-09-22 20:37:49.220454	f
365	455	Issue	1	None	2021-09-22 20:37:50.420575	f
366	455	Issue	1	None	2021-09-22 20:37:51.291249	f
367	455	Issue	1	None	2021-09-22 20:37:51.75284	f
368	455	Issue	1	Actualizar procedimiento de ensayo de síntesis de la programación de FPGA\r\nResolver BUGS de VHDl versión 1.0	2021-09-22 20:37:52.671754	f
369	455	Issue	1	None	2021-09-22 20:37:54.375115	f
370	455	Issue	1	None	2021-09-22 20:37:54.797681	f
371	455	Issue	1	None	2021-09-22 20:37:55.274397	f
372	455	Issue	1	None	2021-09-22 20:37:55.731656	f
373	453	Issue	1	08-11-19: Se convoca a la NRB compuesto por E.Kunysz, A.Ambrosino,  M.Barrea, N.Balbi y M.Alvarez) donde se dispone:\r\n1-\tClasificar esta NC como mayor debido a la participación del proyecto. REALIZADO (M.Alvarez 08-11-19)\r\n2-\tSe debe incluir en todos los procedimientos de medición sobre hardware las consideraciones de safety que se enuncian a continuación: \r\n          - no se debe realizar sobre los pines sino sobre los pads,\r\n          - no se debe utilizar las puntas del tester directamente sino con cables con punta prestañada       vinculada a las puntas de medición, remarcando que en ningún momento debe haber contacto directo de puntas de medición con las patas de los componentes y en casos en los que sea necesario se debe convocar a una reunión para su análisis.\r\n   (AI: E.Kunysz)\r\n3-\tIncluir una modalidad de trabajo general para todas las tareas que incluyan los pasos mínimos que garantice que los trabajos se realicen de una manera segura. Incluir TRR y PTR para los ensayos. \r\n(AI: N.Balbi/E.Kunysz/M.Alvarez)\r\n4-\tPlanificación de los ensayos. Tener la actividad planificada permite contar con las personas necesarias para implementar la metodología mencionada en el punto 4. (AI: E.Kunysz / N.Balbi)\r\n5-\tRetrabajo. Queda pendiente este análisis por parte del proyecto Sabiamar. (A.I: G.Gonzalez / A.Ambrosino)\r\n6-\tIncluir dentro de la no conformidad generada (NC-00096), los nombres y las personas que participaron en las tareas.  REALIZADO (M.Alvarez 08-11-19)\r\n29-10 A confirmar si se habilita el retrabajo (Damian)\r\n12-11 MA consulta con responsable de LIE si es posible realizacion del retrabajo en las memorias\r\n19-11  Realizar inspección ocular de la placa para definir la mejor alternativa de retrabajo. Para esto tiene que estar disponible la placa en Córdoba.  \r\n14-11  la SBC ya está en Córdoba, una vez que se libere del ensayo de performance, se  buscara la posibilidad de esta inspección para su posible retrabajo.\r\n4-2-21  Se define mejor no tocar la placa y se cierra la NC como use as is.  MA envia el reporte con esta aclaracion para poder cerrar el reporte de la NCR22	2021-09-22 20:37:56.398864	f
374	453	Issue	1	None	2021-09-22 20:37:56.837822	f
375	453	Issue	1	Detectado durante:  Test de verificación de continuidad en banco de memorias	2021-09-22 20:37:57.244886	f
376	453	Issue	1	None	2021-09-22 20:37:57.822048	f
377	453	Issue	1	En reunión de PA VENG, CONAE e Ingeniería del 29-4-21 se acuerda que la NC debe ser MENOR quedando lista para el cierre con disposicion USE AS IS	2021-09-22 20:37:58.425596	f
378	453	Issue	1	None	2021-09-22 20:37:58.969582	f
379	454	Issue	1	se siguen acciones listadas en NR-00092 SBC_EM_Listado_Seguimiento_No_Conformidad_Perdida_trazabilidad_Proyecto_PCB	2021-09-22 20:37:59.629172	f
380	454	Issue	1	11-3-21  Consultar con E Kunys cual es el alcance de la no conformidad, si aplica solo a la SBC e IAB, o es extensiva a las demás.\r\nConsultar el criterio por el que se toma como representativos de lo fabricado como EM a los siguientes archivos de la lista de seguimiento:\r\nPCB_doc_r20953  documento para la SBC\r\nPCB_doc_r18294 documento para la IAB	2021-09-22 20:38:01.567411	f
381	454	Issue	1	None	2021-09-22 20:38:02.160656	f
382	454	Issue	1	Detectado durante  transicion sti-veng\r\n\r\nDisposición: Se seguirá lista de acciones del documento: SBM-OBC-NC-00004 SBC_EM_Listado_Seguimiento_No_Conformidad_Perdida_trazabilidad_Proyecto_PCB 	2021-09-22 20:38:02.599301	f
383	454	Issue	1	24-6  MA lo tiene que revisar con NB, AP y EK para completar con lo realizado, estaria para el cierre una vez completo	2021-09-22 20:38:03.772517	f
384	454	Issue	1	None	2021-09-22 20:38:04.332567	f
385	454	Issue	1	None	2021-09-22 20:38:05.005565	f
386	454	Issue	1	9-9-21 Se cierra con los reportes finales de las modificaciones de los PCBs.  Esta implementada, faltan los reportes.	2021-09-22 20:38:06.525532	f
387	455	Issue	1	Se siguen las acciones listadas en NR-00090_Listado_Seguimiento_No_Conformidad_Problema_ejecucion_rev515_20200116.xlsx	2021-09-22 20:38:07.905084	f
388	455	Issue	1	None	2021-09-22 20:38:09.128811	f
389	455	Issue	1	None	2021-09-22 20:38:09.6062	f
390	456	Issue	1	None	2021-09-22 20:38:10.689699	f
391	456	Issue	1	None	2021-09-22 20:38:11.685775	f
392	456	Issue	1	None	2021-09-22 20:38:12.951738	f
393	456	Issue	1	None	2021-09-22 20:38:13.495182	f
394	456	Issue	1	9-9-21  Enviar mail a NB, MF y AP para solicitar la inclusión del MIP y el stacking	2021-09-22 20:38:14.840635	f
395	457	Issue	1	Con respecto a la unidad PM-OBC EM, la misma se debe retrabajar, en el documento adjunto se encuentran los detalles.\r\nCon respecto a la inexperiencia del personal involucrado, se elevo al proyecto el riesgo correspondiente que afecta a todas las tareas de la PM-OBC tanto EM como FM y se manejara a nivel riesgo siendo responsabilidad de la gestión del proyecto la mitigacion del riesgo.	2021-09-22 20:38:15.465178	f
396	457	Issue	1	None	2021-09-22 20:38:18.607059	f
397	457	Issue	1	None	2021-09-22 20:38:19.560417	f
398	454	Issue	1		2021-09-24 13:24:06.913882	f
399	448	Issue	1		2021-09-24 13:28:17.572391	f
400	447	Issue	1		2021-09-24 13:29:39.272474	f
401	446	Issue	1		2021-09-24 13:33:31.988783	f
402	445	Issue	1		2021-09-24 13:35:00.575594	f
403	444	Issue	1		2021-09-24 13:37:42.267088	f
404	443	Issue	1		2021-09-24 13:40:12.780026	f
405	441	Issue	1		2021-09-24 13:41:51.859658	f
406	439	Issue	1		2021-09-24 13:45:38.290058	f
407	438	Issue	1		2021-09-24 13:51:22.899077	f
408	438	Issue	1		2021-09-24 13:52:10.654063	f
409	428	Issue	1		2021-09-24 13:53:13.572602	f
410	427	Issue	1		2021-09-24 13:56:18.33475	f
411	428	Issue	1		2021-09-24 13:57:32.129323	f
419	415	Issue	1		2021-09-24 14:22:15.502116	f
420	413	Issue	1		2021-09-24 14:23:34.372399	f
422	410	Issue	1		2021-09-24 14:25:26.388743	f
424	398	Issue	1		2021-09-24 14:29:36.053594	f
426	384	Issue	1		2021-09-24 14:33:45.366087	f
429	380	Issue	1		2021-09-24 14:40:16.214449	f
421	412	Issue	1		2021-09-24 14:24:21.049769	f
423	409	Issue	1		2021-09-24 14:27:03.144486	f
425	393	Issue	1		2021-09-24 14:30:35.455638	f
427	381	Issue	1		2021-09-24 14:37:29.170973	f
428	380	Issue	1		2021-09-24 14:39:29.763971	f
430	379	Issue	1		2021-09-24 14:41:26.157915	f
431	378	Issue	1		2021-09-24 14:51:43.034521	f
432	378	Issue	1		2021-09-24 14:54:22.130543	f
433	378	Issue	1		2021-09-24 14:56:26.991535	f
434	378	Issue	1		2021-09-24 14:58:20.889978	f
435	378	Issue	1		2021-09-24 14:59:31.90944	f
436	378	Issue	1		2021-09-24 15:02:38.752339	f
437	378	Issue	1		2021-09-24 15:04:13.91368	f
438	378	Issue	1		2021-09-24 15:05:19.547202	f
439	377	Issue	1		2021-09-24 15:11:03.267409	f
440	376	Issue	1		2021-09-24 15:11:50.055632	f
441	375	Issue	1		2021-09-24 15:12:39.298517	f
442	374	Issue	1		2021-09-24 15:13:43.933874	f
443	373	Issue	1		2021-09-24 15:21:19.660893	f
444	373	Issue	1		2021-09-24 15:22:38.863522	f
445	373	Issue	1		2021-09-24 15:24:08.607428	f
446	373	Issue	1		2021-09-24 15:24:35.18464	f
447	371	Issue	1		2021-09-24 15:38:53.082083	f
448	367	Issue	1		2021-09-24 15:44:42.646724	f
449	366	Issue	1		2021-09-24 15:46:23.617784	f
450	454	Issue	1		2021-09-24 16:11:40.730775	f
451	411	Issue	1		2021-09-24 16:16:07.95081	f
452	440	Issue	1		2021-09-24 16:18:33.922677	f
453	384	Issue	1		2021-09-27 16:15:17.629554	f
454	384	Issue	1		2021-09-27 16:20:46.726127	f
455	428	Issue	1		2021-09-27 16:22:34.397412	f
456	424	Issue	1		2021-09-27 16:23:31.556271	f
457	424	Issue	1		2021-09-27 16:23:40.334315	f
458	424	Issue	1		2021-09-27 16:23:53.008793	f
459	424	Issue	1		2021-09-27 16:23:58.039165	f
460	373	Issue	1		2021-09-27 17:19:25.259797	f
461	378	Issue	1		2021-09-27 18:03:09.570109	f
462	378	Issue	1		2021-09-27 18:08:53.951238	f
463	409	Issue	1	\N	2021-09-27 18:44:20.717227	f
464	410	Issue	1	\N	2021-09-27 18:44:20.850222	f
465	414	Issue	1	\N	2021-09-27 18:44:21.064863	f
466	365	Issue	1	\N	2021-09-27 18:44:35.101424	f
467	368	Issue	1	\N	2021-09-27 18:44:58.787283	f
468	382	Issue	1	\N	2021-09-27 18:44:58.972989	f
469	383	Issue	1	\N	2021-09-27 18:44:59.162061	f
470	416	Issue	1	\N	2021-09-27 18:44:59.342571	f
471	417	Issue	1	\N	2021-09-27 18:44:59.541043	f
472	418	Issue	1	\N	2021-09-27 18:44:59.710262	f
473	419	Issue	1	\N	2021-09-27 18:44:59.898416	f
474	420	Issue	1	\N	2021-09-27 18:45:00.111744	f
475	421	Issue	1	\N	2021-09-27 18:45:00.308851	f
476	422	Issue	1	\N	2021-09-27 18:45:00.484314	f
477	423	Issue	1	\N	2021-09-27 18:45:00.696144	f
478	424	Issue	1	\N	2021-09-27 18:45:00.896602	f
479	367	Issue	1	\N	2021-09-27 18:45:12.716535	f
480	371	Issue	1	\N	2021-09-27 18:45:48.959934	f
481	415	Issue	1	\N	2021-09-27 18:45:49.113944	f
482	358	Issue	1	\N	2021-09-27 18:47:30.591207	f
483	359	Issue	1	\N	2021-09-27 18:47:30.766035	f
484	360	Issue	1	\N	2021-09-27 18:47:30.956151	f
485	361	Issue	1	\N	2021-09-27 18:47:31.140086	f
486	362	Issue	1	\N	2021-09-27 18:47:31.349594	f
487	363	Issue	1	\N	2021-09-27 18:47:31.533941	f
488	364	Issue	1	\N	2021-09-27 18:47:31.725242	f
489	366	Issue	1	\N	2021-09-27 18:47:31.891741	f
490	369	Issue	1	\N	2021-09-27 18:47:32.20352	f
491	370	Issue	1	\N	2021-09-27 18:47:32.465756	f
492	372	Issue	1	\N	2021-09-27 18:47:32.665208	f
493	373	Issue	1	\N	2021-09-27 18:47:32.876467	f
494	374	Issue	1	\N	2021-09-27 18:47:33.109157	f
495	375	Issue	1	\N	2021-09-27 18:47:33.259826	f
496	376	Issue	1	\N	2021-09-27 18:47:33.436095	f
497	377	Issue	1	\N	2021-09-27 18:47:33.612433	f
498	378	Issue	1	\N	2021-09-27 18:47:33.791271	f
499	379	Issue	1	\N	2021-09-27 18:47:33.981197	f
500	380	Issue	1	\N	2021-09-27 18:47:34.31548	f
501	381	Issue	1	\N	2021-09-27 18:47:34.476613	f
502	384	Issue	1	\N	2021-09-27 18:47:34.667906	f
503	385	Issue	1	\N	2021-09-27 18:47:34.888967	f
504	386	Issue	1	\N	2021-09-27 18:47:35.075988	f
505	387	Issue	1	\N	2021-09-27 18:47:35.264486	f
506	388	Issue	1	\N	2021-09-27 18:47:35.447078	f
507	389	Issue	1	\N	2021-09-27 18:47:35.653983	f
508	390	Issue	1	\N	2021-09-27 18:47:35.836808	f
509	391	Issue	1	\N	2021-09-27 18:47:36.01649	f
510	392	Issue	1	\N	2021-09-27 18:47:36.20539	f
511	393	Issue	1	\N	2021-09-27 18:47:36.363487	f
512	394	Issue	1	\N	2021-09-27 18:47:36.555728	f
513	395	Issue	1	\N	2021-09-27 18:47:36.732248	f
514	396	Issue	1	\N	2021-09-27 18:47:36.91277	f
515	397	Issue	1	\N	2021-09-27 18:47:37.099919	f
516	398	Issue	1	\N	2021-09-27 18:47:37.25424	f
517	399	Issue	1	\N	2021-09-27 18:47:37.450789	f
518	400	Issue	1	\N	2021-09-27 18:47:37.625541	f
519	401	Issue	1	\N	2021-09-27 18:47:37.797294	f
520	402	Issue	1	\N	2021-09-27 18:47:37.978122	f
521	403	Issue	1	\N	2021-09-27 18:47:38.187635	f
522	404	Issue	1	\N	2021-09-27 18:47:38.367314	f
523	405	Issue	1	\N	2021-09-27 18:47:38.542892	f
524	406	Issue	1	\N	2021-09-27 18:47:38.713615	f
525	407	Issue	1	\N	2021-09-27 18:47:38.890849	f
526	408	Issue	1	\N	2021-09-27 18:47:39.068232	f
527	411	Issue	1	\N	2021-09-27 18:47:39.228398	f
528	412	Issue	1	\N	2021-09-27 18:47:39.42422	f
529	413	Issue	1	\N	2021-09-27 18:47:39.579007	f
530	425	Issue	1	\N	2021-09-27 18:47:39.764444	f
531	426	Issue	1	\N	2021-09-27 18:47:39.947439	f
532	427	Issue	1	\N	2021-09-27 18:47:40.162673	f
533	428	Issue	1	\N	2021-09-27 18:47:40.337848	f
534	429	Issue	1	\N	2021-09-27 18:47:40.56471	f
535	430	Issue	1	\N	2021-09-27 18:47:40.772652	f
536	431	Issue	1	\N	2021-09-27 18:47:40.95507	f
537	432	Issue	1	\N	2021-09-27 18:47:41.124943	f
538	433	Issue	1	\N	2021-09-27 18:48:28.561231	f
539	434	Issue	1	\N	2021-09-27 18:48:28.750251	f
540	435	Issue	1	\N	2021-09-27 18:48:28.915592	f
541	436	Issue	1	\N	2021-09-27 18:48:29.10954	f
542	437	Issue	1	\N	2021-09-27 18:48:29.29335	f
543	438	Issue	1	\N	2021-09-27 18:48:29.466257	f
544	439	Issue	1	\N	2021-09-27 18:48:29.619523	f
545	440	Issue	1	\N	2021-09-27 18:48:29.833404	f
546	441	Issue	1	\N	2021-09-27 18:48:30.043745	f
547	442	Issue	1	\N	2021-09-27 18:48:30.218965	f
548	443	Issue	1	\N	2021-09-27 18:48:30.427549	f
549	444	Issue	1	\N	2021-09-27 18:48:30.591485	f
550	445	Issue	1	\N	2021-09-27 18:48:30.823837	f
551	446	Issue	1	\N	2021-09-27 18:48:30.980766	f
552	447	Issue	1	\N	2021-09-27 18:48:31.162509	f
553	448	Issue	1	\N	2021-09-27 18:48:31.37638	f
554	449	Issue	1	\N	2021-09-27 18:48:31.554769	f
555	450	Issue	1	\N	2021-09-27 18:48:31.772062	f
556	451	Issue	1	\N	2021-09-27 18:48:31.947968	f
557	452	Issue	1	\N	2021-09-27 18:48:32.137974	f
558	453	Issue	1	\N	2021-09-27 18:48:32.29117	f
559	454	Issue	1	\N	2021-09-27 18:48:32.497514	f
560	455	Issue	1	\N	2021-09-27 18:48:32.658202	f
561	456	Issue	1	\N	2021-09-27 18:48:32.835465	f
562	457	Issue	1	\N	2021-09-27 18:48:33.00425	f
563	336	Issue	1	\N	2021-09-27 18:49:01.490414	f
564	337	Issue	1	\N	2021-09-27 18:49:01.748902	f
565	338	Issue	1	\N	2021-09-27 18:49:01.953132	f
566	339	Issue	1	\N	2021-09-27 18:49:02.141357	f
567	340	Issue	1	\N	2021-09-27 18:49:02.320603	f
568	341	Issue	1	\N	2021-09-27 18:49:02.496381	f
569	342	Issue	1	\N	2021-09-27 18:49:02.668641	f
570	343	Issue	1	\N	2021-09-27 18:49:02.84667	f
571	344	Issue	1	\N	2021-09-27 18:49:03.011824	f
572	345	Issue	1	\N	2021-09-27 18:49:03.20775	f
573	346	Issue	1	\N	2021-09-27 18:49:03.391607	f
574	347	Issue	1	\N	2021-09-27 18:49:03.569104	f
575	348	Issue	1	\N	2021-09-27 18:49:03.745314	f
576	349	Issue	1	\N	2021-09-27 18:49:03.93263	f
577	350	Issue	1	\N	2021-09-27 18:49:04.119274	f
578	351	Issue	1	\N	2021-09-27 18:49:04.269874	f
579	352	Issue	1	\N	2021-09-27 18:49:04.478308	f
580	353	Issue	1	\N	2021-09-27 18:49:04.650273	f
581	354	Issue	1	\N	2021-09-27 18:49:04.858034	f
582	355	Issue	1	\N	2021-09-27 18:49:05.070253	f
583	356	Issue	1	\N	2021-09-27 18:49:05.254357	f
584	357	Issue	1	\N	2021-09-27 18:49:05.436034	f
585	456	Issue	1		2021-11-05 12:52:51.487086	f
586	455	Issue	1		2021-11-05 12:52:51.492891	f
587	456	Issue	1		2021-11-05 12:53:02.606999	f
588	452	Issue	1		2021-11-05 12:53:02.611764	f
589	456	Issue	1		2021-11-05 12:53:13.044962	f
590	452	Issue	1		2021-11-05 12:53:13.049514	f
591	456	Issue	1		2021-11-05 12:53:15.083179	f
592	455	Issue	1		2021-11-05 12:53:15.08771	f
593	457	Issue	1		2021-11-23 14:31:48.152984	f
595	457	Issue	1		2021-11-23 14:32:50.440544	f
597	453	Issue	1		2021-11-23 14:33:36.360409	f
599	453	Issue	1		2021-11-23 14:34:21.647622	f
603	453	Issue	1		2021-11-23 14:38:25.029714	f
607	469	Issue	1		2021-11-24 11:44:38.974603	f
608	470	Issue	1		2021-11-24 11:44:38.9794	f
609	463	Issue	1	\N	2021-11-24 13:45:47.392622	f
610	464	Issue	1	\N	2021-11-24 13:45:47.53303	f
611	465	Issue	1	\N	2021-11-24 13:45:47.737156	f
612	466	Issue	1	\N	2021-11-24 13:45:47.947635	f
613	467	Issue	1	\N	2021-11-24 13:45:48.182403	f
614	468	Issue	1	\N	2021-11-24 13:45:48.464007	f
615	469	Issue	1	\N	2021-11-24 13:45:48.721036	f
616	470	Issue	1	\N	2021-11-24 13:45:48.990624	f
617	471	Issue	1	\N	2021-11-24 13:45:49.256054	f
618	472	Issue	1	\N	2021-11-24 13:45:49.531176	f
619	473	Issue	1	\N	2021-11-24 13:45:49.817041	f
620	474	Issue	1	\N	2021-11-24 13:45:50.102533	f
621	475	Issue	1	\N	2021-11-24 13:45:50.394608	f
622	476	Issue	1	\N	2021-11-24 13:45:50.629454	f
623	477	Issue	1	\N	2021-11-24 13:45:50.889364	f
624	478	Issue	1	\N	2021-11-24 13:45:51.147865	f
625	463	Issue	1	\N	2021-11-24 13:49:51.617103	f
626	464	Issue	1	\N	2021-11-24 13:49:51.765997	f
627	465	Issue	1	\N	2021-11-24 13:49:51.941084	f
628	466	Issue	1	\N	2021-11-24 13:49:52.142895	f
629	467	Issue	1	\N	2021-11-24 13:49:52.394789	f
630	468	Issue	1	\N	2021-11-24 13:49:52.664606	f
631	469	Issue	1	\N	2021-11-24 13:49:52.922118	f
632	470	Issue	1	\N	2021-11-24 13:49:53.207316	f
633	471	Issue	1	\N	2021-11-24 13:49:53.467984	f
634	472	Issue	1	\N	2021-11-24 13:49:53.72965	f
635	473	Issue	1	\N	2021-11-24 13:49:54.016944	f
636	474	Issue	1	\N	2021-11-24 13:49:54.30262	f
637	475	Issue	1	\N	2021-11-24 13:49:54.581569	f
638	476	Issue	1	\N	2021-11-24 13:49:54.816636	f
639	477	Issue	1	\N	2021-11-24 13:49:55.080401	f
640	478	Issue	1	\N	2021-11-24 13:49:55.342176	f
641	479	Issue	1		2021-12-01 14:10:51.532274	f
642	479	Issue	1		2021-12-01 14:11:26.578336	f
643	479	Issue	1		2021-12-01 14:11:41.263944	f
644	480	Issue	1		2021-12-01 14:11:41.267966	f
645	483	Issue	1		2021-12-01 14:32:25.868533	f
646	480	Issue	1	\N	2021-12-01 14:33:36.333209	f
647	481	Issue	1	\N	2021-12-01 14:33:36.445264	f
648	482	Issue	1	\N	2021-12-01 14:33:36.564314	f
649	462	Issue	1		2021-12-02 13:28:34.490698	f
650	462	Issue	1		2021-12-02 13:33:12.386866	f
656	509	Issue	1		2021-12-09 17:13:59.824514	f
657	511	Issue	1		2021-12-09 17:15:06.861957	f
658	510	Issue	1		2021-12-09 17:15:43.293811	f
659	512	Issue	1		2021-12-09 17:15:47.17693	f
660	515	Issue	1		2021-12-09 18:28:40.599549	f
661	516	Issue	1		2021-12-09 18:28:50.107816	f
662	517	Issue	1		2021-12-09 18:28:59.432584	f
663	518	Issue	1		2021-12-09 18:29:10.823472	f
664	519	Issue	1		2021-12-09 18:30:24.935006	f
665	520	Issue	1		2021-12-09 18:30:28.823171	f
666	521	Issue	1		2021-12-09 18:30:38.669062	f
667	522	Issue	1		2021-12-09 18:30:44.914099	f
668	523	Issue	1		2021-12-09 18:30:51.146436	f
669	524	Issue	1		2021-12-09 18:30:58.750675	f
670	525	Issue	1		2021-12-09 18:31:07.559931	f
671	526	Issue	1		2021-12-09 18:31:13.508583	f
672	513	Issue	1		2021-12-09 19:18:30.884613	f
673	457	Issue	1		2021-12-09 19:37:04.360432	f
674	513	Issue	1		2021-12-09 19:37:04.365934	f
675	513	Issue	1		2021-12-13 14:25:08.221536	f
676	451	Issue	1		2021-12-13 14:27:08.337807	f
677	513	Issue	1		2021-12-13 14:27:08.342823	f
678	533	Issue	1		2021-12-16 12:29:22.465597	f
679	534	Issue	1		2021-12-16 12:29:22.610722	f
680	535	Issue	1		2021-12-16 12:29:22.764175	f
\.


--
-- Data for Name: member_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.member_roles (id, member_id, role_id, inherited_from) FROM stdin;
1	1	3	\N
6	4	6	\N
27	25	5	\N
28	26	5	\N
29	27	5	\N
30	28	5	\N
31	29	6	6
32	27	5	30
33	30	6	6
34	31	5	30
35	32	5	\N
36	33	5	35
37	34	5	\N
38	35	5	37
39	36	5	37
40	37	5	\N
41	25	5	40
42	26	5	40
43	33	3	\N
45	38	5	\N
46	39	5	\N
66	59	4	\N
67	60	4	66
68	61	4	66
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.members (id, user_id, project_id, created_on, mail_notification, dmsf_mail_notification, dmsf_title_format, dmsf_fast_links) FROM stdin;
4	58	1	2021-11-02 15:10:57.522803	f	\N	\N	f
25	27	4	2021-12-13 12:21:04.765811	f	\N	\N	f
28	58	4	2021-12-16 12:39:16.408359	f	\N	\N	f
30	48	1	2021-12-20 18:49:58.62639	f	\N	\N	f
31	48	4	2021-12-20 18:49:58.638099	f	\N	\N	f
32	59	4	2021-12-20 18:52:38.265807	f	\N	\N	f
34	60	4	2021-12-20 18:56:57.668328	f	\N	\N	f
35	29	4	2021-12-20 18:56:57.681555	f	\N	\N	f
37	61	4	2021-12-20 18:57:42.321269	f	\N	\N	f
27	39	4	2021-12-13 12:21:04.808348	f	\N	\N	f
29	39	1	2021-12-20 18:49:58.59572	f	\N	\N	f
33	35	4	2021-12-20 18:52:38.278728	f	\N	\N	f
36	38	4	2021-12-20 18:56:57.692369	f	\N	\N	f
26	30	4	2021-12-13 12:21:04.798977	f	\N	\N	f
38	27	39	2022-02-02 19:59:00.683739	f	\N	\N	f
39	49	2	2022-02-03 18:25:54.148231	f	\N	\N	f
1	1	10	2021-09-20 13:25:03.00847	f	\N	\N	f
59	61	2	2022-02-16 14:05:16.528908	f	\N	\N	f
60	27	2	2022-02-16 14:05:16.54138	f	\N	\N	f
61	30	2	2022-02-16 14:05:16.552056	f	\N	\N	f
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.messages (id, board_id, parent_id, subject, content, author_id, replies_count, last_reply_id, created_on, updated_on, locked, sticky) FROM stdin;
\.


--
-- Data for Name: moved_issues; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.moved_issues (id, issue_id, old_key, old_number) FROM stdin;
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.news (id, project_id, title, summary, description, author_id, created_on, comments_count) FROM stdin;
\.


--
-- Data for Name: open_id_authentication_associations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.open_id_authentication_associations (id, issued, lifetime, handle, assoc_type, server_url, secret) FROM stdin;
\.


--
-- Data for Name: open_id_authentication_nonces; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.open_id_authentication_nonces (id, "timestamp", server_url, salt) FROM stdin;
\.


--
-- Data for Name: project_issue_keys; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.project_issue_keys (id, project_key, last_issue_number) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members, default_version_id, default_assigned_to_id, dmsf_description, dmsf_notification, dmsf_act_as_attachable, issue_key) FROM stdin;
86	8.3 Ground Segment Requirements 			t	83	2021-12-16 11:38:53.276519	2021-12-16 11:38:53.276519	ground-segment-requirements	1	165	166	f	\N	\N	\N	f	1	\N
85	8.2 Ground Segment Elements (GS Elements)			t	83	2021-12-16 11:38:04.944482	2021-12-16 11:38:04.944482	ground-segment-elements-gs-elements	1	137	164	f	\N	\N	\N	f	1	\N
83	8 Ground Segment (GS)			t	49	2021-12-16 11:37:02.688	2021-12-16 11:37:02.688	ground-segment-gs	1	134	167	f	\N	\N	\N	f	1	\N
87	8.2.4.4 Mission Center Requirements Verification			t	71	2021-12-16 11:42:15.695258	2021-12-16 11:42:15.695258	mission-center-requirements-verification	1	145	146	f	\N	\N	\N	f	1	\N
84	8.1 Ground Segment Management			t	83	2021-12-16 11:37:28.839953	2021-12-16 11:37:28.839953	ground-segment-management	1	135	136	t	\N	\N	\N	f	1	\N
51	1.1 Project Management			t	50	2021-12-14 12:15:08.449022	2021-12-14 12:15:08.449022	project-mng	1	93	94	f	\N	\N	\N	f	1	\N
55	1.5 Cost & Schedule			t	50	2021-12-14 12:19:28.342741	2021-12-14 12:19:28.342741	cost-schedule	1	101	102	f	\N	\N	\N	f	1	\N
74	8.2.4.3 Mission Center Interface Design			t	71	2021-12-16 11:28:31.065489	2021-12-16 11:28:31.065489	mission-center-interface-design	1	143	144	f	\N	\N	\N	f	1	\N
8	REQ TOOL			f	\N	2021-09-16 17:47:21.052435	2021-09-23 15:35:59.222062	req-tool	1	27	88	f	\N	\N	\N	f	1	\N
10	SABIA-Mar Mission Requirements			f	8	2021-09-16 17:47:25.281884	2021-09-23 15:37:11.254939	sabia-mar-mission-requirements	1	30	85	f	\N	\N	\N	f	1	\N
11	L1			f	10	2021-09-16 17:47:28.446064	2021-09-23 15:37:15.789234	l1	1	31	34	f	\N	\N	\N	f	1	\N
19	L2B-SYS			f	16	2021-09-16 17:47:46.933769	2021-09-23 15:38:54.90804	l2b-sys	1	45	46	f	\N	\N	\N	f	1	\N
20	L3			f	10	2021-09-16 17:47:48.611839	2021-09-23 15:39:08.314457	l3	1	49	64	f	\N	\N	\N	f	1	\N
72	8.2.4.1 L4 Mission Center Requirements			t	71	2021-12-16 11:27:49.058211	2021-12-16 11:27:49.058211	l4-mission-center-requirements	1	139	140	f	\N	\N	\N	f	1	\N
23	L3 FLIGHT SEGMENT			f	20	2021-09-16 17:47:55.767499	2021-09-23 15:40:27.043376	flight-segment	1	54	55	f	\N	\N	\N	f	1	\N
79	8.2.4.6.1.2.1  TI Core Component Development 			t	78	2021-12-16 11:31:27.396167	2021-12-16 11:45:25.685843	ti-core-component-development	1	152	153	f	\N	\N	\N	f	1	\N
81	8.2.4.6.1.2.3 Log Monitor Development 			t	78	2021-12-16 11:33:19.772935	2022-02-14 17:17:01.463061	log-monitor-development	1	156	157	f	\N	\N	\N	f	1	\N
24	L3 GROUND SEGMENT 			f	20	2021-09-16 17:47:59.405061	2021-09-23 15:40:38.649588	ground-segment	1	56	61	f	\N	\N	\N	f	1	\N
4	Document Management System			f	\N	2021-09-16 17:47:12.064916	2021-09-23 15:34:03.640648	dms	1	3	4	f	\N	\N	\N	f	1	\N
7	Waivers & Deviations			f	1	2021-09-16 17:47:20.089972	2021-09-23 15:35:52.643336	waivers-deviations	1	24	25	f	\N	\N	\N	f	1	\N
48	Reliability Tracking Matrix			t	1	2021-12-01 14:03:44.026622	2021-12-01 18:26:18.655287	reliability	1	22	23	f	\N	\N	\N	f	1	\N
39	CCM Tool			f	\N	2021-09-22 13:57:23.594678	2021-09-30 20:11:11.935886	configuration-control-management	1	1	2	f	\N	\N	\N	f	1	\N
40	Engineering Change Requests			f	\N	2021-09-22 14:02:46.618768	2021-09-30 20:13:20.963612	ecr	9	5	6	f	\N	\N	\N	f	1	\N
37	L4-OPS			f	36	2021-09-16 17:48:31.905415	2021-09-23 15:49:28.33396	l4-ops	1	81	82	f	\N	\N	\N	f	1	\N
27	L3 LAUNCH SEGMENT			f	20	2021-09-16 17:48:08.11636	2021-09-23 15:52:07.685581	launch-segment	1	62	63	f	\N	\N	\N	f	1	\N
21	L3 APPLICATION SEGMENT			f	20	2021-09-16 17:47:51.304635	2021-09-23 15:36:46.985996	application-segment	1	50	53	f	\N	\N	\N	f	1	\N
61	2. 4 Project Verification & Validation			t	57	2021-12-14 12:26:10.768037	2021-12-14 12:36:57.498651	project-verification-validation	1	113	114	f	\N	\N	\N	f	1	\N
63	3.1 SMA Management			t	62	2021-12-14 12:38:09.182067	2021-12-14 12:38:09.182067	sma-management	1	117	118	f	\N	\N	\N	f	1	\N
64	3.2 System Safety			t	62	2021-12-14 12:38:34.57882	2021-12-14 12:38:34.57882	system-safety	1	119	120	f	\N	\N	\N	f	1	\N
82	8.2.4.6.2 Mission Center Planning Subsystem (MCP Subsystem)			t	76	2021-12-16 11:34:23.128128	2021-12-16 11:34:23.128128	mission-center-planning-subsystem-mcp-subsystem	1	160	161	f	\N	\N	\N	f	1	\N
35	L4-VIS-NIR			f	31	2021-09-16 17:48:26.962547	2021-09-23 15:44:02.466452	l4-vis-nir	1	77	78	f	\N	\N	\N	f	1	\N
13	L2			f	10	2021-09-16 17:47:32.362331	2021-09-23 15:37:45.627922	l2	1	35	48	f	\N	\N	\N	f	1	\N
9	SABIA-Mar Inputs for Requirements			f	8	2021-09-16 17:47:23.012315	2021-09-23 15:37:00.567369	sabia-mar-inputs-for-requirements	1	28	29	f	\N	\N	\N	f	1	\N
12	L1-MIS			f	11	2021-09-16 17:47:30.483181	2021-09-23 15:37:20.804878	l1-mis	1	32	33	f	\N	\N	\N	f	1	\N
14	L2A			f	13	2021-09-16 17:47:35.717994	2021-09-23 15:37:56.309365	l2a	1	36	39	f	\N	\N	\N	f	1	\N
46	Critical Items			t	1	2021-11-24 13:51:03.394593	2021-11-24 13:51:03.394593	critical-items	1	10	11	f	\N	\N	\N	f	1	\N
53	1.3 Project Planning			t	50	2021-12-14 12:18:22.745467	2021-12-14 12:18:22.745467	project-planning	1	97	98	f	\N	\N	\N	f	1	\N
54	1.4 Project Reviews			t	50	2021-12-14 12:18:53.676624	2021-12-14 12:18:53.676624	project-reviews	1	99	100	f	\N	\N	\N	f	1	\N
45	Non Standard EEE Parts			t	1	2021-11-24 13:37:21.104791	2021-11-24 13:37:21.104791	non-standard-eee-parts	1	18	19	f	\N	\N	\N	f	1	\N
47	Declared Materials, Mechanical Parts And Processes			t	1	2021-11-29 12:12:46.666991	2021-11-29 12:12:46.666991	declared-materials-mechanical-parts-and-processes	1	12	13	f	\N	\N	\N	f	1	\N
15	L2A-SCI			f	14	2021-09-16 17:47:37.770789	2021-09-23 15:38:07.44086	l2a-sci	1	37	38	f	\N	\N	\N	f	1	\N
17	L2B-ERD			f	16	2021-09-16 17:47:41.598895	2021-09-23 15:38:30.258099	l2b-env	1	41	42	f	\N	\N	\N	f	1	\N
18	L2B-SMARD			f	16	2021-09-16 17:47:43.377736	2021-09-23 15:38:43.085108	l2b-spa	1	43	44	f	\N	\N	\N	f	1	\N
44	Revisors Tool			f	\N	2021-11-02 12:13:28.308753	2021-11-02 12:13:28.308753	revisors-tool	1	89	90	f	\N	\N	\N	f	1	\N
50	1 Project Management			t	49	2021-12-14 12:13:36.680364	2021-12-14 12:29:12.008704	project-management	1	92	105	f	\N	\N	\N	f	1	\N
77	8.2.4.6.1 Mission Center Technological Infraestructure Subsystem (MCTI Subsystem)			t	76	2021-12-16 11:29:35.84313	2021-12-16 11:43:23.814147	mission-center-technological-infraestructure-subsystem-mcti-subsystem	1	150	159	f	\N	\N	\N	f	1	\N
78	8.2.4.6.1.2 Mission Center Technological Infraestructure Units Development (MCTI Units Development)			t	77	2021-12-16 11:31:02.377869	2021-12-16 11:47:21.79194	mission-center-technological-infraestructure-units-development-mcti-units-development	1	151	158	f	\N	\N	\N	f	1	\N
1	Project Tracking Tool	The closed-loop tracking control tool system enables the identification, segregation, reporting, review, disposition, analysis, corrective actions, re-verification and prevention of recurrence of confirmed or suspected nonconformances and all others QA records from SABIA-Mar project.		f	\N	2021-08-25 17:13:00.097876	2021-09-23 15:34:13.047602	project-tracking-tool	1	7	26	f	\N	\N	\N	f	1	\N
2	Non Conformances	This section encompase the closed-loop nonconformance control system that enables the identification, segregation, reporting, review, disposition, analysis, corrective actions, re-verification and prevention of recurrence of confirmed or suspected nonconformances.\r\n\r\np=. *SABIA-Mar Nonconformance Management Plan*\r\nCONAE Document: "SB-030101-PL-00100 RELEASE: A":https://10.77.141.11/dmsf/files/88/view\r\nDATE: October 08, 2018		f	1	2021-08-25 17:14:40.211296	2021-09-23 15:34:24.848778	non-conformances	1	16	17	f	\N	\N	\N	f	1	\N
57	2 System Engineering			t	49	2021-12-14 12:23:20.104061	2021-12-14 12:23:20.104061	system-engineering	1	106	115	f	\N	\N	\N	f	1	\N
59	2.2 Mission Design			t	57	2021-12-14 12:24:39.299249	2021-12-14 12:36:40.118587	mission-design	1	109	110	f	\N	\N	\N	f	1	\N
60	2.3 Software Engineering			t	57	2021-12-14 12:25:43.488738	2021-12-14 12:36:49.125443	software-engineering	1	111	112	f	\N	\N	\N	f	1	\N
49	WBS			t	\N	2021-12-07 12:00:10.28634	2021-12-07 12:00:10.28634	wbs	1	91	168	f	\N	\N	\N	f	1	\N
68	3.6 Contamination Control			t	62	2021-12-14 12:44:43.478089	2021-12-14 12:44:43.478089	contamination-control	1	127	128	f	\N	\N	\N	f	1	\N
65	3.3 Environments			t	62	2021-12-14 12:39:35.612725	2021-12-14 12:39:35.612725	environments	1	121	122	f	\N	\N	\N	f	1	\N
69	3.7 Quality Assurance 			t	62	2021-12-14 12:49:08.265004	2021-12-14 12:49:08.265004	quality-assurance	1	129	130	f	\N	\N	\N	f	1	\N
62	3 Safety & Mission Assurance			t	49	2021-12-14 12:26:41.070974	2021-12-14 12:26:41.070974	safety-mission-assurance	1	116	133	f	\N	\N	\N	f	1	\N
70	3.8 Operations Assurance			t	62	2021-12-14 12:50:23.223769	2021-12-14 12:50:23.223769	operations-assurance	1	131	132	f	\N	\N	\N	f	1	\N
52	1. 2 Risk Management			t	50	2021-12-14 12:16:12.397757	2021-12-14 12:16:12.397757	risk-management	1	95	96	f	\N	\N	\N	f	1	\N
66	3.5 Electrical, Electronic and Electromechanical Parts, Materials & Processes (EEE Parts, Materials & Processes)			t	62	2021-12-14 12:41:36.521076	2021-12-14 12:42:42.667557	electrical-electronic-and-electromechanical-parts-materials-processes-eee-parts-materials-processes	1	125	126	f	\N	\N	\N	f	1	\N
6	Project Risks			f	1	2021-09-16 17:47:18.376452	2021-09-23 15:34:37.480752	project-risks	1	20	21	f	\N	\N	\N	f	1	\N
56	1.6 Logistics & Facilities			t	50	2021-12-14 12:20:18.554485	2021-12-14 12:20:18.554485	logistics-facilities	1	103	104	f	\N	\N	\N	f	1	\N
43	Actions and Tasks			f	1	2021-09-30 19:52:40.514285	2021-09-30 20:13:29.465733	ai	1	8	9	f	\N	\N	\N	f	1	\N
5	Inputs for Tracking	“Input for tracking” (registering new items)\r\n\r\nThe objective of this process is to manage both the gathering of inputs for evidences about current project activities, and the elaboration of final reports of utitlity for making desisions.\r\n\r\n!{height: 300px; width: 300px;}https://sabiamar-pms.conae.gov.ar/dmsf/files/178/view!\r\n\r\nThe process points to gather knowledge from all project developers participants, during all the Project Life Cycle, including the nominal operations and the final disposal phase.\r\n\r\nThe process includes some sort of preliminary treatment of any received input for contributions including grouping them by topic and assigning an unique codification in order to be later referred unequivocally.\r\n\r\nNOTICE: There is no problem with having duplicate entries in the “input for tracking” data base, both the tool and the process are prepared to deal with these duplications and get rid of them before delivering the set of final registers.\r\n\r\nThe procedure for adding inputs for nonconformances, risks or deviations items is detailed in [here].		f	1	2021-09-16 17:47:14.395728	2021-09-30 20:18:49.430392	inputs-for-tracking	1	14	15	f	\N	\N	\N	f	1	\N
25	L3-GS			f	24	2021-09-16 17:48:01.726222	2021-09-23 15:41:41.023114	l3gs	1	57	58	f	\N	\N	\N	f	1	\N
26	L3-OPS			f	24	2021-09-16 17:48:03.90757	2021-09-23 15:41:53.054458	l3-ops	1	59	60	f	\N	\N	\N	f	1	\N
28	L4			f	10	2021-09-16 17:48:09.703333	2021-09-23 15:42:14.309083	l4	1	65	84	f	\N	\N	\N	f	1	\N
29	L4 APPLICATION SEGMENT			f	28	2021-09-16 17:48:11.392825	2021-09-23 15:42:28.648514	application-segment1	1	66	69	f	\N	\N	\N	f	1	\N
30	L4-APP			f	29	2021-09-16 17:48:14.379049	2021-09-23 15:42:41.112991	l4-app	1	67	68	f	\N	\N	\N	f	1	\N
31	L4 FLIGHT SEGMENT			f	28	2021-09-16 17:48:16.570557	2021-09-23 15:42:58.027139	flight-segment1	1	70	79	f	\N	\N	\N	f	1	\N
32	L4-NIR-SWIR			f	31	2021-09-16 17:48:19.203145	2021-09-23 15:43:10.824729	l4-nir-swir	1	71	72	f	\N	\N	\N	f	1	\N
33	L4-PM-OBC			f	31	2021-09-16 17:48:22.098093	2021-09-23 15:43:24.672409	l4-pm-obc	1	73	74	f	\N	\N	\N	f	1	\N
75	8.2.4.5 Mission Center Integration and Test			t	71	2021-12-16 11:28:53.71884	2021-12-16 11:28:53.71884	mission-center-integration-and-test	1	147	148	f	\N	\N	\N	f	1	\N
34	L4-TIR			f	31	2021-09-16 17:48:24.662579	2021-09-23 15:43:37.487118	l4-tir	1	75	76	f	\N	\N	\N	f	1	\N
16	L2B			f	13	2021-09-16 17:47:39.974561	2021-09-23 15:46:37.00765	l2b	1	40	47	f	\N	\N	\N	f	1	\N
73	8.2.4.2 Mission Center Architectural Design			t	71	2021-12-16 11:28:07.985495	2021-12-16 11:28:07.985495	mission-center-architectural-design	1	141	142	f	\N	\N	\N	f	1	\N
67	3.4 Reliability			t	62	2021-12-14 12:44:06.466412	2021-12-14 12:44:06.466412	wp-reliability	1	123	124	f	\N	\N	\N	f	1	\N
71	8.2.4 Mission Center (MC)			t	85	2021-12-16 11:27:17.358216	2021-12-16 11:39:22.012884	mission-center-mc	1	138	163	f	\N	\N	\N	f	1	\N
58	2.1 System Engineering Management			t	57	2021-12-14 12:24:02.638314	2021-12-14 12:48:26.538477	system-engineering-management	1	107	108	f	\N	\N	\N	f	1	\N
36	L4  GROUND SEGMENT 			f	28	2021-09-16 17:48:29.294749	2021-09-23 15:44:15.836354	ground-segment1	1	80	83	f	\N	\N	\N	f	1	\N
38	SABIA-Mar Requirement Attachments	h3. Here you will find all the files and documents that will be attached to the requirements. Go to the +*DMS tab*+ to see the directory and file structure.		f	8	2021-09-16 17:48:33.713256	2021-09-30 20:34:00.257653	req-attachs	9	86	87	f	\N	\N	\N	f	1	\N
22	L3-APP			f	21	2021-09-16 17:47:53.316997	2021-09-23 15:47:22.183478	l3-app	1	51	52	f	\N	\N	\N	f	1	\N
76	8.2.4.6 Mission Center Subsystems			t	71	2021-12-16 11:29:14.274976	2021-12-16 11:29:14.274976	mission-center-subsystems	1	149	162	f	\N	\N	\N	f	1	\N
80	8.2.4.6.1.2.2 TI Status Monitor  Component Development 			t	78	2021-12-16 11:31:51.709298	2021-12-16 11:45:42.30753	ti-status-monitor-component-development	1	154	155	f	\N	\N	\N	f	1	\N
\.


--
-- Data for Name: projects_trackers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.projects_trackers (project_id, tracker_id) FROM stdin;
2	1
4	3
4	4
5	1
5	3
5	4
6	4
8	2
8	3
8	4
10	2
10	3
12	2
12	3
13	2
13	3
14	2
14	3
15	2
15	3
16	2
16	3
17	2
17	3
18	2
18	3
19	2
19	3
20	2
20	3
21	2
21	3
22	2
22	3
23	2
23	3
25	2
25	3
26	2
26	3
27	2
27	3
28	2
28	3
29	2
29	3
30	2
30	3
31	2
31	3
32	2
32	3
33	2
33	3
34	2
34	3
35	2
35	3
36	2
36	3
37	2
37	3
38	2
38	3
9	5
10	6
12	6
13	6
14	6
15	6
16	6
17	6
18	6
19	6
20	6
21	6
22	6
23	6
25	6
26	6
27	6
28	6
29	6
30	6
31	6
32	6
33	6
34	6
35	6
36	6
37	6
5	7
39	9
39	10
43	3
4	12
7	7
44	14
44	15
6	13
1	11
1	16
45	16
1	17
46	17
5	16
5	17
47	18
47	19
47	20
48	21
49	22
50	22
51	22
52	22
53	22
54	22
55	22
56	22
57	22
58	22
59	22
60	22
61	22
62	22
63	22
64	22
65	22
67	22
66	22
68	22
69	22
70	22
83	22
84	22
85	22
71	22
72	22
73	22
74	22
87	22
75	22
76	22
77	22
78	22
79	22
80	22
81	22
82	22
86	22
81	10
81	11
81	15
39	11
\.


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.queries (id, project_id, name, filters, user_id, column_names, sort_criteria, group_by, type, visibility, options) FROM stdin;
2	\N	2.1 All Current Open NC	---\nstatus_id:\n  :operator: o\n  :values:\n  - ''\ntracker_id:\n  :operator: "="\n  :values:\n  - '1'\ncf_2:\n  :operator: "="\n  :values:\n  - Major\n	1	---\n- :description\n- :subject\n- :start_date\n- :cf_1\n- :status\n- :cf_19\n- :cf_16\n- :cf_22\n- :cf_17\n	---\n- - subject\n  - asc\n- - id\n  - desc\n		IssueQuery	2	---\n:totalable_names: []\n:display_type: list\n:draw_relations: \n:draw_progress_line: \n:draw_selected_columns: \n
5	2	2.4 Invap All Open Mayor Minors	---\nstatus_id:\n  :operator: "*"\n  :values:\n  - ''\ncf_75:\n  :operator: "="\n  :values:\n  - INVAP\n	1	---\n- :subject\n- :cf_9\n- :cf_1\n- :status\n- :cf_2\n	---\n- - id\n  - desc\n		IssueQuery	2	---\n:totalable_names: []\n:display_type: list\n:draw_relations: \n:draw_progress_line: \n:draw_selected_columns: \n
4	2	2.3 NC VENG High Priority	---\nstatus_id:\n  :operator: o\n  :values:\n  - ''\ntracker_id:\n  :operator: "="\n  :values:\n  - '1'\npriority_id:\n  :operator: "="\n  :values:\n  - '2'\ncf_75:\n  :operator: "="\n  :values:\n  - VENG\n	1	---\n- :subject\n- :cf_9\n- :cf_1\n- :status\n- :cf_3\n	---\n- - id\n  - desc\n		IssueQuery	2	---\n:totalable_names:\n- :estimated_hours\n:display_type: list\n:draw_relations: \n:draw_progress_line: \n:draw_selected_columns: \n
3	2	2.2 VENG Open Majors	---\nstatus_id:\n  :operator: o\n  :values:\n  - ''\ncf_2:\n  :operator: "="\n  :values:\n  - Major\ncf_75:\n  :operator: "="\n  :values:\n  - VENG\n	1	---\n- :description\n- :last_notes\n- :subject\n- :start_date\n- :cf_1\n- :cf_16\n- :cf_22\n- :cf_17\n- :cf_19\n- :cf_23\n	---\n- - tracker\n  - asc\n		IssueQuery	2	---\n:totalable_names: []\n:display_type: list\n:draw_relations: \n:draw_progress_line: \n:draw_selected_columns: \n
6	2	2.5 ASCENTIO all open majors	---\nstatus_id:\n  :operator: o\n  :values:\n  - ''\ncf_75:\n  :operator: "="\n  :values:\n  - ASCENTIO\n	1	---\n- :subject\n- :cf_9\n- :cf_1\n- :status\n- :cf_2\n	---\n- - id\n  - desc\n		IssueQuery	2	---\n:totalable_names: []\n:display_type: list\n:draw_relations: \n:draw_progress_line: \n:draw_selected_columns: \n
7	2	2.6 MOOG All Open Mayor	---\nstatus_id:\n  :operator: o\n  :values:\n  - ''\ncf_75:\n  :operator: "="\n  :values:\n  - MOOG\n	1	---\n- :subject\n- :cf_9\n- :cf_1\n- :status\n- :cf_2\n- :cf_5\n	---\n- - tracker\n  - asc\n		IssueQuery	2	---\n:totalable_names: []\n:display_type: list\n:draw_relations: \n:draw_progress_line: \n:draw_selected_columns: \n
8	\N	2.0 All Major NCs	---\ncf_2:\n  :operator: "="\n  :values:\n  - Major\n	1	---\n- :description\n- :subject\n- :cf_1\n- :status\n- :cf_2\n- :cf_3\n- :cf_5\n	---\n- - subject\n  - asc\n		IssueQuery	2	---\n:totalable_names: []\n:display_type: list\n:draw_relations: \n:draw_progress_line: \n:draw_selected_columns: \n
9	39	filtro	---\nstatus_id:\n  :operator: "*"\n  :values:\n  - ''\ntracker_id:\n  :operator: "="\n  :values:\n  - '9'\nauthor_id:\n  :operator: "="\n  :values:\n  - me\n	1	---\n- :tracker\n- :status\n- :priority\n- :subject\n- :updated_on\n	---\n- - id\n  - desc\n		IssueQuery	0	---\n:totalable_names: []\n:display_type: list\n:draw_relations: \n:draw_progress_line: \n:draw_selected_columns: \n
10	48	Reliability view	---\nstatus_id:\n  :operator: o\n  :values:\n  - ''\ntracker_id:\n  :operator: "="\n  :values:\n  - '21'\n	1	---\n- :tracker\n- :subject\n- :cf_159\n- :author\n- :category\n- :fixed_version\n- :assigned_to\n- :status\n	---\n- - id\n  - desc\n		IssueQuery	0	---\n:totalable_names: []\n:display_type: list\n:draw_relations: \n:draw_progress_line: \n:draw_selected_columns: \n
11	\N	WBS view	---\nstatus_id:\n  :operator: o\n  :values:\n  - ''\ntracker_id:\n  :operator: "="\n  :values:\n  - '22'\n	1	---\n- :subject\n- :cf_1\n- :cf_164\n- :cf_165\n- :cf_166\n- :cf_35\n- :attachments\n	---\n- - subject\n  - asc\n- - parent\n  - asc\n		IssueQuery	0	---\n:totalable_names: []\n:display_type: list\n:draw_relations: \n:draw_progress_line: \n:draw_selected_columns: \n
12	4	DMS view	---\ntitle:\n  :operator: "~"\n  :values:\n  - ''\n	1	---\n- :id\n- :cf_48\n- :cf_171\n- :version\n- :cf_172\n- :workflow\n- :author\n- :cf_173\n- :cf_49\n- :cf_167\n- :cf_174\n- :cf_168\n	---\n- - title\n  - asc\n		DmsfQuery	2	---\n:totalable_names: []\n:display_type: list\n
\.


--
-- Data for Name: queries_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.queries_roles (query_id, role_id) FROM stdin;
\.


--
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.repositories (id, project_id, url, login, password, root_url, type, path_encoding, log_encoding, extra_info, identifier, is_default, created_on) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.roles (id, name, "position", assignable, builtin, permissions, issues_visibility, users_visibility, time_entries_visibility, all_roles_managed, settings) FROM stdin;
4	Consumer	2	t	0	---\n- :manage_public_queries\n- :save_queries\n- :view_dmsf_file_revision_accesses\n- :view_dmsf_file_revisions\n- :view_dmsf_folders\n- :user_preferences\n- :view_dmsf_files\n- :email_documents\n- :file_manipulation\n- :file_approval\n- :view_documents\n- :view_files\n- :view_issues\n- :view_news\n	default	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
1	Non member	0	t	1	---\n- :view_issues\n- :view_news\n- :view_messages\n	default	all	all	t	\N
2	Anonymous	0	t	2	---\n- :view_issues\n- :view_news\n- :view_messages\n	default	all	all	t	\N
5	Collaborator	3	t	0	---\n- :manage_public_queries\n- :save_queries\n- :view_dmsf_file_revision_accesses\n- :view_dmsf_file_revisions\n- :view_dmsf_folders\n- :user_preferences\n- :view_dmsf_files\n- :email_documents\n- :file_approval\n- :manage_workflows\n- :display_system_folders\n- :view_documents\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :add_issue_notes\n- :edit_own_issue_notes\n- :view_issue_watchers\n- :add_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_news\n- :comment_news\n	default	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
3	Administrator	1	t	0	---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_dmsf_file_revision_accesses\n- :view_dmsf_file_revisions\n- :view_dmsf_folders\n- :user_preferences\n- :view_dmsf_files\n- :email_documents\n- :folder_manipulation\n- :file_manipulation\n- :file_delete\n- :force_file_unlock\n- :file_approval\n- :manage_workflows\n- :display_system_folders\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_news\n- :manage_news\n- :comment_news\n	all	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
6	Contributor	4	t	0	---\n- :manage_public_queries\n- :save_queries\n- :view_dmsf_file_revision_accesses\n- :view_dmsf_file_revisions\n- :view_dmsf_folders\n- :user_preferences\n- :view_dmsf_files\n- :email_documents\n- :view_documents\n- :view_issues\n- :add_issues\n- :edit_own_issues\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_own_issue_notes\n- :set_notes_private\n- :add_issue_watchers\n- :view_news\n	default	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
\.


--
-- Data for Name: roles_managed_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.roles_managed_roles (role_id, managed_role_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.schema_migrations (version) FROM stdin;
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
20090214190337
20090312172426
20090312194159
20090318181151
20090323224724
20090401221305
20090401231134
20090403001910
20090406161854
20090425161243
20090503121501
20090503121505
20090503121510
20090614091200
20090704172350
20090704172355
20090704172358
20091010093521
20091017212227
20091017212457
20091017212644
20091017212938
20091017213027
20091017213113
20091017213151
20091017213228
20091017213257
20091017213332
20091017213444
20091017213536
20091017213642
20091017213716
20091017213757
20091017213835
20091017213910
20091017214015
20091017214107
20091017214136
20091017214236
20091017214308
20091017214336
20091017214406
20091017214440
20091017214519
20091017214611
20091017214644
20091017214720
20091017214750
20091025163651
20091108092559
20091114105931
20091123212029
20091205124427
20091220183509
20091220183727
20091220184736
20091225164732
20091227112908
20100129193402
20100129193813
20100221100219
20100313132032
20100313171051
20100705164950
20100819172912
20101104182107
20101107130441
20101114115114
20101114115359
20110220160626
20110223180944
20110223180953
20110224000000
20110226120112
20110226120132
20110227125750
20110228000000
20110228000100
20110401192910
20110408103312
20110412065600
20110511000000
20110902000000
20111201201315
20120115143024
20120115143100
20120115143126
20120127174243
20120205111326
20120223110929
20120301153455
20120422150750
20120705074331
20120707064544
20120714122000
20120714122100
20120714122200
20120731164049
20120930112914
20121026002032
20121026003537
20121209123234
20121209123358
20121213084931
20130110122628
20130201184705
20130202090625
20130207175206
20130207181455
20130215073721
20130215111127
20130215111141
20130217094251
20130602092539
20130710182539
20130713104233
20130713111657
20130729070143
20130911193200
20131004113137
20131005100610
20131124175346
20131210180802
20131214094309
20131215104612
20131218183023
20140228130325
20140903143914
20140920094058
20141029181752
20141029181824
20141109112308
20141122124142
20150113194759
20150113211532
20150113213922
20150113213955
20150208105930
20150510083747
20150525103953
20150526183158
20150528084820
20150528092912
20150528093249
20150705172511
20150725112753
20150730122707
20150730122735
20150921204850
20150921210243
20151020182334
20151020182731
20151021184614
20151021185456
20151021190616
20151024082034
20151025072118
20151031095005
20160404080304
20160416072926
20160519161300
20160529063352
20161001122012
20161002133421
20161010081301
20161010081528
20161010081600
20161126094932
20161220091118
20170207050700
20170302015225
20170309214320
20170320051650
20170418090031
20170419144536
20170723112801
20180501132547
20180913072918
20180923082945
20180923091603
20190206121100
20190315094151
20190315102101
20190510070108
20190620135549
20200826153401
20200826153402
1-redmine_dmsf
2-redmine_dmsf
3-redmine_dmsf
4-redmine_dmsf
5-redmine_dmsf
6-redmine_dmsf
7-redmine_dmsf
20120822100401-redmine_dmsf
20120822100402-redmine_dmsf
20120822100403-redmine_dmsf
20120822100404-redmine_dmsf
20130819013955-redmine_dmsf
20131108141401-redmine_dmsf
20131108141402-redmine_dmsf
20131113141401-redmine_dmsf
20131113141402-redmine_dmsf
20131113141403-redmine_dmsf
20140314132501-redmine_dmsf
20140519133201-redmine_dmsf
20141013102501-redmine_dmsf
20141015132701-redmine_dmsf
20141205143001-redmine_dmsf
20150120152101-redmine_dmsf
20150130052716-redmine_dmsf
20150202010301-redmine_dmsf
20150910153701-redmine_dmsf
20151020141801-redmine_dmsf
20151209100001-redmine_dmsf
20160215125801-redmine_dmsf
20160217133001-redmine_dmsf
20160222140401-redmine_dmsf
20160421150501-redmine_dmsf
20161223133200-redmine_dmsf
20170103164701-redmine_dmsf
20170118142001-redmine_dmsf
20170204214753-redmine_dmsf
20170214153223-redmine_dmsf
20170217141601-redmine_dmsf
20170323131231-redmine_dmsf
20170330131901-redmine_dmsf
20170421101901-redmine_dmsf
20170422104901-redmine_dmsf
20170526144701-redmine_dmsf
20171027124101-redmine_dmsf
20171110155901-redmine_dmsf
20180216152501-redmine_dmsf
20180903132101-redmine_dmsf
20192703123101-redmine_dmsf
20200218142414-redmine_dmsf
20200423071301-redmine_dmsf
20200813075501-redmine_dmsf
20210115120901-redmine_dmsf
1-issue_id
2-issue_id
3-issue_id
4-issue_id
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.settings (id, name, value, updated_on) FROM stdin;
1	rest_api_enabled	1	2021-09-16 17:36:16.853912
2	jsonp_enabled	1	2021-09-16 17:36:16.86687
4	default_projects_public	1	2021-09-17 14:34:53.104808
5	default_projects_modules	---\n- issue_tracking\n- time_tracking\n- news\n- documents\n- files\n- wiki\n- repository\n- boards\n- calendar\n- gantt\n- dmsf\n- visual_editor\n	2021-09-17 14:34:53.116852
6	default_projects_tracker_ids	--- []\n	2021-09-17 14:34:53.12563
7	sequential_project_identifiers	0	2021-09-17 14:34:53.141162
8	project_list_display_type	board	2021-09-17 14:34:53.156004
9	project_list_defaults	---\n:column_names:\n- name\n- identifier\n- short_description\n	2021-09-17 14:34:53.166998
10	plugin_redmine_wysiwyg_editor	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nvisual_editor_mode_switch_tab: '1'\n	2021-09-17 14:35:23.700156
11	app_title	Redmine	2021-09-30 20:08:16.553947
13	per_page_options	25,50,100	2021-09-30 20:08:16.590115
14	search_results_per_page	10	2021-09-30 20:08:16.598168
15	activity_days_default	10	2021-09-30 20:08:16.60671
16	host_name	localhost:3000	2021-09-30 20:08:16.614977
17	protocol	http	2021-09-30 20:08:16.623143
18	text_formatting	textile	2021-09-30 20:08:16.632774
19	cache_formatted_text	0	2021-09-30 20:08:16.639772
20	wiki_compression		2021-09-30 20:08:16.6483
21	feeds_limit	15	2021-09-30 20:08:16.656577
12	welcome_text	h1=. *CONAE prod - env ASC*	2021-10-19 13:54:44.175675
22	cross_project_issue_relations	1	2021-11-02 15:19:05.408079
23	link_copied_issue	ask	2021-11-02 15:19:05.418393
24	cross_project_subtasks	tree	2021-11-02 15:19:05.426632
25	close_duplicate_issues	1	2021-11-02 15:19:05.434959
26	issue_group_assignment	1	2021-11-02 15:19:05.443301
27	default_issue_start_date_to_creation_date	1	2021-11-02 15:19:05.451974
28	display_subprojects_issues	1	2021-11-02 15:19:05.45998
29	issue_done_ratio	issue_field	2021-11-02 15:19:05.468269
30	non_working_week_days	---\n- '6'\n- '7'\n	2021-11-02 15:19:05.477313
31	issues_export_limit	10000	2021-11-02 15:19:05.485251
32	gantt_items_limit	500	2021-11-02 15:19:05.493268
33	gantt_months_limit	24	2021-11-02 15:19:05.50169
34	parent_issue_dates	derived	2021-11-02 15:19:05.509815
35	parent_issue_priority	derived	2021-11-02 15:19:05.518167
36	parent_issue_done_ratio	derived	2021-11-02 15:19:05.526475
37	issue_list_default_columns	---\n- tracker\n- status\n- priority\n- subject\n- assigned_to\n- updated_on\n	2021-11-02 15:19:05.535287
38	issue_list_default_totals	--- []\n	2021-11-02 15:19:05.543579
39	attachment_max_size	15120	2021-12-01 18:39:46.299577
40	bulk_download_max_size	102400	2021-12-01 18:39:46.310411
41	attachment_extensions_allowed		2021-12-01 18:39:46.318441
42	attachment_extensions_denied		2021-12-01 18:39:46.326625
43	file_max_size_displayed	512	2021-12-01 18:39:46.335198
44	diff_max_lines_displayed	1500	2021-12-01 18:39:46.343552
45	repositories_encodings		2021-12-01 18:39:46.351648
3	plugin_redmine_dmsf	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ndmsf_max_file_download: '0'\ndmsf_max_email_filesize: '0'\ndmsf_storage_directory: files/dmsf\ndmsf_tmpdir: "/tmp"\ndmsf_default_notifications: ''\ndmsf_display_notified_recipients: ''\ndmsf_global_title_format: ''\ndmsf_act_as_attachable: 'true'\ndmsf_projects_as_subfolders: 'true'\ndmsf_columns:\n- id\n- title\n- size\n- modified\n- version\n- workflow\n- author\n- WBS ID\n- Document CODE\n- Document Type\n- Scope Statement\n- Deliverables\n- Function Responsible\n- Comments\ndmsf_documents_email_from: ''\ndmsf_documents_email_reply_to: ''\nonly_approval_zero_minor_version: 'false'\ndmsf_webdav: '1'\ndmsf_webdav_strategy: WEBDAV_READ_WRITE\ndmsf_webdav_ignore: "^(\\\\._|\\\\.DS_Store$|Thumbs.db$)"\ndmsf_webdav_ignore_1b_file_for_authentication: 'true'\ndmsf_webdav_disable_versioning: "^\\\\~\\\\$|\\\\.tmp$"\ndmsf_webdav_use_project_names: 'true'\ndmsf_stemming_lang: english\n	2021-12-07 19:08:52.151372
\.


--
-- Data for Name: time_entries; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on, author_id) FROM stdin;
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tokens (id, user_id, action, value, created_on, updated_on) FROM stdin;
98	1	session	4c5f5bb4fdd4258526b35134811548400c8dd83e	2022-01-07 19:50:00.826601	2022-01-07 19:50:10.313935
93	1	session	1e0923fea362cd9d03c963e71e4f6922b3feba4c	2021-12-30 18:22:09.625761	2021-12-30 18:24:16.595357
3	1	feeds	b5b11e006868391a21ab2c1b77a92c091f054c24	2021-08-25 12:34:00.388139	2021-08-25 12:34:00.388139
35	27	api	21ac3475489ad57e9f966476ea11181e6d4fa127	2021-09-17 20:05:21.488619	2021-09-17 20:05:21.488619
36	28	api	6ca49e6b654f7a8e3045d343a47e1c332c92b4ba	2021-09-17 20:05:22.080253	2021-09-17 20:05:22.080253
37	29	api	a7a9e8b7e5f75bdc0535e29cb4f6a6b107a7ef8d	2021-09-17 20:05:22.53035	2021-09-17 20:05:22.53035
38	30	api	8fab0fb584e09d5f2e62d7bad7e87c7e93d3cadd	2021-09-17 20:05:24.856307	2021-09-17 20:05:24.856307
39	31	api	9e341949601bf136a53d4d9aec67b22cb1f4a056	2021-09-17 20:05:25.346274	2021-09-17 20:05:25.346274
40	32	api	a1f50530d0fb84cffb1165918e2e662613385123	2021-09-17 20:05:25.88744	2021-09-17 20:05:25.88744
41	33	api	c0a13ddf31601bfb0eb7bc707ecdd23e4cecbc2e	2021-09-17 20:05:26.370595	2021-09-17 20:05:26.370595
42	34	api	5ecafd270bb825e1b92e28c27bc4f23fdcf1a3b0	2021-09-17 20:05:27.020417	2021-09-17 20:05:27.020417
43	35	api	9f0025b6791962164c2dcca7fc132c77e1bd334e	2021-09-17 20:05:27.528472	2021-09-17 20:05:27.528472
44	36	api	6c73e29800960e7f27846f144cfdf920d2beae93	2021-09-17 20:05:28.004921	2021-09-17 20:05:28.004921
45	37	api	a40d3358c10d8baedb2e2e831e7ab864c642646a	2021-09-17 20:05:28.687043	2021-09-17 20:05:28.687043
46	38	api	1ba770683c1923fc7ebc42ff7ee5bccb6d4d8c30	2021-09-17 20:05:30.57847	2021-09-17 20:05:30.57847
47	39	api	5cd0e002a923f532012f74521693f2dd364f2cab	2021-09-17 20:05:31.162042	2021-09-17 20:05:31.162042
48	40	api	c859e95f926754da066c94e3fe83d6865c9f5572	2021-09-17 20:05:31.736632	2021-09-17 20:05:31.736632
49	41	api	75e9c5cdbbd3114c16f2f5b9c5f2dd9c186d2801	2021-09-17 20:05:32.286526	2021-09-17 20:05:32.286526
50	42	api	3c37e873dcbbbeb25f51b699c3af8b7cb1618ea6	2021-09-17 20:05:32.794874	2021-09-17 20:05:32.794874
51	43	api	759e648180e468b6c90dbe9db3608901d6387863	2021-09-17 20:05:33.228464	2021-09-17 20:05:33.228464
73	35	session	b6f7d4d9a8daea9778cc5b237c3d3fc8f55237fc	2021-12-20 19:32:05.46975	2021-12-20 19:35:09.278783
52	44	api	95c8a219ac69bdc505fe882d7de43e5a37ca0ca0	2021-09-17 20:05:33.644099	2021-09-17 20:05:33.644099
53	45	api	97d6f4b0864d024d17162514a5a8bf223373d8fa	2021-09-17 20:05:34.06953	2021-09-17 20:05:34.06953
54	46	api	f24d5f5e1085e6c80da217a615c97a18d605f41c	2021-09-17 20:05:34.494388	2021-09-17 20:05:34.494388
55	47	api	3fc3bc4bc2d444fd7cdcb669ecd19b0eebb1802d	2021-09-17 20:05:35.002826	2021-09-17 20:05:35.002826
56	48	api	5e79733ef3de20bbef3d3215467c572ea5fbbff1	2021-09-17 20:05:37.468989	2021-09-17 20:05:37.468989
71	39	feeds	16f58f4d660942b51a00dc67ae370e77be89da2b	2021-12-20 19:21:23.889039	2021-12-20 19:21:23.889039
99	1	session	814835481d5a673d1a81b5c4c04901e8de414dc6	2022-01-19 13:56:18.857524	2022-02-03 18:35:47.599578
94	1	session	4a7a0dfbe772952a7c9c71b434804081b7c1b77c	2022-01-03 20:05:38.40573	2022-01-03 20:05:47.990589
75	39	session	6f162e030319812d7eb608f52b94b1ec55050cf2	2021-12-20 19:34:26.689486	2021-12-20 19:35:32.33378
100	1	session	b04c72b213131ef8c9fe36a86e154b8ca6232846	2022-02-07 13:47:43.321273	2022-03-10 14:17:39.690475
101	1	session	739f16242bce9d9bd914b7d76d41cb5221dbce26	2022-03-10 15:02:26.10858	2022-03-10 15:02:46.623995
82	30	feeds	b78bd1ffa430b3e25c36487cb6844d3604f11a0c	2021-12-20 19:42:46.551941	2021-12-20 19:42:46.551941
95	1	session	b55d6489c4e063385d2315b2cd998adfcfd509bb	2022-01-03 20:13:24.874846	2022-01-07 19:12:18.13272
74	35	feeds	eb7376a79142c3ede23dd07203cf59facbb7fbc7	2021-12-20 19:32:10.358055	2021-12-20 19:32:10.358055
85	39	session	f65e98bf823e56688a19b42d5dfcd9604cc8c16d	2021-12-23 11:33:37.261419	2021-12-23 12:25:09.96495
96	1	session	5d163660f5506e562ea569b9602c8a324d411ea0	2022-01-07 19:08:58.923566	2022-01-07 19:23:38.88484
80	38	feeds	c4b86318576ab683aac567263bdb24e04f344899	2021-12-20 19:41:02.219923	2021-12-20 19:41:02.219923
91	30	session	0ce3c4918115d7c365ea9e64dee2b5e677b18787	2021-12-23 17:56:52.825977	2021-12-23 17:57:05.18075
92	1	session	6104296421b91974a19c498849a2028f94701911	2021-12-29 18:48:43.629675	2021-12-29 18:52:30.23791
97	1	session	d0aeb255d37d67a010d8400fc632b4f4a77fe974	2022-01-07 19:40:30.392919	2022-01-07 19:40:42.407348
\.


--
-- Data for Name: trackers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.trackers (id, name, is_in_chlog, "position", is_in_roadmap, fields_bits, default_status_id, description) FROM stdin;
2	Requirement	f	1	t	229	6	
3	Action Items	f	5	t	70	6	
5	Input for Requirement	f	2	t	214	6	
6	Verification Task	f	3	t	199	2	
7	Waivers_RFD	f	6	t	199	1	
4	RISK	f	7	t	130	9	
1	Non Conformances	f	4	t	128	1	
10	Build	f	9	t	247	2	
11	ECR	f	10	t	206	10	
12	Certificacion	f	11	t	255	1	
13	Risk Proposal	f	12	t	246	9	
14	RFA	f	13	t	254	6	
15	RFA (TBC)	f	14	t	254	6	
16	NSEPAR	f	15	t	254	1	
17	Critical Item	f	16	t	254	1	
18	Declared Materials	f	17	t	254	8	
19	Declared Processes	f	18	t	254	1	
20	Declared Mechanical Parts	f	19	t	254	8	
21	reliability Analysis	f	20	t	248	2	
9	CI	f	8	t	246	2	
22	WBS	f	21	t	502	1	
\.


--
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_preferences (id, user_id, others, hide_mail, time_zone) FROM stdin;
1	1	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n  top:\n  - locked_documents\n  - documents\n  - open_approvals\n:my_page_settings: {}\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:recently_used_project_ids: '39,2,1'\n:dmsf_attachments_upload_choice: \n:notify_about_high_priority_issues: '0'\n	t	
24	27	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
25	28	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
26	29	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
28	31	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
29	32	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
30	33	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
31	34	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
33	36	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
34	37	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
37	40	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
38	41	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
39	42	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
40	43	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
41	44	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
42	45	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
43	46	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
44	47	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
45	48	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	
32	35	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n  top:\n  - open_approvals\n  - activity\n  - documents\n:my_page_settings: {}\n:notify_about_high_priority_issues: '0'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:recently_used_project_ids: '71,4'\n	t	
36	39	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n  top:\n  - open_approvals\n  - documents\n:my_page_settings: {}\n:notify_about_high_priority_issues: '0'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:recently_used_project_ids: '4'\n	t	
35	38	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n  top:\n  - open_approvals\n:my_page_settings: {}\n:notify_about_high_priority_issues: '0'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:recently_used_project_ids: '4'\n	t	
27	30	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n  top:\n  - open_approvals\n:my_page_settings: {}\n:notify_about_high_priority_issues: '0'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:recently_used_project_ids: '4'\n	t	
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, login, hashed_password, firstname, lastname, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd, passwd_changed_on, twofa_scheme, twofa_totp_key, twofa_totp_last_used_at) FROM stdin;
32	coviedo@vengsa.com.ar	f66d1c39065f54211831bb2f4b050d91be5369f3	Claudio	Oviedo	f	1	\N	en	\N	2021-09-17 20:05:25.863083	2021-09-17 20:05:25.863083	User	\N	only_my_events	90b6a569beb52fce84a3c8cf6b76632a	t	2021-09-17 20:05:25	\N	\N	\N
2				Anonymous users	f	1	\N		\N	2021-08-25 12:31:47.577733	2021-08-25 12:31:47.577733	GroupAnonymous	\N		\N	f	\N	\N	\N	\N
3				Non member users	f	1	\N		\N	2021-08-25 12:31:47.644684	2021-08-25 12:31:47.644684	GroupNonMember	\N		\N	f	\N	\N	\N	\N
33	csanjuan@vengsa.com.ar	076be53f73ae7b4e8e6528c03dfb1f31661e0236	Carlos	San Juan	f	1	\N	en	\N	2021-09-17 20:05:26.346419	2021-09-17 20:05:26.346419	User	\N	only_my_events	56f02a69edc1ff23a09e98b51e4e9caa	t	2021-09-17 20:05:26	\N	\N	\N
4				Anonymous	f	0	\N		\N	2021-08-25 12:33:27.946208	2021-08-25 12:33:27.946208	AnonymousUser	\N	only_my_events	\N	f	\N	\N	\N	\N
34	dfernandez@conae.gov.ar	8a3ecaa0703e3dc86c817fd9980225e9dcfae400	Damian	Fernandez	f	1	\N	en	\N	2021-09-17 20:05:26.99051	2021-09-17 20:05:26.99051	User	\N	only_my_events	16c43253c64c400dc7230abec1508bfa	t	2021-09-17 20:05:26	\N	\N	\N
52				SABIA-Mar Collaborator	f	1	\N		\N	2021-09-20 13:56:20.147077	2021-09-20 13:56:20.147077	Group	\N		\N	f	\N	\N	\N	\N
27	aalvarez@sec.conae.gov.ar	66098979802adee27f8d49eaeb05688edae52d3b	Alicia	Alvarez	f	1	\N	en	\N	2021-09-17 20:05:21.447635	2021-09-17 20:05:21.447635	User	\N	only_my_events	f8d8395789a325677b25fd81c0645b72	t	2021-09-17 20:05:21	\N	\N	\N
28	abarrera@conae.gov.ar	81843967a26573a68a815da38c173d99540ef731	Araceli Romina	Barrera	f	1	\N	en	\N	2021-09-17 20:05:22.047493	2021-09-17 20:05:22.047493	User	\N	only_my_events	128bc2cf2422ba6b603e84f80f036357	t	2021-09-17 20:05:22	\N	\N	\N
29	alcaballero@conae.gov.ar	9f40504a85f32d4f0d5a0678e8ac77b08b24914a	Ada Luz	Caballero Sifuentes	f	1	\N	en	\N	2021-09-17 20:05:22.498356	2021-09-17 20:05:22.498356	User	\N	only_my_events	bcb78273d59b276092436f7f35ebf75d	t	2021-09-17 20:05:22	\N	\N	\N
31	asc.sabiamar	895fe9c2c3c179ca4efca3e9f8765f946e2b7a45	ASC NO_LDAP	asc.sabiamar	f	1	\N	en	\N	2021-09-17 20:05:25.316643	2021-09-17 20:05:25.316643	User	\N	only_my_events	78ae29960a0b58d9cd463086f95fab01	t	2021-09-17 20:05:25	\N	\N	\N
36	egomez@conae.gov.ar	fc34e73c0a23bfebb675b195ec0a18897c400cc0	Emmanuel	Gomez	f	1	\N	en	\N	2021-09-17 20:05:27.973375	2021-09-17 20:05:27.973375	User	\N	only_my_events	606fc602e70394c6f9dd65b6526b6f1b	t	2021-09-17 20:05:27	\N	\N	\N
37	gbisaccio@conae.gov.ar	cb1e7a42fc5bfcd4d38fb3859f11af920d69c66c	Gustavo Amílcar	Bisaccio	f	1	\N	en	\N	2021-09-17 20:05:28.655102	2021-09-17 20:05:28.655102	User	\N	only_my_events	b192a2129821fca43e23c0cd842391ba	t	2021-09-17 20:05:28	\N	\N	\N
40	invap.sabiamar	a6838ffbd5bf02e2c357035fe947624ad6e6f75a	INVAP NO-LDAP	invap.sabiamar	f	1	\N	en	\N	2021-09-17 20:05:31.709448	2021-09-17 20:05:31.709448	User	\N	only_my_events	12afbd18272f31a9f78335a0b60a9d1e	t	2021-09-17 20:05:31	\N	\N	\N
41	jicasais@conae.gov.ar	e1666714ec464abcfb78508c37f5fa019d376b21	Juan Ignacio	Casais	f	1	\N	en	\N	2021-09-17 20:05:32.244806	2021-09-17 20:05:32.244806	User	\N	only_my_events	a51e867708356fd86eeb8c37d8a5b812	t	2021-09-17 20:05:32	\N	\N	\N
42	jmarin@conae.gov.ar	099beb55a98af06ce090e1cab632c33db3710023	Javier	Marin	f	1	\N	en	\N	2021-09-17 20:05:32.766214	2021-09-17 20:05:32.766214	User	\N	only_my_events	d64c16778ca114d8c0e2079bd9270f07	t	2021-09-17 20:05:32	\N	\N	\N
43	lgarategaray@conae.gov.ar	db18489252bb639c2e48b077419fb955a835dc72	Leonel	Garategaray	f	1	\N	en	\N	2021-09-17 20:05:33.197559	2021-09-17 20:05:33.197559	User	\N	only_my_events	c8397b3b9e5fa77121ee3b17afef138f	t	2021-09-17 20:05:33	\N	\N	\N
44	malvarezbocco@vengsa.com.ar	467e8b2ef5b912897df9ef2456a55781e9e3b717	Manuel	Alvarez Bocco	f	1	\N	en	\N	2021-09-17 20:05:33.620945	2021-09-17 20:05:33.620945	User	\N	only_my_events	c3db24f510eb556a09cd7b8f7217144b	t	2021-09-17 20:05:33	\N	\N	\N
45	manfred.pacher@conae.gov.ar	66404a651a543258fa8c4a952312b285f8b2b1be	Manfred 	Pacher	f	1	\N	en	\N	2021-09-17 20:05:34.040441	2021-09-17 20:05:34.040441	User	\N	only_my_events	a84e163307fbb26ae411db115eafba38	t	2021-09-17 20:05:34	\N	\N	\N
46	mvanrey@vengsa.com.ar	299352fdfec84735bda05e89ffc3d9b890e32ab2	Martin	Van Rey	f	1	\N	en	\N	2021-09-17 20:05:34.467073	2021-09-17 20:05:34.467073	User	\N	only_my_events	c084533687d72f1656a05936115b50d5	t	2021-09-17 20:05:34	\N	\N	\N
47	pfluxa@conae.gov.ar	614addf7ffdd0b878d13558ca40a4d18b266013f	Patricio	Fluxa	f	1	\N	en	\N	2021-09-17 20:05:34.973171	2021-09-17 20:05:34.973171	User	\N	only_my_events	c6525c47d04b84db621d3b863a8a1465	t	2021-09-17 20:05:34	\N	\N	\N
48	rnnatali@vengsa.com.ar	44d4ad98860e661c6c2bebd7fc75e5dd94788660	Nicolás	Natali	f	1	\N	en	\N	2021-09-17 20:05:37.440572	2021-09-17 20:05:37.440572	User	\N	only_my_events	13b8509817e313cada9da653095d7f3c	t	2021-09-17 20:05:37	\N	\N	\N
53				SABIA-Mar Consumer	f	1	\N		\N	2021-09-20 13:56:21.329464	2021-09-20 13:56:21.329464	Group	\N		\N	f	\N	\N	\N	\N
54				SABIA-Mar Contributors	f	1	\N		\N	2021-09-20 13:56:22.630536	2021-09-20 13:56:22.630536	Group	\N		\N	f	\N	\N	\N	\N
55				SABIA-Mar MSE	f	1	\N		\N	2021-09-20 13:56:24.082028	2021-09-20 13:56:24.082028	Group	\N		\N	f	\N	\N	\N	\N
56				VENG	f	1	\N		\N	2021-09-20 13:56:25.375161	2021-09-20 13:56:25.375161	Group	\N		\N	f	\N	\N	\N	\N
60				MSE	f	1	\N		\N	2021-12-20 18:54:40.455938	2021-12-20 18:54:40.455938	Group	\N		\N	f	\N	\N	\N	\N
61				MAM	f	1	\N		\N	2021-12-20 18:57:09.449966	2021-12-20 18:57:09.449966	Group	\N		\N	f	\N	\N	\N	\N
57				Risk Proposal  Approvers	f	1	\N		\N	2021-10-28 15:18:37.845514	2021-10-28 15:18:37.845514	Group	\N		\N	f	\N	\N	\N	\N
58				GS Mgr	f	1	\N		\N	2021-11-02 15:10:29.579737	2021-11-02 15:10:29.579737	Group	\N		\N	f	\N	\N	\N	\N
49				ASCENTIO	f	1	\N		\N	2021-09-20 13:56:16.372663	2021-09-20 13:56:16.372663	Group	\N		\N	f	\N	\N	\N	\N
35	dfrias@sec.conae.gov.ar	0449290c41df414343b7b88337c951094db76415	Darío Nicolás	Frias	f	1	2021-12-23 17:41:07.638922	en	\N	2021-09-17 20:05:27.502307	2021-12-20 19:32:05.442718	User	\N	only_my_events	aaefe86b48101842d4b62a98523f4d8c	f	2021-12-20 19:32:05	\N	\N	\N
50				SABIA-Mar Administrators	f	1	\N		\N	2021-09-20 13:56:17.496083	2021-09-20 13:56:17.496083	Group	\N		\N	f	\N	\N	\N	\N
51				SABIA-Mar ASC Members	f	1	\N		\N	2021-09-20 13:56:18.787418	2021-09-20 13:56:18.787418	Group	\N		\N	f	\N	\N	\N	\N
39	htiraboschi@conae.gov.ar	a4d8e39d17f9e61631db7db20f5bc7db13a9d7dc	Hernán	Tiraboschi	f	1	2021-12-23 17:53:16.032781	en	\N	2021-09-17 20:05:31.126836	2021-12-20 19:21:06.677397	User	\N	only_my_events	a2991a73e749baf8b6c9f968ac7eda76	f	2021-12-20 19:21:06	\N	\N	\N
59				CE	f	1	\N		\N	2021-12-20 18:51:58.241038	2021-12-20 18:51:58.241038	Group	\N		\N	f	\N	\N	\N	\N
38	gjgonzalez@conae.gov.ar	a0299d1bfd72c550976adc70ded88d919e5ce22d	Gustavo	Gonzalez	f	1	2021-12-23 17:55:21.190024	en	\N	2021-09-17 20:05:30.546831	2021-12-23 17:55:13.98667	User	\N	only_my_events	017e37dd15da77a13d9454c0992b1196	f	2021-12-23 17:55:13	\N	\N	\N
1	admin	8640f3b88ddd8df1e2aaa5ff30b8c6d471be37d4	Redmine	Admin	t	1	2022-03-10 15:02:26.063345	en	\N	2021-08-25 12:31:37.41036	2022-02-16 14:01:58.157814	User	\N	all	03b1e16521080a4a90d01f04c2df722e	f	2021-08-25 12:33:52	\N	\N	\N
30	anibal.ambrosino@conae.gov.ar	4a2f08d6e410015af1ee51e1fc4b4f0079f04a0f	Anibal	Ambrosino	f	1	2021-12-23 17:56:52.815722	en	\N	2021-09-17 20:05:24.823493	2021-12-23 17:56:32.956608	User	\N	only_my_events	dca3312142a4b86e7fed0b48da08dae1	f	2021-12-23 17:56:32	\N	\N	\N
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.versions (id, project_id, name, description, effective_date, created_on, updated_on, wiki_page_title, status, sharing) FROM stdin;
1	48	SABIA.FS.PFM.SM.S&M.NO		\N	2021-12-01 14:23:52.220848	2021-12-01 14:23:52.220848	\N	open	none
2	48	SABIA.FS.PFM.SM.S&M.NOD.+Y+Z		\N	2021-12-01 14:24:16.92406	2021-12-01 14:24:16.92406	\N	open	none
\.


--
-- Data for Name: watchers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.watchers (id, watchable_type, watchable_id, user_id) FROM stdin;
\.


--
-- Data for Name: wiki_content_versions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) FROM stdin;
\.


--
-- Data for Name: wiki_contents; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.wiki_contents (id, page_id, author_id, text, comments, updated_on, version) FROM stdin;
\.


--
-- Data for Name: wiki_pages; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.wiki_pages (id, wiki_id, title, created_on, protected, parent_id) FROM stdin;
\.


--
-- Data for Name: wiki_redirects; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.wiki_redirects (id, wiki_id, title, redirects_to, created_on, redirects_to_wiki_id) FROM stdin;
\.


--
-- Data for Name: wikis; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.wikis (id, project_id, start_page, status) FROM stdin;
1	4	Wiki	1
2	5	Wiki	1
3	6	Wiki	1
4	7	Wiki	1
5	8	Wiki	1
6	9	Wiki	1
7	10	Wiki	1
8	11	Wiki	1
9	12	Wiki	1
10	13	Wiki	1
11	14	Wiki	1
12	15	Wiki	1
13	16	Wiki	1
14	17	Wiki	1
15	18	Wiki	1
16	19	Wiki	1
17	20	Wiki	1
18	21	Wiki	1
19	22	Wiki	1
20	23	Wiki	1
21	24	Wiki	1
22	25	Wiki	1
23	26	Wiki	1
24	27	Wiki	1
25	28	Wiki	1
26	29	Wiki	1
27	30	Wiki	1
28	31	Wiki	1
29	32	Wiki	1
30	33	Wiki	1
31	34	Wiki	1
32	35	Wiki	1
33	36	Wiki	1
34	37	Wiki	1
35	38	Wiki	1
\.


--
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) FROM stdin;
180	11	26	8	3	f	f	WorkflowTransition	\N	\N
181	11	8	26	3	f	f	WorkflowTransition	\N	\N
183	11	30	8	3	f	f	WorkflowTransition	\N	\N
6	2	0	1	3	f	f	WorkflowTransition	\N	\N
7	2	1	2	3	f	f	WorkflowTransition	\N	\N
8	2	2	4	3	f	f	WorkflowTransition	\N	\N
9	2	2	5	3	f	f	WorkflowTransition	\N	\N
10	2	2	8	3	f	f	WorkflowTransition	\N	\N
184	11	0	26	3	f	f	WorkflowTransition	\N	\N
12	2	8	1	3	f	f	WorkflowTransition	\N	\N
13	2	8	2	3	f	f	WorkflowTransition	\N	\N
14	2	8	4	3	f	f	WorkflowTransition	\N	\N
15	2	8	5	3	f	f	WorkflowTransition	\N	\N
16	2	9	1	3	f	f	WorkflowTransition	\N	\N
17	2	5	1	3	f	f	WorkflowTransition	\N	\N
18	2	5	2	3	f	f	WorkflowTransition	\N	\N
19	2	5	4	3	f	f	WorkflowTransition	\N	\N
20	2	5	8	3	f	f	WorkflowTransition	\N	\N
21	1	0	2	3	f	f	WorkflowTransition	\N	\N
185	11	0	8	3	f	f	WorkflowTransition	\N	\N
186	11	0	30	3	f	f	WorkflowTransition	\N	\N
188	11	26	30	3	f	f	WorkflowTransition	\N	\N
190	11	8	30	3	f	f	WorkflowTransition	\N	\N
193	11	30	26	3	f	f	WorkflowTransition	\N	\N
33	1	4	1	3	f	f	WorkflowTransition	\N	\N
34	1	4	2	3	f	f	WorkflowTransition	\N	\N
35	1	4	3	3	f	f	WorkflowTransition	\N	\N
36	1	4	5	3	f	f	WorkflowTransition	\N	\N
41	12	0	6	3	f	f	WorkflowTransition	\N	\N
42	12	6	8	3	f	f	WorkflowTransition	\N	\N
43	12	8	22	3	f	f	WorkflowTransition	\N	\N
47	1	2	20	3	f	f	WorkflowTransition	\N	\N
48	1	20	24	3	f	f	WorkflowTransition	\N	\N
49	1	23	4	3	f	f	WorkflowTransition	\N	\N
50	1	24	23	3	f	f	WorkflowTransition	\N	\N
240	11	0	10	3	f	f	WorkflowTransition	\N	\N
241	11	10	26	3	f	f	WorkflowTransition	\N	\N
242	11	10	8	3	f	f	WorkflowTransition	\N	\N
243	11	10	30	3	f	f	WorkflowTransition	\N	\N
244	11	26	10	3	f	f	WorkflowTransition	\N	\N
245	11	8	10	3	f	f	WorkflowTransition	\N	\N
246	11	30	10	3	f	f	WorkflowTransition	\N	\N
255	18	0	8	3	f	f	WorkflowTransition	\N	\N
64	13	0	9	3	f	f	WorkflowTransition	\N	\N
65	13	9	14	3	f	f	WorkflowTransition	\N	\N
66	13	9	15	3	f	f	WorkflowTransition	\N	\N
67	13	15	0	5	f	f	WorkflowPermission	77	required
68	13	15	0	5	f	f	WorkflowPermission	78	required
69	13	9	0	5	f	f	WorkflowPermission	77	required
70	13	9	0	5	f	f	WorkflowPermission	78	required
71	14	0	6	3	f	f	WorkflowTransition	\N	\N
72	14	6	4	3	f	f	WorkflowTransition	\N	\N
73	14	6	28	3	f	f	WorkflowTransition	\N	\N
74	15	0	6	3	f	f	WorkflowTransition	\N	\N
75	15	6	9	3	f	f	WorkflowTransition	\N	\N
76	15	8	4	3	f	f	WorkflowTransition	\N	\N
77	15	8	9	3	f	f	WorkflowTransition	\N	\N
78	15	9	26	3	f	f	WorkflowTransition	\N	\N
79	15	26	8	3	f	f	WorkflowTransition	\N	\N
80	7	0	29	3	f	f	WorkflowTransition	\N	\N
81	7	29	8	3	f	f	WorkflowTransition	\N	\N
82	7	29	5	3	f	f	WorkflowTransition	\N	\N
83	7	0	8	3	f	f	WorkflowTransition	\N	\N
84	7	0	5	3	f	f	WorkflowTransition	\N	\N
85	7	8	5	3	f	f	WorkflowTransition	\N	\N
86	7	8	29	3	f	f	WorkflowTransition	\N	\N
87	7	5	8	3	f	f	WorkflowTransition	\N	\N
88	7	5	29	3	f	f	WorkflowTransition	\N	\N
89	4	0	4	3	f	f	WorkflowTransition	\N	\N
90	4	0	17	3	f	f	WorkflowTransition	\N	\N
91	4	0	18	3	f	f	WorkflowTransition	\N	\N
92	4	0	19	3	f	f	WorkflowTransition	\N	\N
93	4	4	17	3	f	f	WorkflowTransition	\N	\N
94	4	4	18	3	f	f	WorkflowTransition	\N	\N
95	4	4	19	3	f	f	WorkflowTransition	\N	\N
96	4	17	4	3	f	f	WorkflowTransition	\N	\N
97	4	17	18	3	f	f	WorkflowTransition	\N	\N
98	4	17	19	3	f	f	WorkflowTransition	\N	\N
99	4	18	4	3	f	f	WorkflowTransition	\N	\N
100	4	18	17	3	f	f	WorkflowTransition	\N	\N
101	4	18	19	3	f	f	WorkflowTransition	\N	\N
102	4	19	4	3	f	f	WorkflowTransition	\N	\N
103	4	19	17	3	f	f	WorkflowTransition	\N	\N
104	4	19	18	3	f	f	WorkflowTransition	\N	\N
105	13	0	14	3	f	f	WorkflowTransition	\N	\N
106	13	0	15	3	f	f	WorkflowTransition	\N	\N
107	13	14	15	3	f	f	WorkflowTransition	\N	\N
108	13	14	9	3	f	f	WorkflowTransition	\N	\N
109	13	15	14	3	f	f	WorkflowTransition	\N	\N
110	13	15	9	3	f	f	WorkflowTransition	\N	\N
257	18	29	2	3	f	f	WorkflowTransition	\N	\N
258	18	0	29	3	f	f	WorkflowTransition	\N	\N
259	18	2	8	3	f	f	WorkflowTransition	\N	\N
195	16	0	6	3	f	f	WorkflowTransition	\N	\N
196	16	0	4	3	f	f	WorkflowTransition	\N	\N
197	16	0	15	3	f	f	WorkflowTransition	\N	\N
198	16	0	31	3	f	f	WorkflowTransition	\N	\N
199	16	0	32	3	f	f	WorkflowTransition	\N	\N
200	16	0	33	3	f	f	WorkflowTransition	\N	\N
201	16	6	4	3	f	f	WorkflowTransition	\N	\N
202	16	6	15	3	f	f	WorkflowTransition	\N	\N
203	16	6	31	3	f	f	WorkflowTransition	\N	\N
204	16	6	32	3	f	f	WorkflowTransition	\N	\N
205	16	6	33	3	f	f	WorkflowTransition	\N	\N
206	16	4	6	3	f	f	WorkflowTransition	\N	\N
207	16	4	15	3	f	f	WorkflowTransition	\N	\N
208	16	4	31	3	f	f	WorkflowTransition	\N	\N
209	16	4	32	3	f	f	WorkflowTransition	\N	\N
210	16	4	33	3	f	f	WorkflowTransition	\N	\N
211	16	15	6	3	f	f	WorkflowTransition	\N	\N
212	16	15	4	3	f	f	WorkflowTransition	\N	\N
213	16	15	31	3	f	f	WorkflowTransition	\N	\N
214	16	15	32	3	f	f	WorkflowTransition	\N	\N
215	16	15	33	3	f	f	WorkflowTransition	\N	\N
216	16	31	6	3	f	f	WorkflowTransition	\N	\N
217	16	31	4	3	f	f	WorkflowTransition	\N	\N
218	16	31	15	3	f	f	WorkflowTransition	\N	\N
219	16	31	32	3	f	f	WorkflowTransition	\N	\N
220	16	31	33	3	f	f	WorkflowTransition	\N	\N
221	16	32	6	3	f	f	WorkflowTransition	\N	\N
154	10	0	10	3	f	f	WorkflowTransition	\N	\N
155	14	0	28	3	f	f	WorkflowTransition	\N	\N
156	14	4	6	3	f	f	WorkflowTransition	\N	\N
157	14	4	28	3	f	f	WorkflowTransition	\N	\N
158	14	28	6	3	f	f	WorkflowTransition	\N	\N
159	14	28	4	3	f	f	WorkflowTransition	\N	\N
160	15	0	8	3	f	f	WorkflowTransition	\N	\N
161	15	0	4	3	f	f	WorkflowTransition	\N	\N
162	15	0	9	3	f	f	WorkflowTransition	\N	\N
163	15	0	26	3	f	f	WorkflowTransition	\N	\N
164	15	6	8	3	f	f	WorkflowTransition	\N	\N
165	15	6	4	3	f	f	WorkflowTransition	\N	\N
166	15	6	26	3	f	f	WorkflowTransition	\N	\N
167	15	8	6	3	f	f	WorkflowTransition	\N	\N
168	15	8	26	3	f	f	WorkflowTransition	\N	\N
169	15	4	6	3	f	f	WorkflowTransition	\N	\N
170	15	4	8	3	f	f	WorkflowTransition	\N	\N
171	15	4	9	3	f	f	WorkflowTransition	\N	\N
172	15	4	26	3	f	f	WorkflowTransition	\N	\N
173	15	9	6	3	f	f	WorkflowTransition	\N	\N
174	15	9	8	3	f	f	WorkflowTransition	\N	\N
175	15	9	4	3	f	f	WorkflowTransition	\N	\N
176	15	26	6	3	f	f	WorkflowTransition	\N	\N
177	15	26	4	3	f	f	WorkflowTransition	\N	\N
178	15	26	9	3	f	f	WorkflowTransition	\N	\N
222	16	32	4	3	f	f	WorkflowTransition	\N	\N
223	16	32	15	3	f	f	WorkflowTransition	\N	\N
224	16	32	31	3	f	f	WorkflowTransition	\N	\N
225	16	32	33	3	f	f	WorkflowTransition	\N	\N
226	16	33	6	3	f	f	WorkflowTransition	\N	\N
227	16	33	4	3	f	f	WorkflowTransition	\N	\N
228	16	33	15	3	f	f	WorkflowTransition	\N	\N
229	16	33	31	3	f	f	WorkflowTransition	\N	\N
230	16	33	32	3	f	f	WorkflowTransition	\N	\N
250	17	0	2	3	f	f	WorkflowTransition	\N	\N
251	17	2	4	3	f	f	WorkflowTransition	\N	\N
252	17	2	34	3	f	f	WorkflowTransition	\N	\N
253	17	4	2	3	f	f	WorkflowTransition	\N	\N
254	17	34	2	3	f	f	WorkflowTransition	\N	\N
260	18	2	29	3	f	f	WorkflowTransition	\N	\N
261	18	8	2	3	f	f	WorkflowTransition	\N	\N
262	18	8	29	3	f	f	WorkflowTransition	\N	\N
263	18	29	8	3	f	f	WorkflowTransition	\N	\N
264	18	0	2	3	f	f	WorkflowTransition	\N	\N
265	19	0	2	3	f	f	WorkflowTransition	\N	\N
266	19	2	8	3	f	f	WorkflowTransition	\N	\N
267	19	2	29	3	f	f	WorkflowTransition	\N	\N
268	19	0	8	3	f	f	WorkflowTransition	\N	\N
269	19	0	29	3	f	f	WorkflowTransition	\N	\N
270	19	8	2	3	f	f	WorkflowTransition	\N	\N
271	19	8	29	3	f	f	WorkflowTransition	\N	\N
272	19	29	2	3	f	f	WorkflowTransition	\N	\N
273	19	29	8	3	f	f	WorkflowTransition	\N	\N
274	20	0	2	3	f	f	WorkflowTransition	\N	\N
275	20	0	8	3	f	f	WorkflowTransition	\N	\N
276	20	0	29	3	f	f	WorkflowTransition	\N	\N
277	20	2	8	3	f	f	WorkflowTransition	\N	\N
278	20	2	29	3	f	f	WorkflowTransition	\N	\N
279	20	8	2	3	f	f	WorkflowTransition	\N	\N
280	20	8	29	3	f	f	WorkflowTransition	\N	\N
281	20	29	2	3	f	f	WorkflowTransition	\N	\N
282	20	29	8	3	f	f	WorkflowTransition	\N	\N
283	21	0	2	3	f	f	WorkflowTransition	\N	\N
284	21	0	29	3	f	f	WorkflowTransition	\N	\N
285	21	0	4	3	f	f	WorkflowTransition	\N	\N
286	21	2	29	3	f	f	WorkflowTransition	\N	\N
287	21	2	4	3	f	f	WorkflowTransition	\N	\N
288	21	29	2	3	f	f	WorkflowTransition	\N	\N
289	21	29	4	3	f	f	WorkflowTransition	\N	\N
290	21	4	2	3	f	f	WorkflowTransition	\N	\N
291	21	4	29	3	f	f	WorkflowTransition	\N	\N
292	9	0	2	3	f	f	WorkflowTransition	\N	\N
293	9	0	26	3	f	f	WorkflowTransition	\N	\N
294	9	0	30	3	f	f	WorkflowTransition	\N	\N
295	9	2	26	3	f	f	WorkflowTransition	\N	\N
296	9	2	30	3	f	f	WorkflowTransition	\N	\N
297	9	26	2	3	f	f	WorkflowTransition	\N	\N
298	9	26	30	3	f	f	WorkflowTransition	\N	\N
299	9	30	2	3	f	f	WorkflowTransition	\N	\N
300	9	30	26	3	f	f	WorkflowTransition	\N	\N
301	22	0	2	3	f	f	WorkflowTransition	\N	\N
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.attachments_id_seq', 274, true);


--
-- Name: auth_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_sources_id_seq', 1, true);


--
-- Name: boards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.boards_id_seq', 1, false);


--
-- Name: changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.changes_id_seq', 1, false);


--
-- Name: changesets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.changesets_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.custom_field_enumerations_id_seq', 1, false);


--
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.custom_fields_id_seq', 174, true);


--
-- Name: custom_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.custom_values_id_seq', 12916, true);


--
-- Name: dmsf_file_revision_accesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_file_revision_accesses_id_seq', 7, true);


--
-- Name: dmsf_file_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_file_revisions_id_seq', 71, true);


--
-- Name: dmsf_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_files_id_seq', 65, true);


--
-- Name: dmsf_folder_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_folder_permissions_id_seq', 1, false);


--
-- Name: dmsf_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_folders_id_seq', 139, true);


--
-- Name: dmsf_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_links_id_seq', 9, true);


--
-- Name: dmsf_locks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_locks_id_seq', 12, true);


--
-- Name: dmsf_public_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_public_urls_id_seq', 1, false);


--
-- Name: dmsf_workflow_step_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_workflow_step_actions_id_seq', 11, true);


--
-- Name: dmsf_workflow_step_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_workflow_step_assignments_id_seq', 37, true);


--
-- Name: dmsf_workflow_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_workflow_steps_id_seq', 8, true);


--
-- Name: dmsf_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dmsf_workflows_id_seq', 5, true);


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.documents_id_seq', 1, false);


--
-- Name: easy_entity_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.easy_entity_assignments_id_seq', 1, false);


--
-- Name: easy_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.easy_settings_id_seq', 1, false);


--
-- Name: email_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.email_addresses_id_seq', 45, true);


--
-- Name: enabled_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.enabled_modules_id_seq', 487, true);


--
-- Name: enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.enumerations_id_seq', 3, true);


--
-- Name: import_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.import_items_id_seq', 643, true);


--
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.imports_id_seq', 23, true);


--
-- Name: issue_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.issue_categories_id_seq', 3, true);


--
-- Name: issue_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.issue_relations_id_seq', 10, true);


--
-- Name: issue_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.issue_statuses_id_seq', 34, true);


--
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.issues_id_seq', 536, true);


--
-- Name: journal_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.journal_details_id_seq', 485, true);


--
-- Name: journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.journals_id_seq', 680, true);


--
-- Name: member_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.member_roles_id_seq', 68, true);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.members_id_seq', 61, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: moved_issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.moved_issues_id_seq', 1, false);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.open_id_authentication_associations_id_seq', 1, false);


--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.open_id_authentication_nonces_id_seq', 1, false);


--
-- Name: project_issue_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.project_issue_keys_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.projects_id_seq', 87, true);


--
-- Name: queries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.queries_id_seq', 12, true);


--
-- Name: repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.repositories_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.roles_id_seq', 6, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.settings_id_seq', 45, true);


--
-- Name: time_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.time_entries_id_seq', 1, false);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tokens_id_seq', 101, true);


--
-- Name: trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.trackers_id_seq', 22, true);


--
-- Name: user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_preferences_id_seq', 45, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 61, true);


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.versions_id_seq', 2, true);


--
-- Name: watchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.watchers_id_seq', 1, false);


--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.wiki_content_versions_id_seq', 1, false);


--
-- Name: wiki_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.wiki_contents_id_seq', 1, false);


--
-- Name: wiki_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.wiki_pages_id_seq', 1, false);


--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.wiki_redirects_id_seq', 1, false);


--
-- Name: wikis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.wikis_id_seq', 36, true);


--
-- Name: workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.workflows_id_seq', 301, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: auth_sources auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (id);


--
-- Name: boards boards_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);


--
-- Name: changes changes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.changes
    ADD CONSTRAINT changes_pkey PRIMARY KEY (id);


--
-- Name: changesets changesets_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.changesets
    ADD CONSTRAINT changesets_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: custom_field_enumerations custom_field_enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.custom_field_enumerations
    ADD CONSTRAINT custom_field_enumerations_pkey PRIMARY KEY (id);


--
-- Name: custom_fields custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- Name: custom_values custom_values_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.custom_values
    ADD CONSTRAINT custom_values_pkey PRIMARY KEY (id);


--
-- Name: dmsf_file_revision_accesses dmsf_file_revision_accesses_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_file_revision_accesses
    ADD CONSTRAINT dmsf_file_revision_accesses_pkey PRIMARY KEY (id);


--
-- Name: dmsf_file_revisions dmsf_file_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_file_revisions
    ADD CONSTRAINT dmsf_file_revisions_pkey PRIMARY KEY (id);


--
-- Name: dmsf_files dmsf_files_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_files
    ADD CONSTRAINT dmsf_files_pkey PRIMARY KEY (id);


--
-- Name: dmsf_folder_permissions dmsf_folder_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_folder_permissions
    ADD CONSTRAINT dmsf_folder_permissions_pkey PRIMARY KEY (id);


--
-- Name: dmsf_folders dmsf_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_folders
    ADD CONSTRAINT dmsf_folders_pkey PRIMARY KEY (id);


--
-- Name: dmsf_links dmsf_links_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_links
    ADD CONSTRAINT dmsf_links_pkey PRIMARY KEY (id);


--
-- Name: dmsf_locks dmsf_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_locks
    ADD CONSTRAINT dmsf_locks_pkey PRIMARY KEY (id);


--
-- Name: dmsf_public_urls dmsf_public_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_public_urls
    ADD CONSTRAINT dmsf_public_urls_pkey PRIMARY KEY (id);


--
-- Name: dmsf_workflow_step_actions dmsf_workflow_step_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_workflow_step_actions
    ADD CONSTRAINT dmsf_workflow_step_actions_pkey PRIMARY KEY (id);


--
-- Name: dmsf_workflow_step_assignments dmsf_workflow_step_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_workflow_step_assignments
    ADD CONSTRAINT dmsf_workflow_step_assignments_pkey PRIMARY KEY (id);


--
-- Name: dmsf_workflow_steps dmsf_workflow_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_workflow_steps
    ADD CONSTRAINT dmsf_workflow_steps_pkey PRIMARY KEY (id);


--
-- Name: dmsf_workflows dmsf_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dmsf_workflows
    ADD CONSTRAINT dmsf_workflows_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: easy_entity_assignments easy_entity_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.easy_entity_assignments
    ADD CONSTRAINT easy_entity_assignments_pkey PRIMARY KEY (id);


--
-- Name: easy_settings easy_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.easy_settings
    ADD CONSTRAINT easy_settings_pkey PRIMARY KEY (id);


--
-- Name: email_addresses email_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.email_addresses
    ADD CONSTRAINT email_addresses_pkey PRIMARY KEY (id);


--
-- Name: enabled_modules enabled_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enabled_modules
    ADD CONSTRAINT enabled_modules_pkey PRIMARY KEY (id);


--
-- Name: enumerations enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enumerations
    ADD CONSTRAINT enumerations_pkey PRIMARY KEY (id);


--
-- Name: import_items import_items_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.import_items
    ADD CONSTRAINT import_items_pkey PRIMARY KEY (id);


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: issue_categories issue_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.issue_categories
    ADD CONSTRAINT issue_categories_pkey PRIMARY KEY (id);


--
-- Name: issue_relations issue_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.issue_relations
    ADD CONSTRAINT issue_relations_pkey PRIMARY KEY (id);


--
-- Name: issue_statuses issue_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.issue_statuses
    ADD CONSTRAINT issue_statuses_pkey PRIMARY KEY (id);


--
-- Name: issues issues_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: journal_details journal_details_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.journal_details
    ADD CONSTRAINT journal_details_pkey PRIMARY KEY (id);


--
-- Name: journals journals_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);


--
-- Name: member_roles member_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.member_roles
    ADD CONSTRAINT member_roles_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: moved_issues moved_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.moved_issues
    ADD CONSTRAINT moved_issues_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_associations open_id_authentication_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.open_id_authentication_associations
    ADD CONSTRAINT open_id_authentication_associations_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_nonces open_id_authentication_nonces_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.open_id_authentication_nonces
    ADD CONSTRAINT open_id_authentication_nonces_pkey PRIMARY KEY (id);


--
-- Name: project_issue_keys project_issue_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.project_issue_keys
    ADD CONSTRAINT project_issue_keys_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: queries queries_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (id);


--
-- Name: repositories repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: time_entries time_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.time_entries
    ADD CONSTRAINT time_entries_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: trackers trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: watchers watchers_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.watchers
    ADD CONSTRAINT watchers_pkey PRIMARY KEY (id);


--
-- Name: wiki_content_versions wiki_content_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.wiki_content_versions
    ADD CONSTRAINT wiki_content_versions_pkey PRIMARY KEY (id);


--
-- Name: wiki_contents wiki_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.wiki_contents
    ADD CONSTRAINT wiki_contents_pkey PRIMARY KEY (id);


--
-- Name: wiki_pages wiki_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.wiki_pages
    ADD CONSTRAINT wiki_pages_pkey PRIMARY KEY (id);


--
-- Name: wiki_redirects wiki_redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.wiki_redirects
    ADD CONSTRAINT wiki_redirects_pkey PRIMARY KEY (id);


--
-- Name: wikis wikis_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.wikis
    ADD CONSTRAINT wikis_pkey PRIMARY KEY (id);


--
-- Name: workflows workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- Name: boards_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX boards_project_id ON public.boards USING btree (project_id);


--
-- Name: changeset_parents_changeset_ids; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX changeset_parents_changeset_ids ON public.changeset_parents USING btree (changeset_id);


--
-- Name: changeset_parents_parent_ids; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX changeset_parents_parent_ids ON public.changeset_parents USING btree (parent_id);


--
-- Name: changesets_changeset_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX changesets_changeset_id ON public.changes USING btree (changeset_id);


--
-- Name: changesets_issues_ids; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX changesets_issues_ids ON public.changesets_issues USING btree (changeset_id, issue_id);


--
-- Name: changesets_repos_rev; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX changesets_repos_rev ON public.changesets USING btree (repository_id, revision);


--
-- Name: changesets_repos_scmid; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX changesets_repos_scmid ON public.changesets USING btree (repository_id, scmid);


--
-- Name: custom_fields_roles_ids; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX custom_fields_roles_ids ON public.custom_fields_roles USING btree (custom_field_id, role_id);


--
-- Name: custom_values_customized; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX custom_values_customized ON public.custom_values USING btree (customized_type, customized_id);


--
-- Name: documents_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX documents_project_id ON public.documents USING btree (project_id);


--
-- Name: enabled_modules_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX enabled_modules_project_id ON public.enabled_modules USING btree (project_id);


--
-- Name: entity_assignment_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX entity_assignment_idx ON public.easy_entity_assignments USING btree (entity_from_type, entity_from_id, entity_to_type, entity_to_id);


--
-- Name: entity_assignment_idx_from; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX entity_assignment_idx_from ON public.easy_entity_assignments USING btree (entity_from_id);


--
-- Name: entity_assignment_idx_to; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX entity_assignment_idx_to ON public.easy_entity_assignments USING btree (entity_to_id);


--
-- Name: groups_users_ids; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX groups_users_ids ON public.groups_users USING btree (group_id, user_id);


--
-- Name: idx_dmsf_wfstepact_on_wfstepassign_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_dmsf_wfstepact_on_wfstepassign_id ON public.dmsf_workflow_step_actions USING btree (dmsf_workflow_step_assignment_id);


--
-- Name: index_attachments_on_author_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_attachments_on_author_id ON public.attachments USING btree (author_id);


--
-- Name: index_attachments_on_container_id_and_container_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_attachments_on_container_id_and_container_type ON public.attachments USING btree (container_id, container_type);


--
-- Name: index_attachments_on_created_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_attachments_on_created_on ON public.attachments USING btree (created_on);


--
-- Name: index_attachments_on_disk_filename; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_attachments_on_disk_filename ON public.attachments USING btree (disk_filename);


--
-- Name: index_auth_sources_on_id_and_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_auth_sources_on_id_and_type ON public.auth_sources USING btree (id, type);


--
-- Name: index_boards_on_last_message_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_boards_on_last_message_id ON public.boards USING btree (last_message_id);


--
-- Name: index_changesets_issues_on_issue_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_changesets_issues_on_issue_id ON public.changesets_issues USING btree (issue_id);


--
-- Name: index_changesets_on_committed_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_changesets_on_committed_on ON public.changesets USING btree (committed_on);


--
-- Name: index_changesets_on_repository_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_changesets_on_repository_id ON public.changesets USING btree (repository_id);


--
-- Name: index_changesets_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_changesets_on_user_id ON public.changesets USING btree (user_id);


--
-- Name: index_comments_on_author_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_comments_on_author_id ON public.comments USING btree (author_id);


--
-- Name: index_comments_on_commented_id_and_commented_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_comments_on_commented_id_and_commented_type ON public.comments USING btree (commented_id, commented_type);


--
-- Name: index_custom_fields_on_id_and_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_custom_fields_on_id_and_type ON public.custom_fields USING btree (id, type);


--
-- Name: index_custom_fields_projects_on_custom_field_id_and_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_custom_fields_projects_on_custom_field_id_and_project_id ON public.custom_fields_projects USING btree (custom_field_id, project_id);


--
-- Name: index_custom_fields_trackers_on_custom_field_id_and_tracker_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_custom_fields_trackers_on_custom_field_id_and_tracker_id ON public.custom_fields_trackers USING btree (custom_field_id, tracker_id);


--
-- Name: index_custom_values_on_custom_field_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_custom_values_on_custom_field_id ON public.custom_values USING btree (custom_field_id);


--
-- Name: index_dmsf_file_revision_accesses_on_dmsf_file_revision_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_file_revision_accesses_on_dmsf_file_revision_id ON public.dmsf_file_revision_accesses USING btree (dmsf_file_revision_id);


--
-- Name: index_dmsf_file_revisions_on_dmsf_file_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_file_revisions_on_dmsf_file_id ON public.dmsf_file_revisions USING btree (dmsf_file_id);


--
-- Name: index_dmsf_files_on_dmsf_folder_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_files_on_dmsf_folder_id ON public.dmsf_files USING btree (dmsf_folder_id);


--
-- Name: index_dmsf_files_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_files_on_project_id ON public.dmsf_files USING btree (project_id);


--
-- Name: index_dmsf_folder_permissions_on_dmsf_folder_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_folder_permissions_on_dmsf_folder_id ON public.dmsf_folder_permissions USING btree (dmsf_folder_id);


--
-- Name: index_dmsf_folders_on_dmsf_folder_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_folders_on_dmsf_folder_id ON public.dmsf_folders USING btree (dmsf_folder_id);


--
-- Name: index_dmsf_folders_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_folders_on_project_id ON public.dmsf_folders USING btree (project_id);


--
-- Name: index_dmsf_links_on_dmsf_folder_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_links_on_dmsf_folder_id ON public.dmsf_links USING btree (dmsf_folder_id);


--
-- Name: index_dmsf_links_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_links_on_project_id ON public.dmsf_links USING btree (project_id);


--
-- Name: index_dmsf_locks_on_entity_id_and_entity_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_locks_on_entity_id_and_entity_type ON public.dmsf_locks USING btree (entity_id, entity_type);


--
-- Name: index_dmsf_public_urls_on_token; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_public_urls_on_token ON public.dmsf_public_urls USING btree (token);


--
-- Name: index_dmsf_workflow_steps_on_dmsf_workflow_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_dmsf_workflow_steps_on_dmsf_workflow_id ON public.dmsf_workflow_steps USING btree (dmsf_workflow_id);


--
-- Name: index_dmsf_wrkfl_step_assigns_on_wrkfl_step_id_and_frev_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_dmsf_wrkfl_step_assigns_on_wrkfl_step_id_and_frev_id ON public.dmsf_workflow_step_assignments USING btree (dmsf_workflow_step_id, dmsf_file_revision_id);


--
-- Name: index_documents_on_category_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_documents_on_category_id ON public.documents USING btree (category_id);


--
-- Name: index_documents_on_created_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_documents_on_created_on ON public.documents USING btree (created_on);


--
-- Name: index_easy_settings_on_name_and_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_easy_settings_on_name_and_project_id ON public.easy_settings USING btree (name, project_id);


--
-- Name: index_easy_settings_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_easy_settings_on_project_id ON public.easy_settings USING btree (project_id);


--
-- Name: index_email_addresses_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_email_addresses_on_user_id ON public.email_addresses USING btree (user_id);


--
-- Name: index_enumerations_on_id_and_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_enumerations_on_id_and_type ON public.enumerations USING btree (id, type);


--
-- Name: index_enumerations_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_enumerations_on_project_id ON public.enumerations USING btree (project_id);


--
-- Name: index_import_items_on_import_id_and_unique_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_import_items_on_import_id_and_unique_id ON public.import_items USING btree (import_id, unique_id);


--
-- Name: index_issue_categories_on_assigned_to_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issue_categories_on_assigned_to_id ON public.issue_categories USING btree (assigned_to_id);


--
-- Name: index_issue_relations_on_issue_from_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issue_relations_on_issue_from_id ON public.issue_relations USING btree (issue_from_id);


--
-- Name: index_issue_relations_on_issue_from_id_and_issue_to_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_issue_relations_on_issue_from_id_and_issue_to_id ON public.issue_relations USING btree (issue_from_id, issue_to_id);


--
-- Name: index_issue_relations_on_issue_to_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issue_relations_on_issue_to_id ON public.issue_relations USING btree (issue_to_id);


--
-- Name: index_issue_statuses_on_is_closed; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issue_statuses_on_is_closed ON public.issue_statuses USING btree (is_closed);


--
-- Name: index_issue_statuses_on_position; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issue_statuses_on_position ON public.issue_statuses USING btree ("position");


--
-- Name: index_issues_on_assigned_to_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_assigned_to_id ON public.issues USING btree (assigned_to_id);


--
-- Name: index_issues_on_author_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_author_id ON public.issues USING btree (author_id);


--
-- Name: index_issues_on_category_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_category_id ON public.issues USING btree (category_id);


--
-- Name: index_issues_on_created_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_created_on ON public.issues USING btree (created_on);


--
-- Name: index_issues_on_fixed_version_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_fixed_version_id ON public.issues USING btree (fixed_version_id);


--
-- Name: index_issues_on_issue_number; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_issue_number ON public.issues USING btree (issue_number);


--
-- Name: index_issues_on_parent_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_parent_id ON public.issues USING btree (parent_id);


--
-- Name: index_issues_on_priority_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_priority_id ON public.issues USING btree (priority_id);


--
-- Name: index_issues_on_project_key_and_issue_number; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_project_key_and_issue_number ON public.issues USING btree (project_key, issue_number);


--
-- Name: index_issues_on_root_id_and_lft_and_rgt; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_root_id_and_lft_and_rgt ON public.issues USING btree (root_id, lft, rgt);


--
-- Name: index_issues_on_status_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_status_id ON public.issues USING btree (status_id);


--
-- Name: index_issues_on_tracker_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_issues_on_tracker_id ON public.issues USING btree (tracker_id);


--
-- Name: index_journals_on_created_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_journals_on_created_on ON public.journals USING btree (created_on);


--
-- Name: index_journals_on_journalized_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_journals_on_journalized_id ON public.journals USING btree (journalized_id);


--
-- Name: index_journals_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_journals_on_user_id ON public.journals USING btree (user_id);


--
-- Name: index_member_roles_on_inherited_from; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_member_roles_on_inherited_from ON public.member_roles USING btree (inherited_from);


--
-- Name: index_member_roles_on_member_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_member_roles_on_member_id ON public.member_roles USING btree (member_id);


--
-- Name: index_member_roles_on_role_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_member_roles_on_role_id ON public.member_roles USING btree (role_id);


--
-- Name: index_members_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_members_on_project_id ON public.members USING btree (project_id);


--
-- Name: index_members_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_members_on_user_id ON public.members USING btree (user_id);


--
-- Name: index_members_on_user_id_and_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_members_on_user_id_and_project_id ON public.members USING btree (user_id, project_id);


--
-- Name: index_messages_on_author_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_messages_on_author_id ON public.messages USING btree (author_id);


--
-- Name: index_messages_on_created_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_messages_on_created_on ON public.messages USING btree (created_on);


--
-- Name: index_messages_on_last_reply_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_messages_on_last_reply_id ON public.messages USING btree (last_reply_id);


--
-- Name: index_moved_issues_on_old_key_and_old_number; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_moved_issues_on_old_key_and_old_number ON public.moved_issues USING btree (old_key, old_number);


--
-- Name: index_moved_issues_on_old_number; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_moved_issues_on_old_number ON public.moved_issues USING btree (old_number);


--
-- Name: index_news_on_author_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_news_on_author_id ON public.news USING btree (author_id);


--
-- Name: index_news_on_created_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_news_on_created_on ON public.news USING btree (created_on);


--
-- Name: index_project_issue_keys_on_project_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_project_issue_keys_on_project_key ON public.project_issue_keys USING btree (project_key);


--
-- Name: index_projects_on_lft; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_projects_on_lft ON public.projects USING btree (lft);


--
-- Name: index_projects_on_rgt; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_projects_on_rgt ON public.projects USING btree (rgt);


--
-- Name: index_queries_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_queries_on_project_id ON public.queries USING btree (project_id);


--
-- Name: index_queries_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_queries_on_user_id ON public.queries USING btree (user_id);


--
-- Name: index_repositories_on_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_repositories_on_project_id ON public.repositories USING btree (project_id);


--
-- Name: index_roles_managed_roles_on_role_id_and_managed_role_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_roles_managed_roles_on_role_id_and_managed_role_id ON public.roles_managed_roles USING btree (role_id, managed_role_id);


--
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_settings_on_name ON public.settings USING btree (name);


--
-- Name: index_time_entries_on_activity_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_time_entries_on_activity_id ON public.time_entries USING btree (activity_id);


--
-- Name: index_time_entries_on_created_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_time_entries_on_created_on ON public.time_entries USING btree (created_on);


--
-- Name: index_time_entries_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_time_entries_on_user_id ON public.time_entries USING btree (user_id);


--
-- Name: index_tokens_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_tokens_on_user_id ON public.tokens USING btree (user_id);


--
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_user_preferences_on_user_id ON public.user_preferences USING btree (user_id);


--
-- Name: index_users_on_auth_source_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_users_on_auth_source_id ON public.users USING btree (auth_source_id);


--
-- Name: index_users_on_id_and_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_users_on_id_and_type ON public.users USING btree (id, type);


--
-- Name: index_users_on_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_users_on_type ON public.users USING btree (type);


--
-- Name: index_versions_on_sharing; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_versions_on_sharing ON public.versions USING btree (sharing);


--
-- Name: index_watchers_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_watchers_on_user_id ON public.watchers USING btree (user_id);


--
-- Name: index_watchers_on_watchable_id_and_watchable_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_watchers_on_watchable_id_and_watchable_type ON public.watchers USING btree (watchable_id, watchable_type);


--
-- Name: index_wiki_content_versions_on_updated_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_wiki_content_versions_on_updated_on ON public.wiki_content_versions USING btree (updated_on);


--
-- Name: index_wiki_contents_on_author_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_wiki_contents_on_author_id ON public.wiki_contents USING btree (author_id);


--
-- Name: index_wiki_pages_on_parent_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_wiki_pages_on_parent_id ON public.wiki_pages USING btree (parent_id);


--
-- Name: index_wiki_pages_on_wiki_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_wiki_pages_on_wiki_id ON public.wiki_pages USING btree (wiki_id);


--
-- Name: index_wiki_redirects_on_wiki_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_wiki_redirects_on_wiki_id ON public.wiki_redirects USING btree (wiki_id);


--
-- Name: index_workflows_on_new_status_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_workflows_on_new_status_id ON public.workflows USING btree (new_status_id);


--
-- Name: index_workflows_on_old_status_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_workflows_on_old_status_id ON public.workflows USING btree (old_status_id);


--
-- Name: index_workflows_on_role_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_workflows_on_role_id ON public.workflows USING btree (role_id);


--
-- Name: index_workflows_on_tracker_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_workflows_on_tracker_id ON public.workflows USING btree (tracker_id);


--
-- Name: issue_categories_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX issue_categories_project_id ON public.issue_categories USING btree (project_id);


--
-- Name: issues_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX issues_project_id ON public.issues USING btree (project_id);


--
-- Name: journal_details_journal_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX journal_details_journal_id ON public.journal_details USING btree (journal_id);


--
-- Name: journals_journalized_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX journals_journalized_id ON public.journals USING btree (journalized_id, journalized_type);


--
-- Name: messages_board_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX messages_board_id ON public.messages USING btree (board_id);


--
-- Name: messages_parent_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX messages_parent_id ON public.messages USING btree (parent_id);


--
-- Name: news_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX news_project_id ON public.news USING btree (project_id);


--
-- Name: projects_trackers_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX projects_trackers_project_id ON public.projects_trackers USING btree (project_id);


--
-- Name: projects_trackers_unique; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX projects_trackers_unique ON public.projects_trackers USING btree (project_id, tracker_id);


--
-- Name: queries_roles_ids; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX queries_roles_ids ON public.queries_roles USING btree (query_id, role_id);


--
-- Name: time_entries_issue_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX time_entries_issue_id ON public.time_entries USING btree (issue_id);


--
-- Name: time_entries_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX time_entries_project_id ON public.time_entries USING btree (project_id);


--
-- Name: tokens_value; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX tokens_value ON public.tokens USING btree (value);


--
-- Name: versions_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX versions_project_id ON public.versions USING btree (project_id);


--
-- Name: watchers_user_id_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX watchers_user_id_type ON public.watchers USING btree (user_id, watchable_type);


--
-- Name: wiki_content_versions_wcid; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX wiki_content_versions_wcid ON public.wiki_content_versions USING btree (wiki_content_id);


--
-- Name: wiki_contents_page_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX wiki_contents_page_id ON public.wiki_contents USING btree (page_id);


--
-- Name: wiki_pages_wiki_id_title; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX wiki_pages_wiki_id_title ON public.wiki_pages USING btree (wiki_id, title);


--
-- Name: wiki_redirects_wiki_id_title; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX wiki_redirects_wiki_id_title ON public.wiki_redirects USING btree (wiki_id, title);


--
-- Name: wikis_project_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX wikis_project_id ON public.wikis USING btree (project_id);


--
-- Name: wkfs_role_tracker_old_status; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX wkfs_role_tracker_old_status ON public.workflows USING btree (role_id, tracker_id, old_status_id);


--
-- PostgreSQL database dump complete
--

