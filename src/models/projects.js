
import db from './db.js'

async function getAllProjects() {
    const sql = `
        SELECT
            service_project.project_id,
            service_project.organization_id,
            service_project.title,
            service_project.description,
            service_project.location,
            service_project.date,
            organization.name AS organization_name
        FROM service_project
        JOIN organization
            ON service_project.organization_id = organization.organization_id
        ORDER BY service_project.date;
    `;

    const result = await db.query(sql);

    return result.rows;
}

export { getAllProjects };