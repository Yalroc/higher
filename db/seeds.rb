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

re_jd = Recruiter.create!({
  email: "tde@gmail.com",
  password: "123456",
  title: "Thierry Delas @ Senior Recruiter - EMEA",
  organization: Organization.first,
  })

re_jd = Recruiter.create!({
  email: "kate@gmail.com",
  password: "123456",
  title: "Kate Smith @ Junior Recruiter - IT department",
  organization: Organization.first,
  })

jo_jd = JobOffer.create!({
  recruiter: Recruiter.first,
  description: "We are currently looking to hire 1 experienced (Senior) Sales Director for our Consulting Services Line of Business in France.  In this role you will have responsibility for all consulting bookings in France, either through managing the group of French Consulting Sales Representatives (Field & Inside) or by performing sales directly with specific focus on SaaS, IaaS and PaaS solutions."
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
  organization: "Microsoft",
  job_application: JobApplication.first,
  title: "Account director",
  start_date: "1-6-1994",
  end_date: "1-6-2015",
  description: "I managed a team of 10 account managers.",
  company_size: 100000,
  industry: "Computer Software"
  })

ed_qsdqjd_1 = Education.create!({
  organization: "ESSEC Business School",
  job_application: JobApplication.first,
  start_date: "1-6-1992",
  title: "Master Grande Ecole",
  end_date: "1-6-1995",
  description: "I graduated from this business school which belongs to the top 10 in Europe.",
  degree_type: "Master",
  degree_field: "Business Administration",
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
  title: "Master",
  end_date: "1-6-2001",
  description: "I have a specialization in IT services.",
  degree_type: "Master",
  degree_field: "Marketing",
  })





