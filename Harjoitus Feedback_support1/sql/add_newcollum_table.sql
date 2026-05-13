    ALTER TABLE system_user 
    ADD COLUMN IF NOT EXISTS password VARCHAR(255) AFTER email;


    UPDATE system_user 
    SET password = '$2b$10$S426Wjdy5PoVnFGLkhSfvezoGpwIMxLfIr2hVGJXp3Z3g0YNVj2kS' 
    WHERE admin = true;
