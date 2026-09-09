
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(200) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES organization(organization_id)
);

INSERT INTO service_project
(organization_id, title, description, location, date)
VALUES
(1, 'Community Food Drive',
 'Collect and distribute food to families in need.',
 'Mexico City',
 '2026-09-15'),

(1, 'Neighborhood Cleanup',
 'Clean public areas and remove litter from the neighborhood.',
 'Ecatepec',
 '2026-09-20'),

(1, 'School Supply Donation',
 'Collect school supplies for local students.',
 'Mexico City',
 '2026-09-25'),

(1, 'Tree Planting Day',
 'Plant trees and improve local green spaces.',
 'Naucalpan',
 '2026-10-03'),

(1, 'Clothing Donation',
 'Collect and distribute clothing to families in need.',
 'Mexico City',
 '2026-10-10'),

(2, 'Beach Cleanup',
 'Remove trash from the beach and surrounding areas.',
 'Veracruz',
 '2026-09-18'),

(2, 'Youth Mentoring',
 'Provide mentoring and educational support to young people.',
 'Mexico City',
 '2026-09-22'),

(2, 'Community Garden',
 'Create and maintain a community vegetable garden.',
 'Mexico City',
 '2026-09-28'),

(2, 'Senior Assistance Day',
 'Help elderly community members with household tasks.',
 'Ecatepec',
 '2026-10-05'),

(2, 'Recycling Campaign',
 'Promote recycling and collect recyclable materials.',
 'Mexico City',
 '2026-10-12'),

(3, 'Homeless Support',
 'Prepare and distribute care packages to people experiencing homelessness.',
 'Mexico City',
 '2026-09-17'),

(3, 'Park Restoration',
 'Restore playgrounds and public park areas.',
 'Coacalco',
 '2026-09-24'),

(3, 'Medical Supply Drive',
 'Collect essential medical supplies for community organizations.',
 'Mexico City',
 '2026-10-01'),

(3, 'Literacy Workshop',
 'Provide reading and writing support to children.',
 'Ecatepec',
 '2026-10-08'),

(3, 'Holiday Donation Drive',
 'Collect donations for families during the holiday season.',
 'Mexico City',
 '2026-10-15');






CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id)
        REFERENCES service_project(project_id)
        ON DELETE CASCADE,
    FOREIGN KEY (category_id)
        REFERENCES category(category_id)
        ON DELETE CASCADE
);

INSERT INTO category (name)
VALUES
    ('Environmental'),
    ('Community Outreach'),
    ('Education');

INSERT INTO project_category (project_id, category_id)
VALUES
    (1, 1),
    (1, 3),
    (2, 2),
    (3, 1),
    (4, 1),
    (5, 2),
    (6, 1),
    (7, 3),
    (8, 1),
    (9, 2),
    (10, 1),
    (11, 2),
    (12, 1),
    (13, 2),
    (14, 3),
    (15, 2);