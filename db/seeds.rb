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
  name: "Microsoft",
  size: 76000,
  industry: "Computer Software",
  })

Organization.create!({
  name: "ESSEC Business School",
  size: 56,
  industry: "University",
  })

re_jd = Recruiter.create!({
  email: "tde@gmail.com",
  password: "123456",
  title: "Thierry Delas @ Senior Recruiter - EMEA",
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

la_jd = Language.create!({
  job_application: JobApplication.first,
  name: "French",
  proficiency: "Native"
  })

la_jd = Language.create!({
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

ed_jd_1 = Education.create!({
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
