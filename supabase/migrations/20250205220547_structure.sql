--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 17.0

-----SET statement_timeout = 0;
-----SET lock_timeout = 0;
-----SET idle_in_transaction_session_timeout = 0;
-----SET transaction_timeout = 0;
-----SET client_encoding = 'UTF8';
-----SET standard_conforming_strings = on;
-----SELECT pg_catalog.set_config('search_path', '', false);
-----SET check_function_bodies = false;
-----SET xmloption = content;
-----SET client_min_messages = warning;
-----SET row_security = off;

--
-- Name: d; Type: SCHEMA; Schema: -; Owner: geoadmin
--

CREATE SCHEMA d;


-----ALTER SCHEMA d OWNER TO geoadmin;

--
-- Name: fmd; Type: SCHEMA; Schema: -; Owner: geoadmin
--

CREATE SCHEMA fmd;


-----ALTER SCHEMA fmd OWNER TO geoadmin;

-----SET default_tablespace = '';

-----SET default_table_access_method = heap;

--
-- Name: d_country; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_country (
    code smallint NOT NULL,
    lib_country character varying(250),
    code_iso character varying(2),
    code_fimci smallint,
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    eu boolean DEFAULT false
);


---------ALTER TABLE .*

--
-- Name: d_partner; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_partner (
    code smallint NOT NULL,
    desc_short character varying(50),
    description character varying(250),
    country_code smallint,
    futmon_code smallint,
    foreu_code smallint,
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    longitude_min character varying(7),
    latitude_min character varying(7),
    longitude_max character varying(7),
    latitude_max character varying(7),
    tfm_sum boolean DEFAULT false,
    l1_coord_precise smallint DEFAULT 0,
    l2_coord_precise smallint DEFAULT 0
);


----ALTER TABLE .*

--
-- Name: fmd_aq_pac; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_aq_pac (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint,
    code_plot integer NOT NULL,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    altitude_m smallint,
    sampler_number smallint NOT NULL,
    inlet_height numeric,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_aq_pps; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_aq_pps (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint,
    code_plot integer NOT NULL,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    altitude_m smallint,
    elevation_25 smallint,
    elevation_50 smallint,
    sampler_number smallint NOT NULL,
    sampling_height numeric,
    code_compound character varying(3) NOT NULL,
    code_manufacturer_passive smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_c1_tre; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_c1_tre (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    date_survey date,
    team_id integer,
    tree_number integer,
    code_tree_species smallint,
    code_tree_damage_status smallint,
    code_removal smallint,
    code_defoliation smallint,
    code_social_class smallint,
    code_shading smallint,
    code_visibility smallint,
    code_crown_assess smallint,
    code_fruit_assess numeric,
    code_fruit_whole_crown numeric,
    code_flow_assess smallint,
    code_flow_whole_crown smallint,
    code_foliage_transparency smallint,
    code_crown_form smallint,
    code_shoot_epico smallint,
    cdrd_n numeric,
    code_apical_shoot smallint,
    code_tree_age smallint,
    code_age_method smallint,
    code_ref_tree smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_cc_trc; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_cc_trc (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    date_survey date,
    team_id integer,
    tree_number integer,
    code_tree_species smallint,
    code_tree_damage_status smallint,
    code_removal smallint,
    code_defoliation smallint,
    code_social_class smallint,
    code_shading smallint,
    code_visibility smallint,
    code_crown_assess smallint,
    code_fruit_assess numeric,
    code_fruit_whole_crown numeric,
    code_flow_assess smallint,
    code_flow_whole_crown smallint,
    code_foliage_transparency smallint,
    code_crown_form smallint,
    code_shoot_epico smallint,
    cdrd_n numeric,
    code_apical_shoot smallint,
    code_tree_age smallint,
    code_age_method smallint,
    code_ref_tree smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_dp_pld; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_dp_pld (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    code_sampler smallint,
    sampler_id smallint,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    date_monitoring_first date,
    date_monitoring_last date,
    periods_number smallint,
    code_sampler_model smallint,
    sampler_height numeric,
    sampler_surface numeric,
    samplers_number smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer,
    dem_pld_key character varying
);


----ALTER TABLE .*

--
-- Name: fmd_f1_plf; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_f1_plf (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_sampling date,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_fo_plf; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_fo_plf (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_sampling date,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gb_pgb; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gb_pgb (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    date_sampling date NOT NULL,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    frame_area numeric,
    frames smallint,
    sample_area numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gr_pli; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gr_pli (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    gr_plot_id smallint,
    code_gr_plot_design smallint,
    code_gr_inv_type smallint,
    date_observation date,
    latitude character varying(7),
    longitude character varying(7),
    total_plot_size numeric,
    trees_number integer,
    sample_plot_size numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    trees_growth_plot integer,
    trees_ha integer,
    all_trees character varying(1),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gv_plv; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gv_plv (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    sample_id smallint,
    survey_number smallint,
    code_survey_type smallint,
    date_sampling date,
    team_id integer,
    no_members smallint,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    code_fence smallint,
    total_sample_area smallint,
    tree_layer_cover smallint,
    shrub_layer_height numeric,
    shrub_layer_cover numeric,
    shrub_low_cover numeric,
    shrub_high_cover numeric,
    herb_layer_height numeric,
    herb_layer_cover numeric,
    mosses_cover numeric,
    bare_soil_cover numeric,
    litter_cover numeric,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_la_pla; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_la_pla (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint,
    code_plot integer NOT NULL,
    survey_id smallint NOT NULL,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    slope smallint,
    exposition smallint,
    date_measure date NOT NULL,
    date_maxfol date,
    code_determination smallint,
    lai_max_plot numeric,
    pai_eff numeric,
    sai_plot numeric,
    date_sai date,
    gap_fraction_plot numeric,
    code_software smallint,
    code_clumping_method smallint,
    alpha numeric,
    gamma numeric,
    omega_plot numeric,
    rings smallint,
    mean_element_width smallint,
    other_obs character varying,
    q_flag smallint,
    line_nr integer,
    change_date timestamp without time zone,
    code_line character varying(30)
);


----ALTER TABLE .*

--
-- Name: fmd_lf_lfp; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_lf_lfp (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    traps smallint,
    total_sample_area numeric,
    date_monitoring_first date,
    date_monitoring_last date,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_mm_plm; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_mm_plm (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    instrument_seq_nr integer,
    code_location character varying(1),
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    code_variable character varying(2),
    position_vertical numeric,
    code_recording smallint,
    scanning_intervall numeric,
    storing_intervall numeric,
    sw_id character varying(5),
    date_monitoring_first date,
    date_monitoring_last date,
    days_measuring smallint,
    instrument_desc character varying,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_oz_pll; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_oz_pll (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    code_survey_type character varying(3),
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    rectangles_number smallint,
    code_precision_level smallint,
    code_soil_moisture smallint,
    length_less integer,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_ph_phe; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_ph_phe (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    code_tree_species smallint,
    code_event smallint,
    date_observation date,
    code_event_score numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_ph_phi; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_ph_phi (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    tree_number character varying(4),
    code_event smallint,
    date_observation date,
    code_event_score numeric,
    code_method smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_s1_pls; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_s1_pls (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_sampling date,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_si_plt; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_si_plt (
    last_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    relocated_plot integer,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    altitude_m smallint,
    slope smallint,
    code_plot_design smallint,
    code_orientation smallint,
    date_install date,
    plot_size numeric,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_so_pls; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_so_pls (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    date_sampling date NOT NULL,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_ss_pss; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_ss_pss (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    sampler_number integer,
    code_soil_sampler_type smallint,
    code_layer_type character varying(1),
    sample_depth numeric,
    samplers_number smallint,
    date_monitoring_first date,
    date_monitoring_last date,
    periods_number smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_y1_pl1; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_y1_pl1 (
    code_country smallint,
    code_plot integer,
    latitude character varying(7),
    longitude character varying(7),
    altitude_m smallint,
    code_altitude smallint,
    code_plot_design smallint,
    code_orientation smallint,
    slope smallint,
    relocated_plot integer,
    date_install date,
    plot_size numeric,
    other_obs character varying,
    last_year smallint,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: d_accuracy; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_accuracy (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_affectpart; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_affectpart (
    code smallint NOT NULL,
    description character varying(250),
    loc_affectpart character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_age_determination; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_age_determination (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_altitude; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_altitude (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    value_min smallint,
    value_max smallint
);


----ALTER TABLE .*

--
-- Name: d_apical_shoot; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_apical_shoot (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_bark_type; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bark_type (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_bsb_accuracy; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_accuracy (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_age; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_age (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_canclo; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_canclo (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_country; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_country (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_decay; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_decay (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_dwremov; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_dwremov (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_dwspe; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_dwspe (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_dwtype; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_dwtype (
    code smallint NOT NULL,
    description character varying(250),
    grp_tree_species character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_bsb_eftc; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_eftc (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_fence; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_fence (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_fortype; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_fortype (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_gpsplot; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_gpsplot (
    code character varying(1) NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_layer; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_layer (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_manage; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_manage (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_orient; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_orient (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_origin; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_origin (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_prevuse; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_prevuse (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_subplot; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_subplot (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_treelay; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_treelay (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_treemix; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_treemix (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_tspecies; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_tspecies (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_bsb_tstatus; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_bsb_tstatus (
    code smallint NOT NULL,
    description character varying(200)
);


----ALTER TABLE .*

--
-- Name: d_canopy; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_canopy (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_canopy_gaps; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_canopy_gaps (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_cause; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_cause (
    code integer NOT NULL,
    description character varying(250),
    applicable_co smallint,
    applicable_br smallint,
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_cause_sc_name; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_cause_sc_name (
    code character varying(7) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    error_code character varying(1),
    msg character varying(255)
);


----ALTER TABLE .*

--
-- Name: d_cdrd_n; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_cdrd_n (
    code smallint NOT NULL,
    description character varying(250),
    description_long character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_certainty; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_certainty (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_clumping_method; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_clumping_method (
    code smallint NOT NULL,
    description character varying,
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_compound_aq; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_compound_aq (
    code character varying(3) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_crown_assess; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_crown_assess (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_crown_form; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_crown_form (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_damage_age; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_damage_age (
    code smallint NOT NULL,
    description character varying(250),
    description_long character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_decay; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_decay (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_defoliation; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_defoliation (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_dendrometer; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_dendrometer (
    code numeric NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_depth_level_soil; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_depth_level_soil (
    code character varying(4) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_det_top_height; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_det_top_height (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_determination_dp_so; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_determination_dp_so (
    code numeric NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_determination_dp_ss; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_determination_dp_ss (
    code character varying(4) NOT NULL,
    description character varying(200),
    category character varying(50),
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_determination_fo_gb_lf; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_determination_fo_gb_lf (
    code character varying(4) NOT NULL,
    description character varying(200),
    category character varying(50),
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_determination_la; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_determination_la (
    code smallint,
    description character varying(250),
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_determination_so; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_determination_so (
    code character varying(4) NOT NULL,
    description character varying(200),
    category character varying(50),
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_diameter; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_diameter (
    code smallint,
    description character varying,
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_direction; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_direction (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_dw_rem; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_dw_rem (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_dw_type; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_dw_type (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_event; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_event (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_event_location; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_event_location (
    code smallint NOT NULL,
    description character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_event_score; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_event_score (
    code numeric NOT NULL,
    description character varying(250),
    score character varying(50),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    flowering smallint,
    damage smallint,
    other smallint
);


----ALTER TABLE .*

--
-- Name: d_event_type; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_event_type (
    code character varying(2) NOT NULL,
    description character varying(100),
    category character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_extent; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_extent (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_extraction_method; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_extraction_method (
    code smallint NOT NULL,
    description character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_extraction_tools; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_extraction_tools (
    code smallint NOT NULL,
    description character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_fence; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_fence (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_fencing; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_fencing (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_flowering; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_flowering (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_foliage_transparency; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_foliage_transparency (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_forest_owner; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_forest_owner (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_forest_type; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_forest_type (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_forest_type_bd; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_forest_type_bd (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_fruiting; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_fruiting (
    code numeric NOT NULL,
    short character varying(50),
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_functional_group; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_functional_group (
    code character varying(2) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_gr_inv_type; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_gr_inv_type (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_gr_plot_design; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_gr_plot_design (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_gr_quality_code; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_gr_quality_code (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_ground_water_table; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_ground_water_table (
    code smallint NOT NULL,
    description character varying(220),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_hori_disc; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_hori_disc (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_hori_distinct; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_hori_distinct (
    code smallint NOT NULL,
    description character varying(250),
    thickness_of_boundary_zone character varying(50),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_hori_topography; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_hori_topography (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_humus; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_humus (
    code smallint NOT NULL,
    description character varying(250),
    description_fscc character varying(500),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_intensity_fruiting; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_intensity_fruiting (
    code numeric NOT NULL,
    description character varying(250),
    description_long character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_layer; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_layer (
    code character varying(1) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_layer_surface; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_layer_surface (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_leaves_type; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_leaves_type (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_litter_sample; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_litter_sample (
    code numeric NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_location; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_location (
    code character varying(1) NOT NULL,
    description character varying(250),
    description_long character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_loccrown; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_loccrown (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_logging_method; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_logging_method (
    code smallint NOT NULL,
    description character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_manage_intensity; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_manage_intensity (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_manage_type; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_manage_type (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_manage_type_bd; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_manage_type_bd (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_mean_age; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_mean_age (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_mean_age_bd; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_mean_age_bd (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_measurement_average; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_measurement_average (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_method_ph; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_method_ph (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_nfi_status; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_nfi_status (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_notimb_util; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_notimb_util (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_nursery_system; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_nursery_system (
    code smallint NOT NULL,
    description character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_orientation; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_orientation (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_origin_meteo; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_origin_meteo (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_parameter_dp; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_parameter_dp (
    code character varying(10) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    unit character varying(10)
);


----ALTER TABLE .*

--
-- Name: d_parameter_fogv; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_parameter_fogv (
    code character varying(4) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    unit character varying(10)
);


----ALTER TABLE .*

--
-- Name: d_parameter_lf; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_parameter_lf (
    code character varying(10) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    unit character varying(10)
);


----ALTER TABLE .*

--
-- Name: d_parameter_so; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_parameter_so (
    code character varying(10) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    unit character varying(10)
);


----ALTER TABLE .*

--
-- Name: d_parameter_ss; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_parameter_ss (
    code character varying(10) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    unit character varying(10)
);


----ALTER TABLE .*

--
-- Name: d_parent_material; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_parent_material (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_perennial; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_perennial (
    code character varying(1) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_plot_design; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_plot_design (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_plot_status; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_plot_status (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_precision_oz; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_precision_oz (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_preparation_type; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_preparation_type (
    code smallint NOT NULL,
    description character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_pretreatment_fo_gb_lf; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_pretreatment_fo_gb_lf (
    code character varying(4) NOT NULL,
    description character varying(200),
    category character varying(50),
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_pretreatment_so; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_pretreatment_so (
    code character varying(4) NOT NULL,
    description character varying(200),
    category character varying(50),
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_preuse_bd; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_preuse_bd (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_prev_landuse; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_prev_landuse (
    code numeric NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_qflags; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_qflags (
    code smallint NOT NULL,
    description character varying(220),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_recording; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_recording (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_ref_tree; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_ref_tree (
    code smallint NOT NULL,
    description character varying NOT NULL,
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_removal_comp_so; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_removal_comp_so (
    code numeric NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_removal_mortality_ccgr; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_removal_mortality_ccgr (
    code smallint NOT NULL,
    description character varying(250),
    category character varying(100),
    applicable_cc smallint,
    applicable_gr smallint,
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_removal_mortality_tv; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_removal_mortality_tv (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_root_abundance; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_root_abundance (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    very_fine character varying(10),
    fine character varying(10),
    medium character varying(10),
    coarse character varying(10)
);


----ALTER TABLE .*

--
-- Name: d_sample_prep_dp_ss; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_sample_prep_dp_ss (
    code character varying(4) NOT NULL,
    description character varying(200),
    category character varying(50),
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_sample_prep_so; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_sample_prep_so (
    code character varying(4) NOT NULL,
    description character varying(200),
    category character varying(50),
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_sampler_deposition; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_sampler_deposition (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_sampler_deposition_harmon; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_sampler_deposition_harmon (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_sampler_passive; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_sampler_passive (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_sampler_ss; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_sampler_ss (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_sampling_deposition; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_sampling_deposition (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_shading; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_shading (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_shoot_epicormic; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_shoot_epicormic (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_sieving_so; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_sieving_so (
    code numeric NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_silvicult_system; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_silvicult_system (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_sky_condition; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_sky_condition (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_slash_disposal; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_slash_disposal (
    code smallint NOT NULL,
    description character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_social_class; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_social_class (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_software; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_software (
    code smallint,
    description character varying,
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_soil_adjective; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_soil_adjective (
    code character varying(3) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    fao_1988 smallint,
    wrb_1998 smallint,
    wrb_2006_2007 smallint,
    wrb_2014_2015 smallint
);


----ALTER TABLE .*

--
-- Name: d_soil_coarse_fragments; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_soil_coarse_fragments (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_soil_code_porosity; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_soil_code_porosity (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_soil_compaction; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_soil_compaction (
    code smallint NOT NULL,
    description character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_soil_group; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_soil_group (
    code character varying(2) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_soil_moisture; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_soil_moisture (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_soil_specifier; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_soil_specifier (
    code character varying(1) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    wrb_1998 smallint DEFAULT 0,
    wrb_2006_2007 smallint DEFAULT 0,
    wrb_2014_2015 smallint DEFAULT 0
);


----ALTER TABLE .*

--
-- Name: d_soil_structure; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_soil_structure (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_spec_symptom; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_spec_symptom (
    code smallint NOT NULL,
    description character varying(250),
    applicable_symptom character varying,
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_species_list; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_species_list (
    code character varying(11),
    family character varying(50),
    genus character varying(50),
    species character varying(50),
    perennial_annual character varying(2),
    woody character varying(2),
    plant_type character varying(2),
    leaves_loss character varying(2),
    author_citation character varying(100),
    cmnt character varying(250),
    reference character varying(250),
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_stand_actual; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_stand_actual (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_stand_history; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_stand_history (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_status_data; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_status_data (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_status_mcpfe_class1; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_status_mcpfe_class1 (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_status_mcpfe_class2; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_status_mcpfe_class2 (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_status_mcpfe_class3; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_status_mcpfe_class3 (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_stock_type; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_stock_type (
    code smallint NOT NULL,
    description character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_substrate; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_substrate (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_sun_position; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_sun_position (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_survey_oz; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_survey_oz (
    code character varying(50) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_survey_type_gv; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_survey_type_gv (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_surveys; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_surveys (
    code character varying(50) NOT NULL,
    description character varying(250),
    frequ smallint,
    frequ_cmnt character varying(50),
    yn_levelii character varying(1),
    st_order smallint,
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_symp_leaves; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_symp_leaves (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_symptom; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_symptom (
    code smallint NOT NULL,
    description character varying(250),
    applicable_ln smallint,
    applicable_bsbf smallint,
    applicable_sc smallint,
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_texture_class; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_texture_class (
    code character varying(11) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_tools; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_tools (
    code smallint NOT NULL,
    description character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_treatment_aim; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_treatment_aim (
    code smallint NOT NULL,
    description character varying(100),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_tree_age; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_tree_age (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    value_min smallint,
    value_max smallint
);


----ALTER TABLE .*

--
-- Name: d_tree_damage_status; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_tree_damage_status (
    code smallint NOT NULL,
    description character varying,
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_tree_layer_bd; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_tree_layer_bd (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_tree_layers; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_tree_layers (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_tree_spec; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_tree_spec (
    code smallint NOT NULL,
    description character varying(250),
    grp_tree_species character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    code_species_group character varying(3)
);


----ALTER TABLE .*

--
-- Name: d_tree_spec_dw; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_tree_spec_dw (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_tree_spec_fo; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_tree_spec_fo (
    code smallint NOT NULL,
    description character varying(100),
    grp_tree_species character varying(50),
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_tree_species_mix; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_tree_species_mix (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_tree_status; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_tree_status (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_treemix; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_treemix (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_type_validation; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_type_validation (
    code character varying(3) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_validated; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_validated (
    code character varying(2) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_variable; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_variable (
    code character varying(2) NOT NULL,
    description character varying(250),
    unit character varying(20),
    mandatory_l2_core smallint,
    mandatory_l2 smallint,
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_vertical_from; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_vertical_from (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_visibility; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_visibility (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_visible_crown; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_visible_crown (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_volume; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_volume (
    code smallint,
    description character varying,
    valid_from_survey_year smallint,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_water; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_water (
    code smallint NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_water_table_type; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_water_table_type (
    code smallint NOT NULL,
    description character varying(220),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: d_wrb_diagnostics; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_wrb_diagnostics (
    code character varying(3) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint,
    type character varying
);


----ALTER TABLE .*

--
-- Name: d_wrb_pub; Type: TABLE; Schema: d; Owner: geoadmin
--

CREATE TABLE d.d_wrb_pub (
    code character varying(8) NOT NULL,
    description character varying(250),
    valid_from_survey_year smallint NOT NULL,
    valid_to_survey_year smallint
);


----ALTER TABLE .*

--
-- Name: fmd_aq_aqa; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_aq_aqa (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint,
    code_plot integer NOT NULL,
    sampler_number smallint NOT NULL,
    date_aq date NOT NULL,
    hourly smallint NOT NULL,
    o3 numeric,
    so2 numeric,
    no2 numeric,
    nh3 numeric,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_aq_aqb; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_aq_aqb (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    sampler_number smallint NOT NULL,
    date_start date NOT NULL,
    date_end date,
    code_compound character varying(3) NOT NULL,
    value_aq numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_aq_aqp; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_aq_aqp (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint,
    code_plot integer NOT NULL,
    sampler_number smallint NOT NULL,
    code_compound character varying(3) NOT NULL,
    value_aq numeric,
    date_start date NOT NULL,
    date_end date,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_aq_col; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_aq_col (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint,
    code_plot integer NOT NULL,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    code_manufacturer_passive smallint,
    code_compound character varying(3) NOT NULL,
    inlet_height numeric NOT NULL,
    date_start date NOT NULL,
    hour_start smallint NOT NULL,
    date_end date,
    hour_end smallint,
    replicates_num smallint,
    replicates_mean numeric,
    replicates_std numeric,
    analyzer_mean_val numeric,
    analyzer_percent smallint,
    analyzer_limit_low numeric,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_bd_can; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_bd_can (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    bd_subplot smallint NOT NULL,
    date_survey date NOT NULL,
    code_canopy smallint,
    n_tree_layer smallint,
    n_trees smallint,
    dbh_perc smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_bd_dbh; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_bd_dbh (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    bd_subplot smallint NOT NULL,
    date_survey date NOT NULL,
    tree_number integer NOT NULL,
    dw_dbh numeric,
    code_tree_status smallint,
    distance numeric,
    azimuth smallint,
    code_tree_species smallint,
    code_decay smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_bd_dwd; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_bd_dwd (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    bd_subplot smallint NOT NULL,
    deadwood_id smallint NOT NULL,
    date_survey date NOT NULL,
    dw_type smallint,
    code_dw_species smallint,
    diameter numeric,
    dw_length numeric,
    code_decay smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_bd_gpl; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_bd_gpl (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    date_assess date NOT NULL,
    gps_plot character varying(1),
    datum character varying(6),
    projection character varying(19),
    utm_zone character varying(3),
    east_soil integer,
    north_soil integer,
    east_plot integer,
    north_plot integer,
    latitude_soil character varying(7),
    longitude_soil character varying(7),
    latitude_plot character varying(7),
    longitude_plot character varying(7),
    code_accuracy smallint,
    gps_elevation numeric,
    code_orientation smallint,
    slope smallint,
    code_preuse smallint,
    code_stand_actual smallint,
    code_manage_intensity smallint,
    code_manage_type_bd smallint,
    code_dw_rem smallint,
    code_treemix smallint,
    code_meanage_bd smallint,
    code_fencing smallint,
    code_forest_type_bd smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_bd_gvg; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_bd_gvg (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    bd_subplot smallint NOT NULL,
    date_survey date NOT NULL,
    code_species character varying(11) NOT NULL,
    code_layer_surface smallint NOT NULL,
    cover numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_bd_tht; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_bd_tht (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    bd_subplot smallint NOT NULL,
    date_survey date NOT NULL,
    tree_number integer NOT NULL,
    code_tree_species smallint,
    dw_dbh numeric,
    tree_height numeric,
    canopy_height numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_c1_trf; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_c1_trf (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    date_survey date NOT NULL,
    tree_number integer NOT NULL,
    code_affectpart smallint NOT NULL,
    code_symptom smallint NOT NULL,
    code_spec_symptom smallint NOT NULL,
    code_loccrown smallint NOT NULL,
    code_damage_age smallint NOT NULL,
    code_cause integer NOT NULL,
    code_cause_sc_name character varying(7) NOT NULL,
    code_extent smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_cc_trd; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_cc_trd (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    date_survey date NOT NULL,
    tree_number integer NOT NULL,
    code_affectpart smallint NOT NULL,
    code_symptom smallint NOT NULL,
    code_spec_symptom smallint NOT NULL,
    code_loccrown smallint NOT NULL,
    code_damage_age smallint NOT NULL,
    code_cause integer NOT NULL,
    code_cause_sc_name character varying(7) NOT NULL,
    code_extent smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_dp_dem; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_dp_dem (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    date_start date,
    date_end date,
    period_number smallint,
    sampler_id smallint,
    sample_id smallint,
    code_sampler smallint,
    code_vsampling smallint,
    ph numeric,
    conductivity numeric,
    k numeric,
    ca numeric,
    mg numeric,
    na numeric,
    n_nh4 numeric,
    cl numeric,
    n_no3 numeric,
    s_so4 numeric,
    alkalinity numeric,
    n_total numeric,
    doc numeric,
    al numeric,
    mn numeric,
    fe numeric,
    p_po4 numeric,
    cu numeric,
    zn numeric,
    hg numeric,
    pb numeric,
    co numeric,
    mo numeric,
    ni numeric,
    cd numeric,
    s_total numeric,
    c_total numeric,
    n_org numeric,
    p_total numeric,
    cr numeric,
    n_no2 numeric,
    hco3 numeric,
    don numeric,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    quantity numeric,
    other_obs character varying,
    line_nr integer,
    dem_pld_key character varying,
    qif_key character varying
);


----ALTER TABLE .*

--
-- Name: fmd_dp_lqa; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_dp_lqa (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_start date,
    date_end date,
    code_parameter character varying(7),
    code_sample_prep character varying(4),
    code_determination character varying(4),
    quantification_limit numeric,
    control_chart_mean numeric,
    control_chart_std numeric,
    laboratory_id character varying(3),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_f1_fom; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_f1_fom (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    sample_id smallint,
    start_date_analysis date,
    end_date_analysis date,
    mass_100_leaves numeric,
    mass_1000_needles numeric,
    n numeric,
    s numeric,
    p numeric,
    ca numeric,
    mg numeric,
    k numeric,
    na numeric,
    c numeric,
    zn numeric,
    mn numeric,
    fe numeric,
    cu numeric,
    pb numeric,
    cd numeric,
    b numeric,
    al numeric,
    arsenic numeric,
    cr numeric,
    co numeric,
    hg numeric,
    ni numeric,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer,
    qif_key character varying
);


----ALTER TABLE .*

--
-- Name: fmd_f1_fot; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_f1_fot (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    sample_id smallint,
    tree character varying,
    code_tree_species smallint,
    code_leaves_type smallint,
    other_obs smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_f1_lqa; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_f1_lqa (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_start date,
    date_end date,
    code_parameter character varying(2),
    code_pretreatment character varying(4),
    code_determination character varying(4),
    quantification_limit numeric,
    control_chart_mean numeric,
    control_chart_std numeric,
    laboratory_id character varying(3),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_fo_fom; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_fo_fom (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    sample_id smallint,
    start_date_analysis date,
    end_date_analysis date,
    mass_100_leaves numeric,
    mass_1000_needles numeric,
    n numeric,
    s numeric,
    p numeric,
    ca numeric,
    mg numeric,
    k numeric,
    na numeric,
    c numeric,
    zn numeric,
    mn numeric,
    fe numeric,
    cu numeric,
    pb numeric,
    cd numeric,
    b numeric,
    al numeric,
    arsenic numeric,
    cr numeric,
    co numeric,
    hg numeric,
    ni numeric,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer,
    qif_key character varying
);


----ALTER TABLE .*

--
-- Name: fmd_fo_fot; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_fo_fot (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    sample_id smallint,
    tree character varying,
    code_tree_species smallint,
    code_leaves_type smallint,
    fo_age_classes smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_fo_lqa; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_fo_lqa (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_start date,
    date_end date,
    code_parameter character varying(2),
    code_pretreatment character varying(4),
    code_determination character varying(4),
    quantification_limit numeric,
    control_chart_mean numeric,
    control_chart_std numeric,
    laboratory_id character varying(3),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gb_gbh; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gb_gbh (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    code_sample_number character varying(2) NOT NULL,
    date_analysis date,
    code_species character varying(11) NOT NULL,
    species_height numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gb_gbm; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gb_gbm (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    code_sample_number character varying(2),
    date_analysis date,
    sample_mass numeric,
    n numeric,
    s numeric,
    p numeric,
    ca numeric,
    mg numeric,
    k numeric,
    c numeric,
    zn numeric,
    mn numeric,
    fe numeric,
    cu numeric,
    pb numeric,
    cd numeric,
    b numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer,
    qif_key character varying
);


----ALTER TABLE .*

--
-- Name: fmd_gb_lqa; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gb_lqa (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_start date,
    date_end date,
    code_parameter character varying(2),
    code_pretreatment character varying(4),
    code_determination character varying(4),
    quantification_limit numeric,
    control_chart_mean numeric,
    control_chart_std numeric,
    laboratory_id character varying(3),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gr_iev; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gr_iev (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    trees_number smallint,
    basal_area_1 numeric,
    volume_1 numeric,
    basal_area_2 numeric,
    volume_2 numeric,
    thinning_0_5 smallint,
    basal_area_5 numeric,
    volume_5 numeric,
    thinning_5_10 smallint,
    basal_area_10 numeric,
    volume_10 numeric,
    thinning_10_15 smallint,
    basal_area_15 numeric,
    volume_15 numeric,
    thinning_15_20 smallint,
    basal_area_20 numeric,
    volume_20 numeric,
    thinning_20_25 smallint,
    basal_area_25 numeric,
    volume_25 numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gr_inv; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gr_inv (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    latitude character varying(7),
    longitude character varying(7),
    code_altitude smallint,
    date_sampling date NOT NULL,
    stemvol_remain numeric,
    stemvol_dead numeric,
    stemvol_removed numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    code_tree_species smallint NOT NULL,
    trees_remain integer,
    trees_dead integer,
    trees_removed integer,
    diameter_basal_area_tree numeric,
    height_basal_area_tree numeric,
    top_height_absolute numeric,
    trees_top_height smallint,
    top_height_relative numeric,
    percentage_top_height_relative numeric,
    gr_plot_id smallint,
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gr_ipm; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gr_ipm (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    gr_plot_id smallint,
    tree_number character varying,
    code_tree_species smallint,
    date_assessment date,
    diameter numeric,
    code_diameter_qc smallint,
    diameter2 numeric,
    code_diameter2_qc smallint,
    code_diameter smallint,
    bark numeric,
    code_bark_qc smallint,
    height numeric,
    code_height_qc smallint,
    tree_volume numeric,
    code_volume_qc smallint,
    code_volume smallint,
    crown_base_height numeric,
    code_base_height_qc smallint,
    crown_width numeric,
    code_crown_width_qc smallint,
    code_removal smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gr_irh; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gr_irh (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    gr_plot_id smallint NOT NULL,
    tree_number character varying NOT NULL,
    code_tree_species smallint,
    repetition smallint NOT NULL,
    date_analysis date NOT NULL,
    recent_year smallint,
    n_tree_rings smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gr_irm; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gr_irm (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    gr_plot_id smallint NOT NULL,
    tree_number character varying NOT NULL,
    repetition smallint NOT NULL,
    ring_number smallint NOT NULL,
    ring_width integer,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gr_irp; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gr_irp (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    gr_plot_id smallint NOT NULL,
    tree_number character varying NOT NULL,
    date_assessment date NOT NULL,
    diameter_actual numeric,
    diameter_time character(6) NOT NULL,
    code_measurement_avg smallint,
    code_dendrometer numeric,
    sensor_exchanged character varying(1),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gv_vem; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gv_vem (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    sample_id smallint,
    survey_number smallint,
    code_species character varying(17),
    code_layer_surface smallint,
    code_substrate smallint,
    species_cover numeric,
    code_certainty smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_la_lam; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_la_lam (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint,
    code_plot integer NOT NULL,
    survey_id smallint NOT NULL,
    point_id smallint NOT NULL,
    field_of_view smallint,
    date_measure date NOT NULL,
    time_measure character varying(6) NOT NULL,
    lai_max_point numeric,
    sai_point numeric,
    date_sai date,
    gap_fraction_point numeric,
    omega_point numeric,
    code_sky smallint,
    code_sun smallint,
    other_obs character varying,
    q_flag smallint,
    line_nr integer,
    change_date timestamp without time zone,
    code_line character varying(30)
);


----ALTER TABLE .*

--
-- Name: fmd_la_lap; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_la_lap (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    survey_id smallint,
    point_id smallint,
    date_measure date,
    time_measure character varying,
    image_filename character varying,
    camera character varying,
    lens character varying,
    exposure character varying,
    aperture character varying,
    iso numeric,
    light_value numeric,
    other_obs character varying,
    q_flag smallint,
    line_nr integer,
    change_date timestamp without time zone,
    code_line character varying(30)
);


----ALTER TABLE .*

--
-- Name: fmd_la_llf; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_la_llf (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    partner_code smallint,
    survey_id smallint NOT NULL,
    date_start date NOT NULL,
    date_end date NOT NULL,
    date_analysis date,
    code_tree_species smallint NOT NULL,
    traps_number smallint,
    total_sample_area numeric,
    sla_species numeric,
    lai_cum_species numeric,
    lai_max_species numeric,
    leaf_area_av numeric,
    leaf_area_sd numeric,
    other_obs character varying,
    q_flag smallint,
    line_nr integer,
    change_date timestamp without time zone,
    code_line character varying(30)
);


----ALTER TABLE .*

--
-- Name: fmd_lf_lfa; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_lf_lfa (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint NOT NULL,
    code_plot integer NOT NULL,
    mass_area_id character varying NOT NULL,
    start_date_analysis date,
    end_date_analysis date,
    mass numeric,
    area numeric,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_lf_lfc; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_lf_lfc (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint NOT NULL,
    code_plot integer NOT NULL,
    chem_id character varying NOT NULL,
    start_date_analysis date,
    end_date_analysis date,
    c numeric,
    n numeric,
    s numeric,
    p numeric,
    ca numeric,
    mg numeric,
    k numeric,
    zn numeric,
    mn numeric,
    fe numeric,
    cu numeric,
    pb numeric,
    b numeric,
    cd numeric,
    arsenic numeric,
    cr numeric,
    co numeric,
    hg numeric,
    ni numeric,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer,
    qif_key character varying
);


----ALTER TABLE .*

--
-- Name: fmd_lf_lfd; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_lf_lfd (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    date_start date,
    date_end date,
    trap_id smallint,
    code_tree_species smallint,
    code_sample numeric,
    dry_weight_70 numeric,
    dry_weight_105 numeric,
    chem_id character varying,
    mass_area_id character varying,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_lf_lqa; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_lf_lqa (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_start date,
    date_end date,
    code_parameter character varying(2),
    code_pretreatment character varying(4),
    code_determination character varying(4),
    quantification_limit numeric,
    control_chart_mean numeric,
    control_chart_std numeric,
    laboratory_id character varying(3),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_mm_meh; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_mm_meh (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    instrument_seq_nr smallint NOT NULL,
    code_variable character varying(2),
    date_observation date NOT NULL,
    hourly smallint NOT NULL,
    hourly_mean numeric,
    hourly_min numeric,
    hourly_max numeric,
    hourly_completeness smallint,
    code_data_origin smallint,
    code_data_status smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_mm_mem; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_mm_mem (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    instrument_seq_nr integer,
    code_variable character varying(2),
    date_observation date,
    daily_mean numeric,
    daily_min numeric,
    daily_max numeric,
    daily_completeness smallint,
    code_data_origin smallint,
    code_data_status smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_oz_lss; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_oz_lss (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    rectangle_number smallint,
    code_aspect smallint,
    date_sampling date,
    code_scientific_name character varying(38),
    code_flora_species character varying(12),
    ozone_symptoms character varying(1),
    leaves_collected character varying(1),
    seeds_collected character varying(1),
    code_validated character varying(2),
    code_type_validation character varying(4),
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_oz_ltf; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_oz_ltf (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    tree_number character varying(4),
    code_tree_species smallint,
    code_tree_species_sc character varying(38),
    sample_number smallint,
    date_sampling date,
    date_analysis date,
    code_symp_leaves smallint,
    code_symp_leaves_ly smallint,
    code_validated character varying(2),
    code_type_validation character varying(3),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_oz_ots; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_oz_ots (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_sampling date,
    code_scientific_name character varying(38),
    code_flora_species character varying(12),
    code_perenial_annual character varying(1),
    code_validated character varying(2),
    code_type_validation character varying(4),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_oz_ozp; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_oz_ozp (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    date_photo date NOT NULL,
    time_photo character varying(6) NOT NULL,
    rectangle_number smallint NOT NULL,
    image_filename character varying(37) NOT NULL,
    foliar_tree character varying(1),
    less character varying(1),
    other_species character varying(1),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_ph_phc; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_ph_phc (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    tree_number character varying(4) NOT NULL,
    code_event smallint NOT NULL,
    date_control date NOT NULL,
    code_score_control numeric,
    code_method smallint,
    team_id integer,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_ph_phd; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_ph_phd (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    tree_number character varying(4) NOT NULL,
    code_tree_species smallint NOT NULL,
    code_event smallint NOT NULL,
    image_filename character varying(28) NOT NULL,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_ph_plp; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_ph_plp (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    code_tree_species smallint,
    date_install date,
    tree_number character varying(4),
    code_visible_crown smallint,
    code_direction smallint,
    code_direction_vertical smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_s1_lqa; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_s1_lqa (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_start date,
    date_end date,
    code_parameter character varying(9),
    code_pretreatment character varying(4),
    code_sample_prep character varying,
    code_determination character varying(4),
    quantification_limit numeric,
    control_chart_mean numeric,
    control_chart_std numeric,
    laboratory_id character varying,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_s1_pfh; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_s1_pfh (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    profile_pit_id character varying,
    horizon_number integer,
    date_labor_analyses date,
    code_horizon_discont smallint,
    horizon_master character varying,
    horizon_subordinate character varying,
    horizon_vertical smallint,
    horizon_limit_up numeric,
    horizon_limit_low numeric,
    code_horizon_destinct smallint,
    code_horizon_topo smallint,
    code_soil_structure smallint,
    colour_moist character varying(13),
    colour_dry character varying(13),
    code_horizon_texture_class character varying(11),
    horizon_clay numeric,
    horizon_silt numeric,
    horizon_sand numeric,
    code_horizon_coarse_vol smallint,
    horizon_coarse_weight numeric,
    horizon_c_organic_total numeric,
    horizon_n_total numeric,
    horizon_caco3_total numeric,
    horizon_gypsum numeric,
    horizon_ph numeric,
    horizon_elec_cond numeric,
    horizon_exch_ca numeric,
    horizon_exch_mg numeric,
    horizon_exch_k numeric,
    horizon_exch_na numeric,
    horizon_cec numeric,
    code_horizon_porosity smallint,
    horizon_bulk_dens_measure numeric,
    horizon_bulk_dens_est numeric,
    code_roots_very_fine smallint,
    code_roots_fine smallint,
    code_roots_medium smallint,
    code_roots_coarse smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_s1_prf; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_s1_prf (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    profile_pit_id character varying,
    date_profile_desc date,
    latitude character varying(7),
    longitude character varying(7),
    elevation_profile smallint,
    code_wrb_soil_group character varying,
    code_wrb_qualifier_1 character varying,
    code_wrb_spezifier_1 character varying(1),
    code_wrb_qualifier_2 character varying,
    code_wrb_spezifier_2 character varying(1),
    code_wrb_qualifier_3 character varying,
    code_wrb_spezifier_3 character varying(1),
    code_wrb_qualifier_4 character varying,
    code_wrb_spezifier_4 character varying(1),
    code_wrb_qualifier_5 character varying,
    code_wrb_spezifier_5 character varying(1),
    code_wrb_qualifier_6 character varying,
    code_wrb_spezifier_6 character varying(1),
    classification_full_name character varying,
    diagnostic_1 character varying(3),
    depth_diagnostic_1 smallint,
    diagnostic_2 character varying(3),
    depth_diagnostic_2 smallint,
    diagnostic_3 character varying(3),
    depth_diagnostic_3 smallint,
    diagnostic_4 character varying(3),
    depth_diagnostic_4 smallint,
    diagnostic_5 character varying(3),
    depth_diagnostic_5 smallint,
    diagnostic_6 character varying(3),
    depth_diagnostic_6 smallint,
    diagnostic_7 character varying(3),
    depth_diagnostic_7 smallint,
    diagnostic_8 character varying(3),
    depth_diagnostic_8 smallint,
    diagnostic_9 character varying(3),
    depth_diagnostic_9 smallint,
    diagnostic_10 character varying(3),
    depth_diagnostic_10 smallint,
    code_wrb_publication character varying,
    code_parent_material_1 smallint,
    code_parent_material_2 smallint,
    code_water_level_high smallint,
    code_water_level_low smallint,
    code_water_type smallint,
    code_water smallint,
    code_humus smallint,
    eff_soil_depth smallint,
    rooting_depth smallint,
    rock_depth smallint,
    obstacle_depth smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_s1_som; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_s1_som (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    code_layer character varying(3),
    repetition smallint,
    layer_limit_superior numeric,
    layer_limit_inferior numeric,
    subsamples numeric,
    date_labor_analyses date,
    moisture_content numeric,
    part_size_clay numeric,
    part_size_silt numeric,
    part_size_sand numeric,
    code_texture_class character varying(11),
    bulk_density numeric,
    coarse_fragment_vol numeric,
    organic_layer_weight numeric,
    ph_cacl2 numeric,
    ph_h2o numeric,
    organic_carbon_total numeric,
    n_total numeric,
    carbonates numeric,
    exch_acidiy numeric,
    exch_al numeric,
    exch_ca numeric,
    exch_fe numeric,
    exch_k numeric,
    exch_mg numeric,
    exch_mn numeric,
    exch_na numeric,
    free_h numeric,
    extrac_al numeric,
    extrac_ca numeric,
    extrac_cd numeric,
    extrac_cr numeric,
    extrac_cu numeric,
    extrac_fe numeric,
    extrac_hg numeric,
    extrac_k numeric,
    extrac_mg numeric,
    extrac_mn numeric,
    extrac_na numeric,
    extrac_ni numeric,
    extrac_p numeric,
    extrac_pb numeric,
    extrac_s numeric,
    extrac_zn numeric,
    tot_al numeric,
    tot_ca numeric,
    tot_fe numeric,
    tot_k numeric,
    tot_mg numeric,
    tot_mn numeric,
    tot_na numeric,
    rea_al numeric,
    rea_fe numeric,
    p_ox numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer,
    qif_key character varying
);


----ALTER TABLE .*

--
-- Name: fmd_so_lqa; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_so_lqa (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_start date,
    date_end date,
    code_parameter character varying(9),
    code_pretreatment character varying(4),
    code_sample_prep character varying,
    code_determination character varying(4),
    quantification_limit numeric,
    control_chart_mean numeric,
    control_chart_std numeric,
    laboratory_id character varying(3),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_so_pfh; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_so_pfh (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    profile_pit_id character varying NOT NULL,
    horizon_number smallint NOT NULL,
    date_labor_analyses date NOT NULL,
    code_horizon_discont smallint,
    horizon_master character varying,
    horizon_subordinate character varying,
    horizon_vertical smallint,
    horizon_limit_up numeric,
    horizon_limit_low numeric,
    code_horizon_destinct smallint,
    code_horizon_topo smallint,
    code_soil_structure smallint,
    colour_moist character varying(13),
    colour_dry character varying(13),
    code_horizon_texture_class character varying(11),
    horizon_clay numeric,
    horizon_silt numeric,
    horizon_sand numeric,
    code_horizon_coarse_vol smallint,
    horizon_coarse_weight smallint,
    horizon_c_organic_total numeric,
    horizon_n_total numeric,
    horizon_caco3_total numeric,
    horizon_gypsum numeric,
    horizon_ph numeric,
    horizon_elec_cond numeric,
    horizon_exch_ca numeric,
    horizon_exch_mg numeric,
    horizon_exch_k numeric,
    horizon_exch_na numeric,
    horizon_cec numeric,
    code_horizon_porosity smallint,
    horizon_bulk_dens_measure numeric,
    horizon_bulk_dens_est numeric,
    code_roots_very_fine smallint,
    code_roots_fine smallint,
    code_roots_medium smallint,
    code_roots_coarse smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_so_prf; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_so_prf (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    profile_pit_id character varying,
    date_profile_desc date,
    latitude character varying(7),
    longitude character varying(7),
    elevation_profile smallint,
    code_wrb_soil_group character varying(2),
    code_wrb_qualifier_1 character varying,
    code_wrb_spezifier_1 character varying(1),
    code_wrb_qualifier_2 character varying,
    code_wrb_spezifier_2 character varying(1),
    code_wrb_qualifier_3 character varying,
    code_wrb_spezifier_3 character varying(1),
    code_wrb_qualifier_4 character varying,
    code_wrb_spezifier_4 character varying(1),
    code_wrb_qualifier_5 character varying,
    code_wrb_spezifier_5 character varying(1),
    code_wrb_qualifier_6 character varying,
    code_wrb_spezifier_6 character varying(1),
    classification_full_name character varying,
    diagnostic_1 character varying(3),
    depth_diagnostic_1 smallint,
    diagnostic_2 character varying(3),
    depth_diagnostic_2 smallint,
    diagnostic_3 character varying(3),
    depth_diagnostic_3 smallint,
    diagnostic_4 character varying(3),
    depth_diagnostic_4 smallint,
    diagnostic_5 character varying(3),
    depth_diagnostic_5 smallint,
    diagnostic_6 character varying(3),
    depth_diagnostic_6 smallint,
    diagnostic_7 character varying(3),
    depth_diagnostic_7 smallint,
    diagnostic_8 character varying(3),
    depth_diagnostic_8 smallint,
    diagnostic_9 character varying(3),
    depth_diagnostic_9 smallint,
    diagnostic_10 character varying(3),
    depth_diagnostic_10 smallint,
    code_wrb_publication character varying(5),
    code_parent_material_1 smallint,
    code_parent_material_2 smallint,
    code_water_level_high smallint,
    code_water_level_low smallint,
    code_water_type smallint,
    code_water smallint,
    code_humus smallint,
    eff_soil_depth smallint,
    rooting_depth smallint,
    rock_depth smallint,
    obstacle_depth smallint,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_so_som; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_so_som (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    code_layer character varying(3),
    repetition smallint,
    layer_limit_superior numeric,
    layer_limit_inferior numeric,
    subsamples smallint,
    date_labor_analyses date,
    moisture_content numeric,
    part_size_clay numeric,
    part_size_silt numeric,
    part_size_sand numeric,
    code_texture_class character varying(11),
    bulk_density numeric,
    coarse_fragment_vol smallint,
    organic_layer_weight numeric,
    ph_cacl2 numeric,
    ph_h2o numeric,
    organic_carbon_total numeric,
    n_total numeric,
    carbonates numeric,
    exch_acidiy numeric,
    exch_al numeric,
    exch_ca numeric,
    exch_fe numeric,
    exch_k numeric,
    exch_mg numeric,
    exch_mn numeric,
    exch_na numeric,
    free_h numeric,
    extrac_al numeric,
    extrac_ca numeric,
    extrac_cd numeric,
    extrac_cr numeric,
    extrac_cu numeric,
    extrac_fe numeric,
    extrac_hg numeric,
    extrac_k numeric,
    extrac_mg numeric,
    extrac_mn numeric,
    extrac_na numeric,
    extrac_ni numeric,
    extrac_p numeric,
    extrac_pb numeric,
    extrac_s numeric,
    extrac_zn numeric,
    tot_al numeric,
    tot_ca numeric,
    tot_fe numeric,
    tot_k numeric,
    tot_mg numeric,
    tot_mn numeric,
    tot_na numeric,
    rea_al numeric,
    rea_fe numeric,
    exch_bce numeric,
    exch_ace numeric,
    exch_cec numeric,
    elec_cond smallint,
    ni smallint,
    base_saturation numeric,
    origin character varying(15),
    code_soil_horizon_sample_c smallint,
    p_ox numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer,
    qif_key character varying
);


----ALTER TABLE .*

--
-- Name: fmd_ss_lqa; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_ss_lqa (
    survey_year smallint,
    code_country smallint,
    code_plot integer,
    date_start date,
    date_end date,
    code_parameter character varying(9),
    code_determination character varying(4),
    quantification_limit numeric,
    control_chart_mean numeric,
    control_chart_std numeric,
    laboratory_id character varying(3),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    code_sample_prep character varying(4),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_ss_ssm; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_ss_ssm (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    date_start date,
    date_end date,
    period_number smallint,
    sampler_number integer,
    sample_id integer,
    sample_vol numeric,
    ph numeric,
    conductivity numeric,
    k numeric,
    ca numeric,
    mg numeric,
    n_no3 numeric,
    s_so4 numeric,
    alkalinity numeric,
    al numeric,
    doc numeric,
    na numeric,
    n_nh4 numeric,
    cl numeric,
    n_total numeric,
    fe numeric,
    mn numeric,
    al_labile numeric,
    p numeric,
    cr numeric,
    ni numeric,
    zn numeric,
    cu numeric,
    pb numeric,
    cd numeric,
    si numeric,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer,
    qif_key character varying
);


----ALTER TABLE .*

--
-- Name: fmd_sw_swa; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_sw_swa (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    date_sampling date NOT NULL,
    sw_id character varying NOT NULL,
    code_depth_layer character varying(3) NOT NULL,
    replicate smallint NOT NULL,
    water_content_vol numeric,
    matric_preasure numeric NOT NULL,
    date_labor_analyses date,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_sw_swc; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_sw_swc (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    date_sampling date NOT NULL,
    pfh_id character varying(4),
    horizon_number smallint,
    sw_id character varying NOT NULL,
    code_depth_layer character varying(3) NOT NULL,
    ring_depth_upper smallint,
    ring_depth_lower smallint,
    replicate smallint NOT NULL,
    bulk_density numeric,
    date_labor_analyses date,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_tv_d1g; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_tv_d1g (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    tree_number integer NOT NULL,
    date_assessment date NOT NULL,
    diameter_actual numeric,
    diameter_time integer NOT NULL,
    code_measurement_avg smallint,
    code_dendrometer numeric,
    sensor_exchanged character varying(1),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_tv_d1t; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_tv_d1t (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    tree_number integer NOT NULL,
    date_assessment date NOT NULL,
    code_tree_age smallint,
    tree_age smallint,
    code_age_method smallint,
    age_cmnt character varying(40),
    code_fruit_assess numeric,
    fruit_cmnt character varying(40),
    cdrd_n numeric,
    cdrd_n_cmnt character varying(40),
    code_apical_shoot smallint,
    architecture_cmnt character varying(40),
    code_removal smallint,
    removal_cmnt character varying(40),
    code_affectpart smallint NOT NULL,
    code_symptom smallint NOT NULL,
    code_spec_symptom smallint NOT NULL,
    code_cause integer NOT NULL,
    code_cause_sc_name character varying(7),
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_gr_ira; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_gr_ira (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    code_plot integer NOT NULL,
    tree_number character varying(4) NOT NULL,
    code_tree_species smallint,
    dbh_actual numeric,
    diameter_0 numeric,
    diameter_5 numeric,
    diameter_10 numeric,
    diameter_15 numeric,
    diameter_20 numeric,
    diameter_25 numeric,
    diameter_30 numeric,
    diameter_35 numeric,
    diameter_40 numeric,
    diameter_45 numeric,
    diameter_50 numeric,
    other_obs character varying,
    partner_code smallint,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_li_lia; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_li_lia (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint NOT NULL,
    code_plot integer NOT NULL,
    code_species character varying(17) NOT NULL,
    loc_id smallint NOT NULL,
    loc_desc character varying(250) NOT NULL,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_li_lip; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_li_lip (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint NOT NULL,
    code_plot integer NOT NULL,
    latitude character varying(7),
    longitude character varying(7),
    plot_size numeric,
    code_subplot_design smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_li_lis; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_li_lis (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint NOT NULL,
    code_plot integer NOT NULL,
    tree_number character varying NOT NULL,
    aspect integer NOT NULL,
    code_species character varying(17) NOT NULL,
    frequency integer NOT NULL,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_li_lit; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_li_lit (
    survey_year smallint NOT NULL,
    code_country smallint NOT NULL,
    partner_code smallint NOT NULL,
    code_plot integer NOT NULL,
    tree_number character varying NOT NULL,
    code_bark_type integer,
    complementary_tree character varying(1),
    date_observation date,
    moss_cover smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_si_eve; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_si_eve (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    code_event_type character varying(2),
    code_event_location smallint,
    date_start date,
    date_end date,
    product_material character varying(150),
    code_tools smallint,
    trees_before smallint,
    trees_loss smallint,
    basal_area_before numeric,
    basal_area_loss numeric,
    code_logging_method smallint,
    code_extraction_tools smallint,
    code_extraction_method smallint,
    code_slash_disposal smallint,
    size_residues numeric,
    code_soil_compaction_ways smallint,
    code_soil_compaction_area smallint,
    pruning_max_height numeric,
    soil_preparation_depth smallint,
    soil_preparation_area numeric,
    chemics_composition character varying(250),
    chemics_quantity numeric,
    chemics_method character varying(250),
    code_treatment_aim smallint,
    code_preparation_type smallint,
    code_target_plant character varying(11),
    code_seedl_tree_species character varying(11),
    code_seedl_provenance_country smallint,
    seedl_provenance_locality character varying(50),
    code_seedl_stock smallint,
    seedl_age smallint,
    seedl_height smallint,
    code_seedl_nursery smallint,
    seedl_outlasting smallint,
    individuals_density smallint,
    other_obs character varying(400),
    q_flag smallint,
    change_date date,
    line_nr integer,
    code_line character varying
);


----ALTER TABLE .*

--
-- Name: fmd_si_sta; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_si_sta (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    code_stand_history smallint,
    code_prev_landuse numeric,
    code_stand_actual smallint,
    code_tree_species smallint,
    code_tree_species_mix smallint,
    top_height numeric,
    code_det_top_height smallint,
    code_forest_type smallint,
    code_mean_age smallint,
    code_tree_layers smallint,
    coverage_tree_layer smallint,
    canopy_closure smallint,
    code_status_mcpfe_class1 smallint,
    code_status_mcpfe_class2 smallint,
    code_status_mcpfe_class3 smallint,
    code_fencing smallint,
    code_notimb_util_plot smallint,
    code_notimb_util_buffer smallint,
    code_manage_type smallint,
    code_manage_intensity_plot smallint,
    code_manage_intensity_buffer smallint,
    code_silvicult_system smallint,
    code_forest_owner smallint,
    cutting_year smallint,
    code_canopy_gaps smallint,
    stand_rotation smallint,
    code_plot_status smallint,
    code_nfi_status smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_si_tco; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_si_tco (
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    tree_number character varying,
    cc_tree_number integer,
    fo_tree_number character varying,
    gr_tree_number character varying,
    oz_tree_number character varying,
    ph_tree_number character varying,
    code_tree_species smallint,
    azimuth numeric,
    distance numeric,
    tree_within character varying(1),
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- Name: fmd_y1_ev1; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_y1_ev1 (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    code_event_type character varying(2),
    code_event_location smallint,
    date_start date,
    date_end date,
    product_material character varying(150),
    code_tools smallint,
    trees_before smallint,
    trees_loss smallint,
    basal_area_before numeric,
    basal_area_loss numeric,
    code_logging_method smallint,
    code_extraction_tools smallint,
    code_extraction_method smallint,
    code_slash_disposal smallint,
    size_residues numeric,
    code_soil_compaction_ways smallint,
    code_soil_compaction_area smallint,
    pruning_max_height numeric,
    soil_preparation_depth smallint,
    soil_preparation_area numeric,
    chemics_composition character varying(250),
    chemics_quantity numeric,
    chemics_method character varying(250),
    code_treatment_aim smallint,
    code_preparation_type smallint,
    code_target_plant character varying(11),
    code_seedl_tree_species character varying(11),
    code_seedl_provenance_country smallint,
    seedl_provenance_locality character varying(50),
    code_seedl_stock smallint,
    seedl_age smallint,
    seedl_height smallint,
    code_seedl_nursery smallint,
    seedl_outlasting smallint,
    individuals_density smallint,
    other_obs character varying(400),
    q_flag smallint,
    change_date date,
    line_nr integer,
    code_line character varying
);


----ALTER TABLE .*

--
-- Name: fmd_y1_st1; Type: TABLE; Schema: fmd; Owner: geoadmin
--

CREATE TABLE fmd.fmd_y1_st1 (
    survey_year smallint,
    code_country smallint,
    partner_code smallint,
    code_plot integer,
    code_stand_history smallint,
    code_prev_landuse smallint,
    code_stand_actual smallint,
    code_tree_species smallint,
    code_tree_species_mix smallint,
    top_height numeric,
    code_det_top_height smallint,
    code_forest_type smallint,
    code_mean_age smallint,
    code_tree_layers smallint,
    coverage_tree_layer smallint,
    canopy_closure smallint,
    code_status_mcpfe_class1 smallint,
    code_status_mcpfe_class2 smallint,
    code_status_mcpfe_class3 smallint,
    code_fencing smallint,
    code_notimb_util_plot smallint,
    code_notimb_util_buffer smallint,
    code_manage_type smallint,
    code_manage_intensity_plot smallint,
    code_manage_intensity_buffer smallint,
    code_silvicult_system smallint,
    code_forest_owner smallint,
    cutting_year smallint,
    code_canopy_gaps smallint,
    stand_rotation smallint,
    code_plot_status smallint,
    code_nfi_status smallint,
    code_water smallint,
    code_humus smallint,
    other_obs character varying,
    q_flag smallint,
    change_date timestamp without time zone,
    code_line character varying(30),
    line_nr integer
);


----ALTER TABLE .*

--
-- PostgreSQL database dump complete
--

