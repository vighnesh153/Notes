<table width="100%">
  <thead>
    <tr>
      <th></th>
      <th>PostgreSQL</th>
      <th>MySQL</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Known as</td>
      <td>
        The world’s most <strong>advanced </strong>open
        source database.
      </td>
      <td>
        The world’s most <strong>popular </strong>open
        source database.
      </td>
    </tr>
    <tr>
      <td>Development</td>
      <td>
        PostgreSQL is an open source
        <strong>project</strong>.
      </td>
      <td>
        MySQL is an open-source <strong>product</strong>.
      </td>
    </tr>
    <tr>
      <td>Pronunciation</td>
      <td>post gress queue ell</td>
      <td>my ess queue ell</td>
    </tr>
    <tr>
      <td>Licensing</td>
      <td>MIT-style license</td>
      <td>GNU General Public License</td>
    </tr>
    <tr>
      <td>Implementation programming language</td>
      <td>C</td>
      <td>C/C++</td>
    </tr>
    <tr>
      <td>GUI tool</td>
      <td>PgAdmin</td>
      <td>MySQL Workbench</td>
    </tr>
    <tr>
      <td>ACID</td>
      <td>Yes</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>Storage engine</td>
      <td><strong>Single</strong> storage engine</td>
      <td>
        <strong>Multiple</strong>
        <a href="http://www.mysqltutorial.org/understand-mysql-table-types-innodb-myisam.aspx">
            storage engines
        </a>
        e.g., InnoDB and MyISAM
      </td>
    </tr>
    <tr>
      <td>Full-text search</td>
      <td>Yes</td>
      <td>Yes (Limited)</td>
    </tr>
    <tr>
      <td>
        Drop a
        <a href="https://www.postgresqltutorial.com/postgresql-temporary-table/">
            temporary table
        </a>
      </td>
      <td>
        No <code>TEMP</code> or
        <code>TEMPORARY</code> keyword in
        <code>DROP TABLE</code> statement
      </td>
      <td>
        Support the <code>TEMP</code> or
        <code>TEMPORARY</code> keyword in the
        <code>DROP TABLE</code> statement that allows you to
        remove the temporary table only.
      </td>
    </tr>
    <tr>
      <td>
        <a href="https://www.postgresqltutorial.com/postgresql-drop-table/">
            <code>DROP TABLE</code>
        </a>
      </td>
      <td>
        Support <code>CASCADE</code> option to drop table’s
        dependent objects e.g., tables and views.
      </td>
      <td>Does not support <code>CASCADE</code> option.</td>
    </tr>
    <tr>
      <td>
        <a href="https://www.postgresqltutorial.com/postgresql-truncate-table/">
            &nbsp;<code>TRUNCATE TABLE </code>
        </a>
      </td>
      <td>
        PostgreSQL <code>TRUNCATE TABLE</code> supports more
        features like <code>CASCADE</code>,
        <code>RESTART IDENTITY</code>,
        <code>CONTINUE IDENTITY</code>, transaction-safe,
        etc.
      </td>
      <td>
        <a href="http://www.mysqltutorial.org/mysql-truncate-table/">
            MySQL <code>TRUNCATE TABLE</code>
        </a>&nbsp;does not support <code>CASCADE</code> and
        transaction safe i.e,. once data is deleted, it
        cannot be rolled back.
      </td>
    </tr>
    <tr>
      <td>Auto increment Column</td>
      <td>
        &nbsp;
        <a href="https://www.postgresqltutorial.com/postgresql-serial/">
            <code>SERIAL</code>
        </a>
      </td>
      <td>
        &nbsp;<a href="http://www.mysqltutorial.org/mysql-sequence/">
          <code>AUTO_INCREMENT</code>
         </a>
      </td>
    </tr>
    <tr>
      <td>
        <a href="https://www.postgresqltutorial.com/postgresql-identity-column/">
            Identity Column
        </a>
      </td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>Analytic functions</td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>
        <a href="https://www.postgresqltutorial.com/postgresql-data-types/">
            Data types
        </a>
      </td>
      <td>
        Support many advanced types such as
        <a href="https://www.postgresqltutorial.com/postgresql-array/">
            array
         </a>,
        <a href="https://www.postgresqltutorial.com/postgresql-hstore/">
            hstore
        </a>, and
        <a href="https://www.postgresqltutorial.com/postgresql-user-defined-data-types/">
            user-defined type
        </a>.
      </td>
      <td>SQL-standard types</td>
    </tr>
    <tr>
      <td>
        Unsigned
        <a href="https://www.postgresqltutorial.com/postgresql-integer/">
            integer
        </a>
      </td>
      <td>No</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <a href="https://www.postgresqltutorial.com/postgresql-boolean/">
            Boolean type
        </a>
      </td>
      <td>Yes</td>
      <td>
        Use <code>TINYINT(1)</code> internally for
        <a href="http://www.mysqltutorial.org/mysql-boolean/">
            Boolean
        </a>
      </td>
    </tr>
    <tr>
      <td>IP address data type</td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>Set default value for a column</td>
      <td>Support both constant and function call</td>
      <td>
        Must be a constant or
        <code>CURRENT_TIMESTAMP</code> for
        <code>TIMESTAMP</code> or
        <code>DATETIME</code> columns
      </td>
    </tr>
    <tr>
      <td>
        <a href="https://www.postgresqltutorial.com/postgresql-cte/">
            CTE
        </a>
      </td>
      <td>Yes</td>
      <td>
        Yes (Supported
        <a href="http://www.mysqltutorial.org/mysql-cte/">
            CTE
        </a>
        since MySQL 8.0)
      </td>
    </tr>
    <tr>
      <td>&nbsp;<code>EXPLAIN</code> output</td>
      <td>More detailed</td>
      <td>Less detailed</td>
    </tr>
    <tr>
      <td>
        <a href="https://www.postgresqltutorial.com/postgresql-materialized-views/">
            Materialized views
        </a>
      </td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>
        <a href="https://www.postgresqltutorial.com/postgresql-check-constraint/">
            CHECK constraint
        </a>
      </td>
      <td>Yes</td>
      <td>
        Yes (Supported since MySQL 8.0.16, Before that MySQL
        just ignored the
        <a href="http://www.mysqltutorial.org/mysql-check-constraint/">
            CHECK constraint
        </a>)
      </td>
    </tr>
    <tr>
      <td>Table inheritance</td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>
        Programming languages for
        <a href="https://www.postgresqltutorial.com/postgresql-stored-procedures/">
            stored procedures
        </a>
      </td>
      <td>
        Ruby, Perl, Python, TCL, PL/pgSQL, SQL, JavaScript,
        etc.
      </td>
      <td>
        SQL:2003 syntax for
        <a href="http://www.mysqltutorial.org/mysql-stored-procedure-tutorial.aspx">
          stored&nbsp;procedures
        </a>
      </td>
    </tr>
    <tr>
      <td>
        <a href="https://www.postgresqltutorial.com/postgresql-full-outer-join/">
            &nbsp;<code>FULL OUTER JOIN</code>
        </a>
      </td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>
        &nbsp;
        <a href="https://www.postgresqltutorial.com/postgresql-intersect/">
            <code>INTERSECT</code>
        </a>
      </td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>
        <a href="https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-except/">
            &nbsp;<code>EXCEPT</code>
        </a>
      </td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>Partial indexes</td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>Bitmap indexes</td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>Expression indexes</td>
      <td>Yes</td>
      <td>No</td>
    </tr>
    <tr>
      <td>Covering indexes</td>
      <td>Yes (since version 9.2)</td>
      <td>
        Yes. MySQL supports covering indexes that allow data
        to be retrieved by scanning the index alone without
        touching the table data. This is advantageous in
        case of large tables with millions of rows.
      </td>
    </tr>
    <tr>
      <td>
        <a href="https://www.postgresqltutorial.com/postgresql-triggers/">
            Triggers
        </a>
      </td>
      <td>
        Support triggers that can fire on most types of
        command, except for ones affecting the database
        globally e.g., roles and tablespaces.
      </td>
      <td>Limited to some commands</td>
    </tr>
    <tr>
      <td>Partitioning</td>
      <td>RANGE, LIST</td>
      <td>
        RANGE, LIST, HASH, KEY, and composite partitioning
        using a combination of RANGE or LIST with HASH or
        KEY subpartitions
      </td>
    </tr>
    <tr>
      <td>Task Schedule</td>
      <td>pgAgent</td>
      <td>
        <a href="http://www.mysqltutorial.org/mysql-triggers/working-mysql-scheduled-event/">
            Scheduled event
        </a>
      </td>
    </tr>
    <tr>
      <td>Connection Scalability</td>
      <td>Each new connection is an OS process</td>
      <td>Each new connection is an OS thread</td>
    </tr>
  </tbody>
</table>
