Candidate.destroy_all
Recruiter.destroy_all
Organization.destroy_all
JobOffer.destroy_all
JobApplication.destroy_all
Language.destroy_all
Experience.destroy_all
Education.destroy_all

Candidate.create!({
  first_name: "Thibault",
  last_name: "Dupont",
  email: "thd@gmail.com",
  password: "123456",
  phone_number: "+33 6 78 94 35 66",
  })

Organization.create!({
  name: "Oracle",
  size: 74000,
  industry: "Information Technology and Services",
  })

Organization.create!({
  name: "Amazon",
  size: 74000,
  industry: "Internet",
  })

Organization.create!({
  name: "L'Oréal",
  size: 74000,
  industry: "Cosmetics",
  })

Recruiter.create!({
  email: "t.delas@loreal.com",
  password: "123456",
  title: "Thierry Delas Senior Recruiter",
  organization: Organization.where(name: "L'Oréal").first,
  })

Recruiter.create!({
  email: "k.smith@oracle.com",
  password: "123456",
  title: "Kate Smith @ Junior Recruiter - IT department",
  organization: Organization.where(name: "Oracle").first,
  })


Recruiter.create!({
  email: "j.nash@amazon.com",
  password: "123456",
  title: "John Nash @ Junior Recruiter",
  organization: Organization.where(name: "Amazon").first,
  })

JobOffer.create!({
  recruiter: Recruiter.where(email: "j.nash@amazon.com").first,
  title: "Full Stack Marketing Ruby On Rails Backflip 360°",
  description: "Amazon seeks a Senior Financial Analyst to be a key member of its wholesale finance team. Amazon wholesale business serves as the procurement solution provider for businesses of all size and types by offering wide selection, consistently low prices and convenient shopping experience to businesses. This position will be a critical business partner and will own the P&L for one of our product categories. This includes, among other things, responsibility for financial metrics, reporting, forecasting and analysis.

BASIC QUALIFICATIONS
· Bachelor's degree in finance, accounting, business or related field
· 3+ years post CA/ MBA from a reputed B-school with relevant finance experience
· Advanced knowledge of Excel, and familiarity with databases.
· Advanced analytical skills and an ability to work independently in a fast-paced, ambiguous and rapidly changing environment

PREFERRED QUALIFICATIONS
· A work ethic based on a strong desire to exceed expectations
· Strong interpersonal skills emphasizing written and oral communication
· Demonstrated ability to build and manage financial models for business forecasting, variance analysis, and problem solving
· Advanced Excel and analysis skills
· Experience with SQL is a strong plus",
  location: "Luxembourg",
  min_xp: 3,
  max_xp: 5,
  salary: 60,
  })

JobOffer.create!({
  recruiter: Recruiter.where(email: "t.delas@loreal.com").first,
  title: "Community Manager",
  description: "We are currently looking to hire 1 experienced (Senior) Sales Director for our Consulting Services Line of Business in France.  In this role you will have responsibility for all consulting bookings in France, either through managing the group of French Consulting Sales Representatives (Field & Inside) or by performing sales directly with specific focus on SaaS, IaaS and PaaS solutions.",
  location: "Paris",
  min_xp: 1,
  max_xp: 3,
  salary: 35,
  })

JobOffer.create!({
  recruiter: Recruiter.where(email: "t.delas@loreal.com").first,
  title: "Digital Marketing Manager",
  description: "
    Description

    As a leading worldwide provider of navigation devices and wearable technology, our focus is on developing, designing and supporting superior products. Our advanced technology promotes performance, safety and ease of use in every market we serve. That makes us an engineering and technology company with a keen focus on recruiting talent in those fields. But the same vertical integration business model that keeps all design and manufacturing processes in-house also gives us the incentive to hire top performers from different backgrounds, including operations, finance and accounting, information technology, sales, marketing and communications.


    We're looking for a Digital Marketing Manager at our world headquarters in Olathe, KS to manage the execution of the strategic vision, coordination, and implementation of digital marketing efforts for retail partners.


    In this role, your key essential functions will be:
    - Develop and execute the strategic vision for digital marketing for retail partners including advertisements, promotions, banners, homepage takeovers, brand landing pages, emails, social posts, and search words
    - Work directly with retail partners to improve the end customer shopping experience
    - Assess effectiveness of campaigns through calculating ROI, and change/optimize accordingly to maximize sales and brand exposure
    - Work closely with sales leaders to ensure an aligned digital strategy
    - Manage 3rd party digital content agreements to maximize contract allowances
    - Maintain strong product knowledge across all products in consumer segments

    You will also be responsible for the following:
    Some travel required, as necessary, to attend dealer marketing conferences, vendor meetings and industry shows.",
  location: "Paris",
  min_xp: 5,
  max_xp: 10,
  salary: 52,
  })

JobOffer.create!({
  recruiter: Recruiter.where(email: "k.smith@oracle.com").first,
  title: "SEO expert",
  description: "This is not your typical Internal Audit position. As an Internal Auditor for the country's leading nuclear organisation, you will have the opportunity to take part in incredibly varied and highly complex audits, within an extremely visible role in the business.


Details about the Client

Sellafield is the company responsible for safely delivering decommissioning of the UK's nuclear legacy as well as fuel recycling and the management of low, high and intermediate level nuclear waste activities. With a number of significant developments taking place across the business you will gain rare insight into an organisation going through substantial change. The projects they're involved with are globally significant and they take pride of the high standards they keep to, encouraging responsible actions and ensuring a positive reflection on the nuclear industry as a whole.


Detailed Job Description

A recent change in ownership means an increased focus on the importance of Internal Audit's role in helping to shape and guide Sellafield's future direction. These changes have encouraged more emphasis on strategy and transformation within the Audit Plan. Engaging with senior stakeholders across the business requires a talented auditor who is not afraid to be proactive and challenge influential individuals on a regular basis. Identifying individuals who are autonomous as well as innovative is vital.

Sellafield's Internal Audit function has a remit to provide assurance and advice across all areas of the business from corporate governance to project management and human resources to shared services. The calibre of the team has seen Internal Audit become well respected across the organisation ensuring that all levels are receptive to their input.

From day one you will take full responsibility for a varied portfolio of risk based audit reviews; using your ability to think strategically and outside of the box, you will be challenged to identify commercial and practical solutions to control issues and then present back to the business. You will also be tasked with proactively identifying potential areas for further review within the business, and then feed this into the planning process. You will have exposure to individuals at all levels but particularly at Executive and Board level, with all reviews having an Executive sponsor with whom you would be partnering.

The interaction you will have across disciplines allows you the opportunity to use the experience gained in this role as a springboard to a variety of internal opportunities. Exceptional performers have moved to senior roles in finance, commercial and operations across the Sellafield business and have also had the opportunity to gain international experience.


Candidate's Profile

Our client is looking for talented auditors who are proactive, innovative and autonomous.

The successful candidate should meet the following criteria:

Qualified Chartered Accountant or Auditor (ACA or CMIIA) with 3 years post qualification experience (PQE)
Ideally your PQE will be in Internal Audit, or External Audit dealing with large, complex clients
A demonstrable, strong academic track record
Self-motivated and keen to use their initiative to problem-solve
Excellent interpersonal and communication skills with an ability to build strong relationships and influence senior stakeholders across all levels
Your success in the role will be determined by your ability to:

Think strategically
Work proactively
Build effective relationships at all levels",

  location: "Paris",
  min_xp: 8,
  max_xp: 12,
  salary: 70,
  })

JobApplication.create!({
  candidate: Candidate.first,
  job_offer: JobOffer.third,
  motivation_letter: "Dear Sir or Madam, I am writing in response to your advertisement for a Sales Director for your Consulting Services Line of Business in France. I have done many roles in the same field of skills required by your proposition.",
  submit: true,
  created_at: "30-8-2016"
  })

Language.create!({
  job_application: JobApplication.first,
  name: "French",
  proficiency: "Native"
  })

lasqf_jd = Language.create!({
  job_application: JobApplication.first,
  name: "English",
  proficiency: "Fluent"
  })

Experience.create!({
  organization: "Unilever",
  job_application: JobApplication.first,
  title: "Category Manager",
  start_date: "1-6-1994",
  end_date: "1-8-2015",
  description: "I managed a team of 10 account managers.",
  company_size: 100000,
  industry: "Computer Software"
  })

Experience.create!({
  organization: "Carrefour",
  job_application: JobApplication.first,
  title: "Product Manager",
  start_date: "1-2-1980",
  end_date: "1-11-1990",
  description: "I managed a team of 10 account managers.",
  company_size: 100000,
  industry: "Computer Software"
  })

ed_qsdqjd_1 = Education.create!({
  organization: "ESSEC Business School",
  job_application: JobApplication.first,
  start_date: "1-6-1992",
  degree_type: "Master",
  degree_field: "Grande Ecole",
  end_date: "1-8-1995",
  description: "I graduated from this business school which belongs to the top 10 in Europe.",
  })

####################################################

Candidate.create!({
  first_name: "Isabelle",
  last_name: "Cheminet",
  email: "isa@gmail.com",
  password: "123456",
  phone_number: "+33 6 78 94 35 66",
  })

ja_jdddd = JobApplication.create!({
  candidate: Candidate.second,
  job_offer: JobOffer.third,
  submit: true,
  motivation_letter: "Dear Sir or Madam, I am very interested by your proposition. I have worked for more than ten years in the IT field, so I think I have enough experience to get this position.",
  created_at: "31-8-2016"
  })

la_jdddd = Language.create!({
  job_application: JobApplication.second,
  name: "French",
  proficiency: "Native"
  })

la_ssjd = Language.create!({
  job_application: JobApplication.second,
  name: "English",
  proficiency: "TOEIC 950"
  })

la_sssjd = Language.create!({
  job_application: JobApplication.second,
  name: "Chinese",
  proficiency: "Intermediate"
  })

Experience.create!({
  organization: "Publicis",
  job_application: JobApplication.second,
  title: "Communication Assistant",
  start_date: "1-6-2002",
  end_date: "1-6-2016",
  description: "I was charged of the middle market clients.",
  company_size: 100000,
  industry: "Computer Software"
  })

ed_jsd_1 = Education.create!({
  organization: "Université Paris Dauphine",
  job_application: JobApplication.second,
  start_date: "1-6-1996",
  degree_type: "Master",
  degree_field: "in Finance",
  end_date: "1-6-2001",
  description: "I have a specialization in IT services.",
  })

#######
########

Candidate.create!({
  first_name: "Benjamin",
  last_name: "Rihouet",
  email: "ben@gmail.com",
  password: "123456",
  phone_number: "+33 4 78 24 35 96",
  })

ja_jdddd = JobApplication.create!({
  candidate: Candidate.third,
  job_offer: JobOffer.third,
  submit: true,
  motivation_letter: "Hi, I had an experience at Amazon in Marketing, but now I want to be more focused on tech products.",
  created_at: "31-8-2016"
  })

la_jdddd = Language.create!({
  job_application: JobApplication.third,
  name: "French",
  proficiency: "Native"
  })

la_ssjd = Language.create!({
  job_application: JobApplication.third,
  name: "English",
  proficiency: "TOEFL 930"
  })

Experience.create!({
  organization: "Cdiscount",
  job_application: JobApplication.third,
  title: "Digital Marketing Analyst",
  start_date: "1-6-2010",
  end_date: "1-6-2016",
  description: "I worked on several projects about SEO and growth hacking.",
  company_size: 100000,
  industry: "E-commerce"
  })

ed_jsd_1 = Education.create!({
  organization: "HEC Paris",
  job_application: JobApplication.third,
  start_date: "1-6-2005",
  end_date: "1-6-2009",
  description: "I did a specialization in Consumer Goods Marketing",
  degree_type: "Master",
  degree_field: "Marketing",
  })


#########

####################

Candidate.create!({
  first_name: "Clémence",
  last_name: "Eljira",
  email: "clemm@gmail.com",
  password: "123456",
  phone_number: "+33 9 31 94 88 66",
  })

ja_jdddd = JobApplication.create!({
  candidate: Candidate.find_by(last_name: "Eljira"),
  job_offer: JobOffer.third,
  submit: true,
  motivation_letter: "Ok",
  created_at: "1-9-2016",
  })

la_jdddd = Language.create!({
  job_application: JobApplication.find_by(motivation_letter: "Ok"),
  name: "English",
  proficiency: "Native"
  })

la_ssjd = Language.create!({
  job_application: JobApplication.find_by(motivation_letter: "Ok"),
  name: "French",
  proficiency: "Fluent"
  })

Experience.create!({
  organization: "Fleury Michon",
  job_application: JobApplication.find_by(motivation_letter: "Ok"),
  title: "Marketing Assistant",
  start_date: "1-6-2002",
  end_date: "1-6-2010",
  description: "Exciting experience in a dynamic SSII.",
  company_size: 100000,
  industry: "Accounting"
  })

ed_jsd_1 = Education.create!({
  organization: "EM Strasbourg",
  job_application: JobApplication.find_by(motivation_letter: "Ok"),
  start_date: "1-6-1996",
  end_date: "1-6-2001",
  description: "My specialization is about computer science.",
  degree_type: "Master",
  degree_field: "Computer Science",
  })

#########################

Candidate.create!({
  first_name: "Sandra",
  last_name: "Potier",
  email: "clemdddsm@gmail.com",
  password: "123456",
  phone_number: "+33 9 31 94 88 66",
  })

ja_jdddd = JobApplication.create!({
  candidate: Candidate.find_by(last_name: "Potier"),
  job_offer: JobOffer.third,
  submit: true,
  motivation_letter: "I",
  created_at: "1-9-2016"
  })

la_jdddd = Language.create!({
  job_application: JobApplication.find_by(motivation_letter: "I"),
  name: "English",
  proficiency: "Native"
  })

la_ssjd = Language.create!({
  job_application: JobApplication.find_by(motivation_letter: "I"),
  name: "French",
  proficiency: "Fluent"
  })

Experience.create!({
  organization: "Akerman LLP",
  job_application: JobApplication.find_by(motivation_letter: "I"),
  title: "Legal Analyst M&A",
  start_date: "1-6-1999",
  end_date: "1-6-2010",
  description: "Exciting experience in a dynamic SSII.",
  company_size: 100000,
  industry: "Corporate Law"
  })

ed_jsd_1 = Education.create!({
  organization: "Chicago Law School",
  job_application: JobApplication.find_by(motivation_letter: "I"),
  start_date: "1-6-1996",
  end_date: "1-6-2001",
  description: "My specialization is about computer science.",
  degree_type: "Master",
  degree_field: "Computer Science",
  })

###################

Candidate.create!({
  first_name: "Paul",
  last_name: "Doumergue",
  email: "paul.dou@gmail.com",
  password: "123456",
  phone_number: "+33 8 31 94 88 66",
  })

ja_jdddd = JobApplication.create!({
  candidate: Candidate.find_by(last_name: "Doumergue"),
  job_offer: JobOffer.third,
  submit: true,
  motivation_letter: "Hello world",
  created_at: "1-9-2016"
  })

la_jdddd = Language.create!({
  job_application: JobApplication.find_by(motivation_letter: "Hello world"),
  name: "English",
  proficiency: "Native"
  })

la_ssjd = Language.create!({
  job_application: JobApplication.find_by(motivation_letter: "Hello world"),
  name: "French",
  proficiency: "Fluent"
  })

Experience.create!({
  organization: "Airbus",
  job_application: JobApplication.find_by(motivation_letter: "Hello world"),
  title: "Aerospace Engineer",
  start_date: "1-6-1999",
  end_date: "1-6-2010",
  description: "Exciting experience in a dynamic SSII.",
  company_size: 100000,
  industry: "Corporate Law"
  })

ed_jsd_1 = Education.create!({
  organization: "INSA Lyon",
  job_application: JobApplication.find_by(motivation_letter: "Hello world"),
  start_date: "1-6-1996",
  end_date: "1-6-2001",
  description: "My specialization is about computer science.",
  degree_type: "Master",
  degree_field: "Computer Science",
  })

##############

Candidate.create!({
  first_name: "Edouard",
  last_name: "Foussier",
  email: "edf@gmail.com",
  password: "123456",
  phone_number: "+33 9 31 94 88 66",
  })

ja_jdddd = JobApplication.create!({
  candidate: Candidate.find_by(last_name: "Foussier"),
  job_offer: JobOffer.third,
  submit: true,
  motivation_letter: "Yolo",
  })

la_jdddd = Language.create!({
  job_application: JobApplication.find_by(motivation_letter: "Yolo"),
  name: "English",
  proficiency: "Native"
  })

la_ssjd = Language.create!({
  job_application: JobApplication.find_by(motivation_letter: "Yolo"),
  name: "French",
  proficiency: "Fluent"
  })

Experience.create!({
  organization: "Le Wagon",
  job_application: JobApplication.find_by(motivation_letter: "Yolo"),
  title: "All things community",
  start_date: "1-6-2012",
  end_date: "1-8-2016",
  description: "Le Wagon Lover",
  company_size: 100000,
  industry: "Corporate Law"
  })

ed_jsd_1 = Education.create!({
  organization: "ESCP Europe",
  job_application: JobApplication.find_by(motivation_letter: "Yolo"),
  start_date: "1-6-1996",
  end_date: "1-6-2001",
  description: "My specialization is about computer science.",
  degree_type: "Master",
  degree_field: "Computer Science",
  })


##################

Candidate.create!({
  first_name: "Bernard",
  last_name: "Madoff",
  email: "bernard@gmail.com",
  password: "123456",
  phone_number: "+33 7 31 94 88 66",
  })

ja_jdddd = JobApplication.create!({
  candidate: Candidate.find_by(last_name: "Madoff"),
  job_offer: JobOffer.third,
  motivation_letter: "Dear Sir,
  I really want to work with you because i am the bezst fit for you, trust me !",
  created_at: "1-9-2016"
  })

Education.create!({
  organization: "Ninja School",
  job_application: JobApplication.find_by(motivation_letter: "Dear Sir,
  I really want to work with you because i am the bezst fit for you, trust me !"),
  title: "Martial Arts Training",
  start_date: "1-6-2007",
  end_date: "1-8-2010",
  description: "Martial Arts Training",
  degree_type: "Kun-fu",
  degree_field: "Master",
  })

Education.create!({
  organization: "Le Wagon",
  job_application: JobApplication.find_by(motivation_letter: "Dear Sir,
  I really want to work with you because i am the bezst fit for you, trust me !"),
  title: "Programming",
  start_date: "1-9-2010",
  end_date: "1-11-2010",
  description: "Full stack coding bootcamp",
  degree_type: "RoR",
  degree_field: "",
  })


Experience.create!({
  organization: "P&G",
  job_application: JobApplication.find_by(motivation_letter: "Dear Sir,
  I really want to work with you because i am the bezst fit for you, trust me !"),
  title: "Category Manager",
  start_date: "1-6-1999",
  end_date: "1-6-2010",
  description: "I worked within a team of 12 collaborators. I was personally in charge of analyzing KPIs of several categories of products and writing reports and recommandations about it.",
  company_size: 100000,
  industry: "Marketing"
  })






















