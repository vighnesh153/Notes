### Relational
* Hard to scale (can scale to ~10-100 TB) and can only be vertically scaled unless sharded
* Atomic transactions supported
* Fast updates
* Slow queries
* Structured Data

### Document DB
* Easy to scale (can scale to ~10 PB) and can be horizontally scaled
* Doesn't support atomic transactions
* Slow updates
* Fast queries
* Semi-structured / Unstructured data.


### Cheat Sheet
* For **cache** --- use **key-value DB** like **Redis**, **Memcached**
* For **graph**-like data --- use a **graph DB** like **neo4j**
* If you tend to query on **subsets of columns** /features --- use **column DB** like **Cassandra**.
* For other usecases, use **Relational** or **Document DB**

##### Examples
* Relational: **MySQL**, **PostgreSQL**, **Oracle**, **MS SQL Server**
* Document oriented: **MongoDB**, **DynamoDB**, **CouchDB**
