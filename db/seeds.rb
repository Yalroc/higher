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
  photo_url: "http://fullhdpictures.com/wp-content/uploads/2016/02/Oracle-Logos.png",
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
  title: "Senior Financial Analyst - EMEA",
  description: "We are currently looking to hire 1 experienced (Senior) Sales Director for our Consulting Services Line of Business in France.  In this role you will have responsibility for all consulting bookings in France, either through managing the group of French Consulting Sales Representatives (Field & Inside) or by performing sales directly with specific focus on SaaS, IaaS and PaaS solutions.",
  location: "Luxembourg",
  min_xp: 3,
  max_xp: 5,
  salary: 60,
  })

JobOffer.create!({
  recruiter: Recruiter.where(email: "t.delas@loreal.com").first,
  title: "Business Analyst - The Body Shop",
  description: "We are currently looking to hire 1 experienced (Senior) Sales Director for our Consulting Services Line of Business in France.  In this role you will have responsibility for all consulting bookings in France, either through managing the group of French Consulting Sales Representatives (Field & Inside) or by performing sales directly with specific focus on SaaS, IaaS and PaaS solutions.",
  location: "Paris",
  min_xp: 1,
  max_xp: 3,
  salary: 50,
  })

JobOffer.create!({
  recruiter: Recruiter.where(email: "t.delas@loreal.com").first,
  title: "M&A Associate",
  description: "We are currently looking to hire 1 experienced (Senior) Sales Director for our Consulting Services Line of Business in France.  In this role you will have responsibility for all consulting bookings in France, either through managing the group of French Consulting Sales Representatives (Field & Inside) or by performing sales directly with specific focus on SaaS, IaaS and PaaS solutions.",
  location: "Paris",
  min_xp: 3,
  max_xp: 5,
  salary: 70,
  })

JobOffer.create!({
  recruiter: Recruiter.where(email: "k.smith@oracle.com").first,
  title: "Internal Auditor",
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
  min_xp: 2,
  max_xp: 3,
  salary: 45,
  })

JobApplication.create!({
  candidate: Candidate.first,
  job_offer: JobOffer.first,
  motivation_letter: "Dear Sir or Madam, I am writing in response to your advertisement for a Sales Director for your Consulting Services Line of Business in France. I have done many roles in the same field of skills required by your proposition.",
  submit: true,
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
  organization: "Microsoft",
  job_application: JobApplication.first,
  title: "Account director",
  start_date: "1-6-1994",
  end_date: "1-8-2015",
  description: "I managed a team of 10 account managers.",
  company_size: 100000,
  industry: "Computer Software"
  })

Experience.create!({
  organization: "Microsoft",
  job_application: JobApplication.first,
  title: "Account director",
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
  job_offer: JobOffer.first,
  submit: true,
  motivation_letter: "Dear Sir or Madam, I am very interested by your proposition. I have worked for more than ten years in the IT field, so I think I have enough experience to get this position."
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
  organization: "SAP",
  job_application: JobApplication.second,
  title: "Account director",
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
  job_offer: JobOffer.first,
  submit: true,
  motivation_letter: "Hi, I had an experience at Amazon in Marketing, but now I want to be more focused on tech products."
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
  organization: "Amazon",
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


##########



Candidate.create!({
  first_name: "Jeanne",
  last_name: "Pré",
  email: "jeanne@gmail.com",
  password: "123456",
  phone_number: "+33 9 71 94 35 66",
  })

ja_jdddd = JobApplication.create!({
  candidate: Candidate.fourth,
  job_offer: JobOffer.first,
  submit: true,
  motivation_letter: "I need a more challenging position."
  })

la_jdddd = Language.create!({
  job_application: JobApplication.fourth,
  name: "French",
  proficiency: "Native"
  })

la_ssjd = Language.create!({
  job_application: JobApplication.fourth,
  name: "English",
  proficiency: "Fluent"
  })

la_sssjd = Language.create!({
  job_application: JobApplication.fourth,
  name: "German",
  proficiency: "Fluent"
  })

Experience.create!({
  organization: "EY",
  job_application: JobApplication.fourth,
  title: "Senior Auditor",
  start_date: "1-6-2002",
  end_date: "1-6-2016",
  description: "I managed a team of 15 collaborators.",
  company_size: 100000,
  industry: "Accounting"
  })

ed_jsd_1 = Education.create!({
  organization: "Trinity College",
  job_application: JobApplication.fourth,
  start_date: "1-6-1996",
  end_date: "1-6-2001",
  description: "My specialization is about finance.",
  degree_type: "Master",
  degree_field: "Finance",
  })

##########

Candidate.create!({
  first_name: "Mohammed",
  last_name: "Essaïd",
  email: "moha@gmail.com",
  password: "123456",
  phone_number: "+33 9 31 94 88 66",
  })

ja_jdddd = JobApplication.create!({
  candidate: Candidate.fifth,
  job_offer: JobOffer.first,
  submit: true,
  motivation_letter: "I have always been interested by your company since my childhood. I love Oracle."
  })

la_jdddd = Language.create!({
  job_application: JobApplication.fifth,
  name: "French",
  proficiency: "Native"
  })

la_ssjd = Language.create!({
  job_application: JobApplication.fifth,
  name: "English",
  proficiency: "Fluent"
  })

la_sssjd = Language.create!({
  job_application: JobApplication.fifth,
  name: "Arabic",
  proficiency: "Fluent"
  })

Experience.create!({
  organization: "Capgemini",
  job_application: JobApplication.fifth,
  title: "Developer",
  start_date: "1-6-2002",
  end_date: "1-6-2016",
  description: "Exciting experience in a dynamic SSII.",
  company_size: 100000,
  industry: "Accounting"
  })

ed_jsd_1 = Education.create!({
  organization: "TELECOM Paris Tech",
  job_application: JobApplication.fifth,
  start_date: "1-6-1996",
  end_date: "1-6-2001",
  description: "My specialization is about computer science.",
  degree_type: "Master",
  degree_field: "Computer Science",
  })







