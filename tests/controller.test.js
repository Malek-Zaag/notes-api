const app = require("../app")
const request = require("supertest");

describe("testing routes", () => {

    test("get ", done => {
        request(app)
            .get("/notes")
            .then(response => {
                expect(response.statusCode).toBe(200);
                done();
            });
    })

    test("post request to add note", async () => {
        const response = await request(app)
            .post("/addNote")
            .send({
                title: "todo1",
                dueDate: "2012-04-23T18:25:43.511Z",
                state: "not done"
            })
        expect(response.statusCode).toBe(200)
        expect(response.body).not.toBeNull()
    })

    test("update request to update note", async () => {
        const response = await request(app)
            .put("/updateNote")
            .send({
                title: "todo1",
                dueDate: "2044444",
                state: "done"
            })
        expect(response.statusCode).toBe(200)
        expect(response.body).not.toBeNull()
    })
})