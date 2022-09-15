# CQ2
Clinical Query 2;
Version 1.0.1;
September 24, 2021

Created by:
Griffin M Weber, MD, PhD;
Nick Benik;
Nick Brown;
Ken Huling;
Yun William Yu, PhD

Please direct questions to:
Griffin M Weber, MD, PhD;
Associate Professor of Medicine and Biomedical Informatics;
Beth Israel Deaconess Medical Center;
Harvard Medical School;
weber@hms.harvard.edu

OVERVIEW

Clinical Query 2 (CQ2) was initially developed at Beth Israel Deaconess Medical Center (BIDMC) and Harvard Medical School (HMS) in 2008 to serve as BIDMC’s i2b2 system. Back then, BIDMC did not support Java applications. We therefore rewrote the Java-based application layer of i2b2 as Microsoft SQL Server stored procedures. This allowed us to replace all the i2b2 Java code with a single web service proxy, which simply passes an i2b2 XML request message to a database stored procedure and returns the i2b2 XML response message that comes back from the database. 

In addition to replacing the Java code, while i2b2 uses several databases (one for each cell), we merged them all into a single database, using different schemas for each cell. CQ2 is this combined database, the stored procedures, and the web service proxy. CQ2 retains the same “star schema” to store clinical data as i2b2, it uses i2b2 ontologies, and it has the same API message format as i2b2. As new versions of i2b2 are released, we update CQ2 to support (nearly all of) the new features. As a result, CQ2 works with any i2b2 client software and appears like any other i2b2 node in federated SHRINE networks.

FEATURES

By consolidating all the data and code into a single database, CQ2 has several advantages over i2b2: (1) It is easier to install and support since there are fewer components to manage, fewer database accounts to configure, fewer web applications to setup, etc. (2) It minimizes network traffic and improves performance since all the processing occurs within a single database. (3) Only a tiny amount of storage and resources are needed on the application/web server. (4) The code can be greatly simplified—all the CQ2 stored procedures total less than 7000 lines of code and are under 400 KB. In contrast, the i2b2 Java code is nearly 100 MB.

A unique feature of CQ2 is its query engine. Optimized indexes and the use of stored procedures make queries generally run faster than i2b2. CQ2 has two optional features to greatly improve performance (orders of magnitude faster), which you can enable or disable. The first precomputes a set of aggregate tables derived from the i2b2 fact and dimension tables. Many queries can be run on these much smaller aggregate tables rather than on the original data. The second uses a class of computational algorithms that compress the original data into small “probabilistic sketches”. The sketches can be used to obtain a very fast and accurate estimate of any query. Even with millions of patients and billions of data facts, sketch-based queries typically require less than a second to return an estimate within 10% of the actual count, and a few seconds to be within 1%. When running a query, the user can choose whether to optimize for speed or accuracy, or to continue running the query until the actual exact result is found.

USE CASES

CQ2 has two primary use cases. The first is serving as an institution’s “enterprise” i2b2 system. Its performance optimizations enable it to scale to massive sizes (100+ million patients). The second is as an i2b2 node in federated networks. The fact that it is just a single database and one web service proxy file makes it easy to “spin up” new instances to plug into these networks. However, because CQ2 does not include the i2b2 Java layer, it does not support i2b2 Java plugins that have been developed for specialized use cases, such as image processing or genomics pipelines.

INSTALLATION

We recommend that organizations interested in using CQ2 download the latest release zip file from https://github.com/GriffinWeber/CQ2/releases. The release zip contains fully tested code, and includes simplified database install and upgrade scripts. The installation process is documented in the CQ2Documentation.docx file.

CQ2 Developers who wish to build the latest code can do so by cloning the GitHub repo. Note that we only perform a full regression test on release builds, therefore we recommend that production deployments stick to these. GitHub does not contain build and upgrade scripts (as these are generated during the release build process), instead, the Release/BuildDatabase/BuildDemoData.bat script can be used to build the latest CQ2 database and load the demo data from a clone of the GitHub repo.
