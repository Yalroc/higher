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
  name: "L'Oréal",
  size: 74000,
  industry: "Cosmetics",
  })

re_jd = Recruiter.create!({
  email: "tde@gmail.com",
  password: "123456",
  title: "Louise Turgot @ Talent Acquisition Specialist",
  organization: Organization.first,
  })

re_jd = Recruiter.create!({
  email: "kate@gmail.com",
  password: "123456",
  title: "Thierry Delas @ Head of Category and Insights",
  organization: Organization.first,
  })

jo_jd = JobOffer.create!({
  recruiter: Recruiter.first,
  title: "Senior Category Manager",
  description: "You will be interfacing and developing relationships across various levels of management and key decision makers within both L’Oreal and our retail partners across multiple channels. Your role will bring significant opportunities to influence and shape our plans based on future growth potential and category direction. You will be working in conjunction with marketing, commercial, merchandising and the finance teams and you will have the ability to gain cross-functional knowledge and capabilities. The purpose is to build strong professional relationships and be considered the expert across your categories, and influential in your point of view. You will be measured on your ability to drive category growth and increase ranges within accounts. You will be responsible for developing retailer category strategies including creative solutions for optimising the use of space in store. This position will be an integral role within the Category & Insights Team. You will report into the Head of Category & Insights and the role will involve people management responsibilities."
  })

fdfdfd = JobOffer.create!({
  recruiter: Recruiter.first,
  title: "Purchasing Manager",
  description: "You will be in charged of purchasing packagings for our products.",
  })

fdfdfd = JobOffer.create!({
  recruiter: Recruiter.first,
  title: "Product Manager",
  description: "You will be in charged of several products.",
  })

ja_jd = JobApplication.create!({
  candidate: Candidate.first,
  job_offer: JobOffer.first,
  motivation_letter: "Dear Sir or Madam, I am writing in response to your advertisement for a Sales Director for your Consulting Services Line of Business in France. I have done many roles in the same field of skills required by your proposition."
  })

lae_jd = Language.create!({
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
  title: "Category Manager Assistant",
  start_date: "1-6-1996",
  end_date: "1-6-2015",
  description: "I worked mainly on Lipton products.",
  company_size: 100000,
  industry: "Consumer Goods"
  })

ed_qsdqjd_1 = Education.create!({
  organization: "Audencia Business School",
  job_application: JobApplication.first,
  start_date: "1-6-1992",
  degree_type: "Master",
  degree_field: "Grande Ecole",
  end_date: "1-6-1995",
  description: "I did a specialization in Marketing.",
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
  title: "Product Manager",
  start_date: "1-6-2002",
  end_date: "1-6-2016",
  description: "It was a challenging experience.",
  company_size: 100000,
  industry: "Computer Software"
  })

ed_jsd_1 = Education.create!({
  organization: "Université Paris Dauphine",
  job_application: JobApplication.second,
  start_date: "1-6-1996",
  degree_type: "Master",
  degree_field: "Finance",
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
  organization: "PepsiCo",
  job_application: JobApplication.fourth,
  title: "Account Manager",
  start_date: "1-6-2002",
  end_date: "1-6-2016",
  description: "I managed a team of 15 collaborators.",
  company_size: 100000,
  industry: "Food & Beverages"
  })

ed_jsd_1 = Education.create!({
  organization: "SKEMA Business School",
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
  motivation_letter: "I have always been interested by your company since my childhood. I love L'Oréal."
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
  organization: "Lactalis",
  job_application: JobApplication.fifth,
  title: "Key Account Manager",
  start_date: "1-6-2002",
  end_date: "1-6-2016",
  description: "Exciting experience in a dynamic comapny.",
  company_size: 100000,
  industry: "Dairy"
  })

ed_jsd_1 = Education.create!({
  organization: "Trinity College",
  job_application: JobApplication.fifth,
  start_date: "1-6-1996",
  end_date: "1-6-2001",
  description: "My specialization is about key account management.",
  degree_type: "Master",
  degree_field: "Marketing",
  })

###############

Candidate.create!({
  first_name: "Laura",
  last_name: "Bidaud",
  email: "laura@gmail.com",
  password: "123456",
  phone_number: "+33 9 31 94 88 66",
  })

ja_jdddd = JobApplication.create!({
  candidate: Candidate.last,
  job_offer: JobOffer.first,
  motivation_letter: "I have always been interested by your company since my childhood. I love L'Oréal."
  })

la_jdddd = Language.create!({
  job_application: JobApplication.last,
  name: "French",
  proficiency: "Native"
  })

Experience.create!({
  organization: "P&G",
  job_application: JobApplication.last,
  title: "Junior Category Manager",
  start_date: "1-6-2002",
  end_date: "1-6-2016",
  description: "Exciting experience in a challenging company. I worked on Gillette brand.",
  company_size: 100000,
  industry: "Marketing"
  })

ed_jsd_1 = Education.create!({
  organization: "NEOMA Business School",
  job_application: JobApplication.last,
  start_date: "1-6-1996",
  end_date: "1-6-2001",
  description: "My specialization is about luxury marketing",
  degree_type: "Master",
  degree_field: "Marketing",
  })



