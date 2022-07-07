class MutationQuery {


  String addUser = """
  mutation createUser(\$input : CreateUserInput!){
    createUser(input: \$input){
      name
      username
      email
      phone
    }
  }
  """;

  String registeredUser = """
  mutation signupUser(\$fullName : String, \$email : String!,
    \$mobile : String, \$password : String) {
      signupUser (fullName : \$fullName, email : \$email,
  		 mobile : \$mobile, password : \$password) {
        userId,
        role,
        token
      }
  }
  """;

  String loginUser = """
  mutation login(\$email: String!, \$password: String!
  ) {
  login(
    email: \$email
    password: \$password
  ) {
    userId,
    role,
    token
  }
}
  """;

  String registeredGoogleUser = """
  mutation googleSignup (\$accessToken: String!
  ) {
  googleSignup (
  accessToken : \$accessToken
  ) {
    userId,
    role,
    token
  }
}
  """;

  String registeredFacebookUser = """
  mutation facebookSignup (\$accessToken: String!
   ) {
  facebookSignup (
  accessToken : \$accessToken
  ) {
    userId,
    role,
    token
  }
}
  """;

  String registerAsInstructor = """ 
  mutation signupInstructor(   
    \$fullName: String!
    \$mobile: String!
    \$email: String!
    \$password: String!
    \$address: String!
    \$socialProfile: String!
    \$companyOrInstructor: String!
    \$registerNumber: String!
    \$companyWebsite: String!
    \$introduction: String!
    \$experience: String!
    \$teachingArea: [String]!
    \$certification: String!
  ){
    signupInstructor(signupInstructorInput:{
      fullName: \$fullName
      mobile: \$mobile
      email: \$email
      password: \$password
      address: \$address
      socialProfile: \$socialProfile
      companyOrInstructor: \$companyOrInstructor
      registerNumber: \$registerNumber
      companyWebsite: \$companyWebsite
      introduction: \$introduction
      experience: \$experience
      teachingArea : \$teachingArea
      certification: \$certification
  }){
      role
      token
      userId
    }
  }
  """;

  String uploadCertificate = """
  mutation(\$files: Upload!){
    uploadFile(files: \$files){
      uri
    }
  }
  """;

  String getQuizOneSkillList = """
  {
    getAllCoreSkill{
      allCoreSkillRes{
        code
        _id
        type
        skillName
      }
    }
  }
  """;

  String getQuizSecondSkillList = """
  query (\$coreSkillId: ID)  {
     getAllChildSkill(coreSkillId:\$coreSkillId){
        allChildSkillRes{
          code
          _id
          type
          childSkillName
        }
    }
  }
  """;

  String getInstructorSkillList = """
{
  teachingAreaSkills{
    allChildSkillRes{
    _id
    childSkillName
    }
  }
}
  """;



}
