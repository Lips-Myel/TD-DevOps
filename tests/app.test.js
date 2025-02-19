

const request = require('supertest');
const app = require('../app.js');  // Adapter le chemin si nécessaire

describe('GET /', () => {
    it('should return Hello World', async () => {
        const res = await request(app).get('/');
        expect(res.statusCode).toBe(200);
        expect(res.text).toBe('Hello World!');
    });
});

