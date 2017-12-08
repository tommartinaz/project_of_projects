--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: tom
--

CREATE TABLE knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE knex_migrations OWNER TO tom;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: tom
--

CREATE SEQUENCE knex_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE knex_migrations_id_seq OWNER TO tom;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tom
--

ALTER SEQUENCE knex_migrations_id_seq OWNED BY knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: tom
--

CREATE TABLE knex_migrations_lock (
    is_locked integer
);


ALTER TABLE knex_migrations_lock OWNER TO tom;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: tom
--

CREATE TABLE locations (
    id integer NOT NULL,
    city character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE locations OWNER TO tom;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: tom
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_id_seq OWNER TO tom;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tom
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: tom
--

CREATE TABLE projects (
    id integer NOT NULL,
    business_name character varying(255),
    proj_name character varying(255) NOT NULL,
    contact_name character varying(255),
    contact_phone_num character varying(255),
    contact_email character varying(255),
    proj_type character varying(255),
    tech_stack character varying(255),
    short_desc character varying(255),
    long_desc text,
    is_capstone_worthy boolean,
    user_id integer,
    location_id integer,
    is_paid boolean,
    business_problem text,
    url character varying(255),
    wish_ct integer DEFAULT 0,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE projects OWNER TO tom;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: tom
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO tom;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tom
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: tom
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    phone_number character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE users OWNER TO tom;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: tom
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO tom;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tom
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: tom
--

ALTER TABLE ONLY knex_migrations ALTER COLUMN id SET DEFAULT nextval('knex_migrations_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: tom
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: tom
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: tom
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: tom
--

COPY knex_migrations (id, name, batch, migration_time) FROM stdin;
1	01_create_users_table.js	1	2017-11-15 08:23:40.331-07
2	02_create_locations_table.js	1	2017-11-15 08:23:40.343-07
3	03_create_projects_table.js	1	2017-11-15 08:23:40.358-07
\.


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tom
--

SELECT pg_catalog.setval('knex_migrations_id_seq', 3, true);


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: tom
--

COPY knex_migrations_lock (is_locked) FROM stdin;
0
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: tom
--

COPY locations (id, city, created_at, updated_at) FROM stdin;
1	Austin	\N	\N
2	Boulder	\N	\N
3	Denver	\N	\N
4	New York	\N	\N
5	Phoenix	\N	\N
6	San Francisco	\N	\N
7	Seattle	\N	\N
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tom
--

SELECT pg_catalog.setval('locations_id_seq', 7, true);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: tom
--

COPY projects (id, business_name, proj_name, contact_name, contact_phone_num, contact_email, proj_type, tech_stack, short_desc, long_desc, is_capstone_worthy, user_id, location_id, is_paid, business_problem, url, wish_ct, created_at, updated_at) FROM stdin;
1	Hyver	Hyver	Kirk Morales		kirk@hyverlabs.com	WDI	Javascript / HTML / CSS	Port of Chrome extension to Firefox and Safari	Hyver currently offers a Chrome plugin for managing CSS selectors and previewing websites. We need this code ported over to FireFox and Safari with the same functionality that's offered in Chrome currently: https://chrome.google.com/webstore/detail/hyver/ojmjgmmmbepnmkfohhglpjcfnkdbibkb?hl=en-US\n\nThis project will require knowledge of Javascript, HTML, and CSS as well as some research into browser specificities to make each plugin function properly in its intended browser.	t	\N	\N	f		hyverlabs.com	0	\N	\N
2	ProvideHER	ProvideHER	Caitlin Derr	314-541-0112	caitlin@provideher.com	WDI	No Preference	Wallstreet style tracker for various stats	ProvideHER is a fintech web app we are developing that will be developed as a digital savings app and peer to peer lending marketplace. As our MVP, we want to build out a website that would provide a Wallstreet style ticker-- where women could sign up and choose a symbol and it would show how many months they had been part of the community, amount saved, amount lended, # of financial goals met, etc. Ex: KRIS001AZ 01 $1000.35 $532.00 4 We are looking for someone to develop the landing page for ProvideHER and the ProvideHERStreet.com wall street ticker page. Our plan is to use this as our MVP to gain commitments from women within the next 3-6 months to lend $1 million dollars once our P2P marketplace app has been built and to gain 10K users to the movement for the purposes of gaining investors for the full build and launch.	t	\N	\N	f		www.provideher.com	0	\N	\N
3	Social Media Club Phoenix	Social Media Club Phoenix	Vincent Orleck	4802352203	vincentorleck@gmail.com	WDI	not sure!	TV Guide for streaming content	I have an idea that I've fielded some interest and ideas about for the building of a live video streaming directory or calendar. Basically a TV Guide for viewers to find live streaming content that's platform-agnostic., and the second part is it would also serve as a place for content creators to schedule into in order to be found. Really looking for an MVP initially, with some potential for it to be developed further through funding, and the developer would be first considered to continue working on it if they so chose. I am a newbie to this sort of thing also, so while I have a very good idea and plan on how this should look and operate, I have no real idea how to build it outside of using a Google calendar. Looking forward to your response :)	f	\N	\N	f		socialmediaclubphx.com	0	\N	\N
4	SONORA Data LLC	SONORA Data LLC	Zak DeBrine	(303) 884-0838	zak@sonoradata.com	WDI	MEAN Stack / Ruby on Rails	BLE Beacon Management System	We are looking to build a management system to work with our citywide deployment of BLE beacons. This will allow developers to purchase and manage a pre-deployed beacon in the city of Tempe and create location based applications.	f	\N	\N	f		www.sonoradata.com	0	\N	\N
6	eTrack Technologies	eTrack Technologies	Crystal Taggart	602-350-8495	crystal@buildmyapp.today	DS	Prefer Tensorflow/Python but am open to other options	Forklift sensor	eTrack Technologies is a startup that is currently raising funding which provides an IOT sensor technology mixed with with machine learning to detect issues with corporate assets and automatically create work orders and diagnostic tools for technicians. We are focusing now on Forklift sensors and have a working IOT solution currently being tested. We have 50k of records from a fortune 500 retailer regarding their current forklift repairs and are trying to create repair categories from work order comments (example - repairs to hydraulic system, engine repairs, electrical/lighting repairs). This is a great opportunity to use natural language processing with real data and see the differences between a manual categorization (which we've done) and what machine learning/data science algorithms can create. Additionally, as previously stated, we are in the process of getting funded and this can lead to a part-time or full-time consulting position.	f	\N	\N	f		http://etracktech.com	0	\N	\N
7	Concentric Corporation	Concentric Corporation	Andy Hawkins	480.868.2600 x105	Andy@concentriccorp.com	WDI	iOS/Android	Sales professionals activity tracker	To create an app that allows Sales professionals to track and compete for points based on specific activities. This app is based on the game of football to make it fun. (For instance, 'A' activity is worth 10 points = first down, etc.). Those competing would be able to track their opponents activity, much like a fantasy football app.	t	\N	\N	f		www.concentriccorp.com	0	\N	\N
8	Continuum Legal	Continuum Legal	Damon Mclean	6096138818	Dmclean@continuumlegal.com	WDI	n/a	Lawyer matching app	As a boutique legal recruiting firm, we are expected to reach out to candidates at law firms and match them to job description that we have. \n\nCurrently this is a manual process which involves spreadsheets of a list of lawyers, their names, email, year of graduation from school, location and details about areas that they practice in. \n\nThere is another spreadsheet where we try to aggregate and update all new and incoming jobs, and then manually try to search and find the best fit candidates for that position. \n\nA web portal where potential candidates have the ability to make a profile , or where a candidate's profile can be linked to their website with social logins, etc, and then they are automatically matched to the job description that they best fit, would make our processes more efficient and help our business to scale. \n\nOptions include building in RSS feeds of jobs from Job boards, as well as candidates public profile, to populate the database and web portal \n\nThis could potential revolutionize the legal recruiting industry, which is currently purely a manual process\n\nFurther insights would include reporting tools that could give insights into the legal job market in certain locations	t	\N	\N	f		http://continuumlegal.com/	0	\N	\N
9	mrktstreet	mrktstreet	Justin Lesko	585-313-4062	justin.lesko@mrktstreet.com	WDI	The developer will be using Javascript, JSON API, HTML, CSS and preferably React JS. Though, expertise in React is not required.	One stop shop for home buyers, home owners, and realtors.	mrktstreet is in need a developer to build a web UI derived from the mobile platform. \n\nThe mrktstreet platform acts as the "digital hub" for a homeowner -- where all home-related services are managed, procured and scheduled via mrktstreet. From property search and lending to maintenance and insurance claims -- mrktstreet users can control all of their home services from one platform.\n\nThe developer will be using client-ready designs (PSD) and connecting into a backend which utilizes Ruby and Postgres. A JSON backend API will be utilized for all real estate search, retrieval and saving. The developer will also need to build basic account management and user dashboarding. \n\nIn this phase of development -- you will help build the single access point a potential homeowner would need to not only search real estate listings, but also prepare and share their necessary mortgage lending documents. Your work will be promoted along with our mobile release within the next 8-12 weeks. Additionally, we are continually adding both contract and full-time positions should there be a fit. \n\nComplete designs (PSD) and other assets will be provided to interested students. We're looking forward to meeting you!	f	\N	\N	f		mrktstreet.com	0	\N	\N
10	MobileLogix	MobileLogix	Cory Berg	480-457-0376	cory@mobilelogix.com	DS	Java		This is a project that has both real-world applicability and a bounded end point as a research project. If things work out, we would want to identify an integration strategy with the MobileLogix flagship application.\n\nProject details: \n1) Using the Java library OptaPlanner (https://www.optaplanner.org/), and real-world data that we provide, figure out how to inject the data and constraints into OptaPlanner to produce an optimized crew schedule. \n2) Together with MobileLogix, compare the produced schedule with what MobileLogix's current autoschedule produces.\n3) Help MobileLogix decide on next steps depending on outcomes above.	f	\N	\N	f		MobileLogix.com	0	\N	\N
11	Invenire.org LLC dba Adovation.org	Invenire.org LLC dba Adovation.org	John Oelze	602-689-7977	JOelze@Adovation.org	DS	Not entirely sure, PHP, Apache		We have built and designed a Beta version of our ROI (Return On Investment) Estimator for our Members to compare results from our direct competitors platforms and performance versus ours to learn how to improve the product offering and give a much better detailed explanation for their marketing spend. Our's is currently behind a paywall but here's another version to get better idea of what we'd like to build. \n\nhttp://www.emailmarketingroi.com/\n\nWhile we have a good idea of what we need we are not opposed to new ideas and better ways of doing things so we would encourage anyone that finds this project interesting to add to the project and design as much as they like.	f	\N	\N	f		www.Adovation.org	0	\N	\N
12	Myndshft	Myndshft	Ron Wince	480-223-2291	ron@myndshft.com	WDI	React or Angular	Prevent injuries before they happen	Our project is to develop 1 of 4 web apps that will be used by athletes, parents, coaches and trainers to monitor the individual risk of a youth athlete to get a concussion while participating in a contact sport. This is part of a research project we are working on with the Mayo Clinic to leverage healthcare big data, real time monitoring through sensors and environmental data and machine learning to create personalized risk profiles. Our ultimate goal is to provide athletes, parents, coaches and trainers with the tools and insights to prevent injury before it happens. We would welcome teams who want to develop all 4 apps.	f	\N	\N	f	Where is the complexity in this project?	www.myndshft.com	0	\N	\N
13	Myndshft	Myndshft	Ron Wince	480-223-229	ron@myndshft.com	WDI	.net & VB6	Aerospace manufacturing dashboards	We would like a student or team of students to work with us to develop an operational dashboard or set of dashboards for an aerospace manufacturing company. The work will be a part of our SGNL shopfloor intelligence platform.	f	\N	\N	f	Need more info in terms of scope and functionality.	www.myndshft.com	0	\N	\N
15	Lash Affair	Lash Affair	Jenelle Paris	9789855423	jenelle@lashaffair.com	WDI	HTML , Liquid	Shopify coding help	I need help with coding my dropdown menu on Shopify	f	\N	\N	t		www.lashaffair.com	0	\N	\N
16	EzJobPool / STARA Technologies Corp	EzJobPool / STARA Technologies Corp	Mark Rome	6023589586	mark_rome@hotmail.com	DS	Student's choice	Candidate Data Profile	1. PROJECT SUMMARY\nThis project will provide the minimally viable product (MVP) required to capture data to populate a Candidate Data Profile. The data will be incorporated into a data analytics project to measure culture fit through an Arizona State University (ASU) Corporate Applied Project. This project will expose Galvanize students to multiple employers that will be evaluating large volumes of data.\n\n1.1. Form Design - Candidate Data Profile\nDesign a form to capture data in the Candidate Data Profile (Attachment 1)\n\n• Unlimited number of Employers\n• Unlimited number of Skills (hard & soft), competency level, years of experience\n• Unlimited number of Roles & Responsibilities, competency level, years of experience\n• Unlimited number of Tools & Technologies, competency level, years of experience\n• Unlimited number of Projects\n• Awards & achievements\n• Unlimited number of References (minimum of six)\n\n1.2. Build the Backend Database\nBuild the back-end database (Student’s choice of technology; i.e., SQL or NoSQL) to capture and organize all data elements. The database will be a feature rich application that will provide for capturing, managing and analyzing data for 100 million individuals, including job applicants and employees.\n\n1.3. Form Design - Reference Verification Form\nDesign a form to capture data in the Reference Verification Form (Attachment 2)\n\nPopulate the Reference Verification Form with the information provided by the Candidate to allow each reference to complete the competency level and years of experience for each of the following:\n• Skills (hard & soft), \n• Roles & Responsibilities\n• Tools & Technologies\n\n1.4. Send e-mail to Each Reference\n• Re-populate the Reference Verification Form with the Skills, Roles & Responsibilities, and Tools & Technologies provided by the Candidate. \n• Send an e-mail to each of the candidate references requesting them to complete a Reference Verification form for the Candidate.\n• Allow each reference to complete the competency level and years of experience for each of the following:\no Skills (hard & soft), \no Roles & Responsibilities\no Tools & Technologies\n\n1.5. Talent Hacking – Create a Double Viral Loop\nCreate a double viral loop by sending an e-mail to each of the Candidate’s references requesting them to complete their own Candidate Data Profile.\n\nThe scope of this project is an application prototype, or MVP. The scope of this project can be completed by a junior engineer/DS within 2 weeks (14 days). This project is not time-bound (meaning it can be completed at any time). The project is not mission critical to our company, business or organization. Code for the project can be displayed publicly in sites like Github. For this data science project, data sets can be securely shared and evaluated for their usability.\n\nPrior to starting this project, Galvanize students will be asked to complete the Non-Disclosure Agreement.\n\nStudents can contact Mark Rome to obtain a copy of the Candidate Data Profile and Reference Verification Form.	f	\N	\N	f	Disrupt recruiting with a talent hacking service that takes the guesswork out of selecting the right candidates for open positions and building talent pipelines utilizing a data-driven strategy rather than sifting through resumes or LinkedIn profiles. \n\nWe are rapidly moving away from a world where candidates seek a job to one where the job finds the candidate. This MVP is the starting point. It will replace the resume and LinkedIn profile, and will disrupt the $400 billion recruiting industry. \n\nOnly 20 percent of 520 recruiting professionals said they were fully confident in their employers' overall ability to effectively assess the skills of applicants using time-honored selection methods like interviews, applications, resume, and LinkedIn profiles according to a survey conducted by global consultancy Mercer and the Society for Human Resource Management (SHRM).\n\nMost talent acquisition strategies aren’t meeting expectations. There's too much\nguesswork in selecting the right candidates.\n- 79% of candidates best suited for open positions never see job postings\n- About half of all resumes and LinkedIn profiles are poorly written, highly subjective, inaccurate or provide misleading information, and are labor intensive to review\n- The average job posting receives more than 150 resumes\n- There are hundreds of job titles for similar positions\n- The Applicant Tracking System (ATS) cam inadvertently weed out independent thinkers\n- 20 to 25% of candidates hired don’t turn out to be a good fit\n- More than 60% of voluntary terms have a tenure of less than 2 years	n/a	0	\N	\N
17	SMART Brain Aging, Inc.	SMART Brain Aging, Inc.	Dr. John DenBoer	480-993-3879	drjohn@smartbrainaging.com	DS	Ruby on Rails		We are looking to expand on our current code, building out our socialized framework and making the product more gamified.	f	\N	\N	f	Acquire more customers on our Saas product: www.brainuonline.com	www.smartbrainaging.com	0	\N	\N
18	Workglue Inc.	Workglue Inc.	Robert Stoeber	707-786-3237	Robert@Workglue.com	WDI	PHP, MySQL, Wordpress		This project is ideal for someone looking for Wordpress plugin experience. (Wordpress powers over 25% of the entire internet, and it's the most popular content management system, by far.) For some time now we have been interested in the technology needs of smaller companies. For many, a Wordpress site and QuickBooks are the only real technology they use (besides email and mobile phones). Our idea is that if someone can figure out Wordpress enough to create and update their own content, we could give them a bridge to interacting with mobile devices. In other words, we want to create a Wordpress plugin that would let people create a new kind of "page" that wouldn't be displayed in Wordpress at all. These new "pages" would contain text and images, plus form input fields. A mobile device (we already have an iPad app that works for this) would fetch these pages/forms from the Wordpress site and display them in the app. Data is collected on the mobile device (our app works online as well as offline) and returned to the Wordpress site. We currently create "pages" for the iPad app by hand in XML. However, a Wordpress plugin would open this capability to average Wordpress users. The Wordpress plugin to be developed , requires a graphical user interface for simple drag-and-drop layout/page design. I'm happy to meet any time to discuss a project and demonstrate the work already completed on this project.	f	\N	\N	f	Make it easier for small companies with only a Wordpress site (and related Wordpress skill level) to use mobile devices in various ways.	https://Workglue.com	0	\N	\N
19	KryptoPal	KryptoPal	jaycen horton	2088208595	jaycenh@kryptopal.io	Blockchain/cryptocurrency based (three sided stack)	Solidity, Javascript, Truffle, Web3, Ethereum, Raiden	Offchain payment channels	We are looking for implementations of uRaiden and Raiden network payment channels that leverage the Ethereum and raiden networks. We are looking for unique incentive mechanisms for creating off-chain payment channels, and secondary market mechanisms for those off-chain credits.	f	\N	\N	f	Real time, zero fee cryptocurrency transactions, and secondary markets	pending legal review (not public)	0	\N	\N
20	Insurmi	Insurmi	Sonny Patel	3148081298	sonny@patelglobal.com	WDI	Up to the developer!		Please review our Capstone Project Proposal PDF here: https://drive.google.com/open?id=199KH0QZWHgg8L7i-k2iBfmbBmnMYg87i	f	\N	\N	f	Make the process of buying life insurance easier and more transparent for consumers around the U.S., through a B2C web platform.	insurmi.com	0	\N	\N
14	Testing	Zumot Sooq LLC - Tappetite	Kay Diggs	623-455-1819	kdiggs@tappetiteapp.com	WDI	E-Commerce Website that is mobile capable -	E-Commerce website	Looking for a web development of an E-Commerce website that is mobile capable as well. \n\nTappetite is a virtual bakery where home bakers and independent bakers can post pictures of their baked goods for consumers to buy. The project would need an E-Commerce platform where bakers can build their virtual shops by entering pictures of their products, prices, etc. \n\nThere would be search engine within the website, where buyers can search by various categories. \n\nThere would be a "follow baker" platform, rating system, and promotion option.	f	\N	\N	f		www.tappetiteapp.com	0	\N	\N
5	TESTING UPDATEs	Catalytic Health Partners	Susan Cordts	602-332-3363	scordts@catalytichealthpartners.com	WDI	No idea as this is not my expertise	Disease management game	We provide disease management as part of the enhanced services we provide to sick individuals in their home environment. The mantra of our company is to disrupt the way things are being done today in healthcare. I came up with this idea to develop a game in which one has a body that is healthy and as they do things to it, it becomes sicker and healthier over time. Much as Farmville and other similar games, when one wins the game there are option to buy additional things to make impact the body further, hopefully for the better. How can we make learning how to manage through issues fun and interesting? We could not find any disease management games on the market today.	t	\N	\N	f		www.catalytichealthpartners.com	0	\N	\N
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tom
--

SELECT pg_catalog.setval('projects_id_seq', 20, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tom
--

COPY users (id, first_name, last_name, email, phone_number, created_at, updated_at) FROM stdin;
1	Tom	Martin	tom.martinaz@gmail.com	480-200-4074	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tom
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: projects projects_location_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_location_id_foreign FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: projects projects_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: tom
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

