---
---  PostGIS, PostGIS_Topology and uuid-ossp are required
---
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION "uuid-ossp";

---
--- Fix the raster constraint search path error
---
ALTER FUNCTION st_iscoveragetile(raster,raster,integer,integer) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION st_bandmetadata(raster,integer) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION st_bandmetadata(raster,integer[]) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION st_numbands(raster) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION st_coveredby(raster,raster) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION st_coveredby(raster,integer,raster,integer) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION st_coveredby(geometry,geometry) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION _raster_constraint_pixel_types(raster) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION _raster_constraint_nodata_values(raster) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION _raster_constraint_out_db(raster) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION _raster_constraint_info_regular_blocking(name,name,name) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION _st_coveredby(raster,integer,raster,integer) SET search_path=pg_catalog,public,postgis;
ALTER FUNCTION _st_coveredby(geometry,geometry) SET search_path=pg_catalog,public,postgis;

---
--- Update spatial references if missing Albers custom projections
---
DO $$
DECLARE
   int_check INTEGER;
   
BEGIN
   
   SELECT COUNT(*)
   INTO int_check
   FROM
   spatial_ref_sys a
   WHERE
   a.srid = 5070;
   
   IF int_check = 0
   THEN   
      INSERT INTO spatial_ref_sys(
          srid
         ,auth_name
         ,auth_srid
         ,proj4text
         ,srtext
      ) VALUES (
          5070
         ,'NAD83 Continental US Albers Equal Area USGS'
         ,5070
         ,'+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs '
         ,'PROJCS["NAD83 Continental US Albers Equal Area USGS",GEOGCS["GCS_North_American_1983",DATUM["North_American_Datum_1983",SPHEROID["GRS_1980",6378137,298.257222101]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]],PROJECTION["Albers_Conic_Equal_Area"],PARAMETER["False_Easting",0],PARAMETER["False_Northing",0],PARAMETER["longitude_of_center",-96],PARAMETER["Standard_Parallel_1",29.5],PARAMETER["Standard_Parallel_2",45.5],PARAMETER["latitude_of_center",23],UNIT["Meter",1],AUTHORITY["EPSG","5070"]]'
      );
      
   END IF;

   SELECT COUNT(*)
   INTO int_check
   FROM
   spatial_ref_sys a
   WHERE
   a.srid = 3338;
   
   IF int_check = 0
   THEN 
      INSERT INTO spatial_ref_sys(
          srid
         ,auth_name
         ,auth_srid
         ,proj4text
         ,srtext
      ) VALUES (
          3338
         ,'NAD83 Alaska Albers Equal Area USGS'
         ,3338
         ,'+proj=aea +lat_1=55 +lat_2=65 +lat_0=50 +lon_0=-154 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs '
         ,'PROJCS["NAD83 Alaska Albers Equal Area USGS",GEOGCS["GCS_North_American_1983",DATUM["North_American_Datum_1983",SPHEROID["GRS_1980",6378137,298.257222101]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]],PROJECTION["Albers_Conic_Equal_Area"],PARAMETER["False_Easting",0],PARAMETER["False_Northing",0],PARAMETER["longitude_of_center",-154],PARAMETER["Standard_Parallel_1",55],PARAMETER["Standard_Parallel_2",65],PARAMETER["latitude_of_center",50],UNIT["Meter",1],AUTHORITY["EPA OW","990003"]]'
      );
      
   END IF;

   SELECT COUNT(*)
   INTO int_check
   FROM
   spatial_ref_sys a
   WHERE
   a.srid = 990002;
   
   IF int_check = 0
   THEN 
      INSERT INTO spatial_ref_sys(
          srid
         ,auth_name
         ,auth_srid
         ,proj4text
         ,srtext
      ) VALUES (
          990002
         ,'NAD83 Hawaii Albers Equal Area USGS'
         ,990002
         ,'+proj=aea +lat_1=8 +lat_2=18 +lat_0=3 +lon_0=-157 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs '
         ,'PROJCS["NAD83 Hawaii Albers Equal Area USGS",GEOGCS["GCS_North_American_1983",DATUM["North_American_Datum_1983",SPHEROID["GRS_1980",6378137,298.257222101]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]],PROJECTION["Albers_Conic_Equal_Area"],PARAMETER["False_Easting",0],PARAMETER["False_Northing",0],PARAMETER["longitude_of_center",-157],PARAMETER["Standard_Parallel_1",8],PARAMETER["Standard_Parallel_2",18],PARAMETER["latitude_of_center",3],UNIT["Meter",1],AUTHORITY["EPA OW","990002"]]'
      );
      
   END IF;

   SELECT COUNT(*)
   INTO int_check
   FROM
   spatial_ref_sys a
   WHERE
   a.srid = 990004;
   
   IF int_check = 0
   THEN 
      INSERT INTO spatial_ref_sys(
          srid
         ,auth_name
         ,auth_srid
         ,proj4text
         ,srtext
      ) VALUES (
          990004
         ,'NAD83 Puerto Rico/Virgin Islands Albers Equal Area USGS'
         ,990004
         ,'+proj=aea +lat_1=8 +lat_2=18 +lat_0=3 +lon_0=-66 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs '
         ,'PROJCS["NAD83 Puerto Rico/Virgin Islands Albers Equal Area USGS",GEOGCS["GCS_North_American_1983",DATUM["North_American_Datum_1983",SPHEROID["GRS_1980",6378137,298.257222101]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]],PROJECTION["Albers_Conic_Equal_Area"],PARAMETER["False_Easting",0],PARAMETER["False_Northing",0],PARAMETER["longitude_of_center",-66],PARAMETER["Standard_Parallel_1",8],PARAMETER["Standard_Parallel_2",18],PARAMETER["latitude_of_center",3],UNIT["Meter",1],AUTHORITY["EPA OW","990004"]]'
      );
      
   END IF;

   SELECT COUNT(*)
   INTO int_check
   FROM
   spatial_ref_sys a
   WHERE
   a.srid = 990005;
   
   IF int_check = 0
   THEN 
      INSERT INTO spatial_ref_sys(
          srid
         ,auth_name
         ,auth_srid
         ,proj4text
         ,srtext
      ) VALUES (
          990005
         ,'NAD83 Pacific Trust Albers Equal Area USGS'
         ,990005
         ,'+proj=aea +lat_1=8 +lat_2=18 +lat_0=3 +lon_0=145 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs '
         ,'PROJCS["NAD83 Pacific Trust Albers Equal Area USGS",GEOGCS["GCS_North_American_1983",DATUM["North_American_Datum_1983",SPHEROID["GRS_1980",6378137,298.257222101]],PRIMEM["Greenwich",0],UNIT["Degree",0.017453292519943295]],PROJECTION["Albers_Conic_Equal_Area"],PARAMETER["False_Easting",0],PARAMETER["False_Northing",0],PARAMETER["longitude_of_center",145],PARAMETER["Standard_Parallel_1",8],PARAMETER["Standard_Parallel_2",18],PARAMETER["latitude_of_center",3],UNIT["Meter",1],AUTHORITY["EPA OW","990005"]]'
      );
      
   END IF;

END$$;

---
--- Create the base NHDPLUS schema
---
CREATE SCHEMA nhdplus AUTHORIZATION nhdplus;
GRANT ALL ON SCHEMA nhdplus TO nhdplus;
GRANT USAGE ON SCHEMA nhdplus TO public;

---
--- Create the NHDPLUS topology schemas
---
CREATE SCHEMA catchmentsp_np21_acu_topo AUTHORIZATION nhdplus;
GRANT ALL ON SCHEMA catchmentsp_np21_acu_topo TO nhdplus;
GRANT USAGE ON SCHEMA catchmentsp_np21_acu_topo TO public;

CREATE SCHEMA catchmentsp_np21_lpv_topo AUTHORIZATION nhdplus;
GRANT USAGE ON SCHEMA catchmentsp_np21_lpv_topo TO public;
REVOKE ALL ON SCHEMA catchmentsp_np21_lpv_topo FROM nhdplus;

CREATE SCHEMA catchmentsp_np21_uhi_topo AUTHORIZATION nhdplus;
GRANT ALL ON SCHEMA catchmentsp_np21_uhi_topo TO nhdplus;
GRANT USAGE ON SCHEMA catchmentsp_np21_uhi_topo TO public;

---
--- Create the base NHDPLUS_NAVIGATION schema
---
CREATE SCHEMA nhdplus_navigation AUTHORIZATION nhdplus_navigation;
GRANT ALL ON SCHEMA nhdplus_navigation TO nhdplus_navigation;
GRANT USAGE ON SCHEMA nhdplus_navigation TO public;

---
--- Create the base NHDPLUS_INDEXING schema
---
CREATE SCHEMA nhdplus_indexing AUTHORIZATION nhdplus_indexing;
GRANT ALL ON SCHEMA nhdplus_indexing TO nhdplus_indexing;
GRANT USAGE ON SCHEMA nhdplus_indexing TO public;

---
--- Create the base NHDPLUS_DELINEATION schema
---
CREATE SCHEMA nhdplus_delineation AUTHORIZATION nhdplus_delineation;
GRANT ALL ON SCHEMA nhdplus_delineation TO nhdplus_delineation;
GRANT USAGE ON SCHEMA nhdplus_delineation TO public;

