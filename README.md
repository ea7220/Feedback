# Feedback



ALTER TABLE system_user
ADD COLUMN password VARCHAR(255);

UPDATE system_user SET password = '$2b$10$S426Wjdy5PoVnFGLkhSfvezoGpwIMxLfIr2hVGJXp3Z3g0YNVj2kS'
WHERE password IS NULL;

hmm mahtava paikka 