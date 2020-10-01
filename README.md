# MySQL in Docker

## Getting Started

1. Download and Install Docker Community Edition
2. From the project root, run `docker-compose up --build`
3. When you see a message that contains the string `[Server] /usr/sbin/mysqld: ready for connections.`, open another shell and type `docker exec -it mysql bash` to get a bash shell inside the `mysql` container.
4. Once you're in, type `mysql -u snootbooper -p`, then enter `boopem123` when prompted for the password
5. Now you're in the MySQL shell for your container-based MySQL server. To query it:
    - Type `use dogs;` to set your DB to `dogs`. Don't forget those semicolons.
    - Type `show tables` to see what tables you have available.
    - Try `SELECT * FROM dog;` and see what happens. You should get the results in your shell.
    - ALTERNATIVELY, you can use a GUI tool like DBeaver to create a connection and query the DB
6. To end your session and shut the DB down, go back to your `docker-compose` shell and do a `ctrl+c`, or open another shell in the project root and enter `docker-compose down --volumes`.

## Troubleshooting
- if the table creation or seed fails, you'll need to fix whatever part of your script failed and run `docker-compose down --volumes` before you try again.

## Considerations
- Why not just `docker run` for this? I wanted to provide an example so that folks could create their own app stacks with MySQL by adding services to the `docker-compose.yml` file. Plus, I prefer the `yml` syntax to passing all those options as command-line args or writing a shell script.
- Obviously, these passwords aren't secure and I also put them on a public GitHub. I don't use these, nor do I recommend you use them. DON'T STORE REAL PASSWORDS IN SOURCE CONTROL.
- Using an `AUTO_INCREMENT` integer is pretty typical for IDs in databases, but they come with the risk of [Insecure Direct Object Reference](https://cheatsheetseries.owasp.org/cheatsheets/Insecure_Direct_Object_Reference_Prevention_Cheat_Sheet.html), which means that without deliberate access controls, you could find your data leaking out to malicious actors. See the linked article for ideas on how to mitigate this.
- Why `INTEGER UNSIGNED` for IDs? I don't expect negative IDs from an `AUTO_INCREMENT` starting at `1` and it gives me a larger upper limit for free, basically. However, if you plan on creating a vast number of rows, consider using `BIGINT`. If you don't expect to create many, you can use `TINYINT` to save room.
