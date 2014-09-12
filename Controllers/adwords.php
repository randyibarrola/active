<?php 
$adwords = new Core_Util_Adwords();
$adwords->addCampaign();
/*
try {
  // Get the client ID and secret from the auth.ini file. If you do not have a
  // client ID or secret, please create one of type "installed application" in
  // the Google API console: https://code.google.com/apis/console#access
  // and set it in the auth.ini file.
  $user = new AdWordsUser();
  $user->LogAll();

  // Get the OAuth2 credential.
  $oauth2Info = $adwords->GetOAuth2Credential($user);

  // Enter the refresh token into your auth.ini file.
  printf("Your refresh token is: %s\n\n", $oauth2Info['refresh_token']);
  printf("In your auth.ini file, edit the refresh_token line to be:\n"
      . "refresh_token = \"%s\"\n", $oauth2Info['refresh_token']);
} catch (OAuth2Exception $e) {
  //var_dump($e);
	printf("An error has occurred: %s\n", $e->getMessage());
} catch (ValidationException $e) {
  //var_dump($e);
	printf("An error has occurred: %s\n", $e->getMessage());
} catch (Exception $e) {
  printf("An error has occurred: %s\n", $e->getMessage());
}

*/
?>