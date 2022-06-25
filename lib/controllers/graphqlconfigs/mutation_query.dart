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
  
  """;

}
