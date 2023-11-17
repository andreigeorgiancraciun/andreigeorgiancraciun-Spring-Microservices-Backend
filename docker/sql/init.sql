-- Create organizations table in the public schema
CREATE TABLE IF NOT EXISTS public.organizations
(
    organization_id text COLLATE pg_catalog."default" NOT NULL,
    name            text COLLATE pg_catalog."default",
    contact_name    text COLLATE pg_catalog."default",
    contact_email   text COLLATE pg_catalog."default",
    contact_phone   text COLLATE pg_catalog."default",
    CONSTRAINT organizations_pkey PRIMARY KEY (organization_id)
)
    TABLESPACE pg_default;

-- Set ownership of the organizations table to the postgres user
ALTER TABLE public.organizations
    OWNER to postgres;

-- Create licenses table in the public schema
CREATE TABLE IF NOT EXISTS public.licenses
(
    license_id      text COLLATE pg_catalog."default" NOT NULL,
    organization_id text COLLATE pg_catalog."default" NOT NULL,
    description     text COLLATE pg_catalog."default",
    product_name    text COLLATE pg_catalog."default" NOT NULL,
    license_type    text COLLATE pg_catalog."default" NOT NULL,
    comment         text COLLATE pg_catalog."default",
    CONSTRAINT licenses_pkey PRIMARY KEY (license_id),
    CONSTRAINT licenses_organization_id_fkey FOREIGN KEY (organization_id)
        REFERENCES public.organizations (organization_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY IMMEDIATE
)
    TABLESPACE pg_default;

-- Set ownership of the licenses table to the postgres user
ALTER TABLE public.licenses
    OWNER to postgres;

-- Create the keycloak schema
CREATE SCHEMA IF NOT EXISTS keycloak;

-- Set ownership of the keycloak schema to the postgres user
ALTER SCHEMA keycloak
    OWNER to postgres;