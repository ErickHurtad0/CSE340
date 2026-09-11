
import db from './db.js';

const getAllCategories = async () => {
    const sql = `
        SELECT *
        FROM category
        ORDER BY name;
    `;

    const result = await db.query(sql);
    return result.rows;
};

export { getAllCategories };