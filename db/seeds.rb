Candidate.destroy_all
Recruiter.destroy_all
Organization.destroy_all
JobOffer.destroy_all
JobApplication.destroy_all
Language.destroy_all
Experience.destroy_all
Education.destroy_all

jd = Candidate.create!({
  first_name: "Thibault",
  last_name: "Dupont",
  email: "thd@gmail.com",
  password: "123456",
  phone_number: "+33 6 78 94 35 66",
  })

orga_villeneuve = Organization.create!({
  name: "Oracle",
  size: 74000,
  industry: "Information Technology and Services",
  })

orga_microsoft = Organization.create!({
  name: "Microsoft",
  size: 76000,
  industry: "Computer Software",
  })

orga_essec = Organization.create!({
  name: "ESSEC Business School",
  size: 56,
  industry: "University",
  })

orga_dell = Organization.create!({
  name: "Dell",
  size: 4500,
  industry: "University",
  })

re_jd = Recruiter.create!({
  email: "tde@gmail.com",
  password: "123456",
  title: "Thierry Delas @ Senior Recruiter - EMEA",
  organization: Organization.where(size: 74000).first,
  })

jo_jd = JobOffer.create!({
  recruiter: Recruiter.where(email: "tde@gmail.com").first,
  description: "We are currently looking to hire 1 experienced (Senior) Sales Director for our Consulting Services Line of Business in France.  In this role you will have responsibility for all consulting bookings in France, either through managing the group of French Consulting Sales Representatives (Field & Inside) or by performing sales directly with specific focus on SaaS, IaaS and PaaS solutions."
  })

ja_jd = JobApplication.create!({
  candidate: Candidate.where(first_name: "Thibault").first,
  job_offer: JobOffer.where(description: "We are currently looking to hire 1 experienced (Senior) Sales Director for our Consulting Services Line of Business in France.  In this role you will have responsibility for all consulting bookings in France, either through managing the group of French Consulting Sales Representatives (Field & Inside) or by performing sales directly with specific focus on SaaS, IaaS and PaaS solutions.").first,
  motivation_letter: "Dear Sir or Madam, I am writing in response to your advertisement for a Sales Director for your Consulting Services Line of Business in France. I have done many roles in the same field of skills required by your proposition."
  })

la_jd = Language.create!({
  job_application: JobApplication.where(motivation_letter: "Dear Sir or Madam, I am writing in response to your advertisement for a Sales Director for your Consulting Services Line of Business in France. I have done many roles in the same field of skills required by your proposition.").first,
  name: "French",
  proficiency: "Native"
  })

la_jd = Language.create!({
  job_application: JobApplication.where(motivation_letter: "Dear Sir or Madam, I am writing in response to your advertisement for a Sales Director for your Consulting Services Line of Business in France. I have done many roles in the same field of skills required by your proposition.").first,
  name: "English",
  proficiency: "Fluent"
  })

xp_jd_1 = Experience.create!({
  organization: Organization.where(size: 76000).first,
  job_application: JobApplication.where(motivation_letter: "Dear Sir or Madam, I am writing in response to your advertisement for a Sales Director for your Consulting Services Line of Business in France. I have done many roles in the same field of skills required by your proposition.").first,
  title: "Account director",
  start_date: "1996",
  end_date: "2015",
  description: "I managed a team of 10 account managers.",
  company_size: 100000,
  industry: "Computer Software"
  })

xp_jd_1 = Experience.create!({
  organization: Organization.where(size: 4500).first,
  job_application: JobApplication.where(motivation_letter: "Dear Sir or Madam, I am writing in response to your advertisement for a Sales Director for your Consulting Services Line of Business in France. I have done many roles in the same field of skills required by your proposition.").first,
  title: "Assitant Sales",
  start_date: "1994",
  end_date: "1996",
  description: "I was assistant sales on the servers.",
  company_size: 4500,
  industry: "Information Technology and Services"
  })

ed_jd_1 = Education.create!({
  organization: Organization.where(size: 56).first,
  job_application: JobApplication.where(motivation_letter: "Dear Sir or Madam, I am writing in response to your advertisement for a Sales Director for your Consulting Services Line of Business in France. I have done many roles in the same field of skills required by your proposition.").first,
  start_date: "01-09-1989",
  title: "ESSEC Busiéness School",
  end_date: "5-6-199",
  description: "I graduated from this business school which belongs to the top 10 in Europe.",
  degree_type: "Master",
  degree_field: "Business Administration",
  })

####################################################
