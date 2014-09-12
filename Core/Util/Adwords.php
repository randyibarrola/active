<?php
/**
 *
 * @author listico
 */

$path = dirname(__FILE__) . '/../../Lib/adwords/';

set_include_path(get_include_path() . PATH_SEPARATOR . $path);
require_once 'Google/Api/Ads/AdWords/Lib/AdWordsUser.php';

class Core_Util_Adwords{
    const ADWORDS_VERSION = "v201309";
    const STRATEGY_DEFAULT_TYPE = "BUDGET_OPTIMIZER";
    public static $STATEGY_TYPES = array(
        'BUDGET_OPTIMIZER',
        'CONVERSION_OPTIMIZER',
        'MANUAL_CPC',
        'MANUAL_CPM',
        'PAGE_ONE_PROMOTED',
        'PERCENT_CPA',
        'TARGET_SPEND',
        'ENHANCED_CPC',
        'TARGET_CPA',
        'TARGET_ROAS',
        'NONE',
        'UNKNOWN');
    
    public function addCampaign($name = 'Campaign #', $stategy_type = Core_Util_Adwords::STRATEGY_DEFAULT_TYPE){
        $user = new AdWordsUser();

        // Optionally, enable logging to capture the content of SOAP requests and
        // responses.
        $user->LogDefaults();

        // Instantiate the desired service class by calling the get***Service method on
        // the AdWordsUser instance.
        $campaignService = $user->GetService('CampaignService', Core_Util_Adwords::ADWORDS_VERSION);

        // Create data objects and invoke methods on the service class instance. The
        // data objects and methods map directly to the data objects and requests for
        // the corresponding web service.

        // Create new campaign structure.
        $campaign = new Campaign();
        $campaign->name = $name;
        $campaign->status = 'ACTIVE';
        $campaign->biddingStrategyConfiguration = new BiddingStrategyConfiguration();
        $campaign->biddingStrategyConfiguration->biddingStrategyType = $stategy_type;
        
        $budget_id = uniqid();
        $budget = new Budget($budget_id);
        $budget->name = 'Budget #' . $budget_id;
        $budget->period = 'DAILY';
        $budget->amount = new Money(1000);
        $budget->deliveryMethod = 'STANDARD';
        
        $campaign->budget = $budget;

        //$campaign->budget = new Budget('123', 'default budget', 'DAILY', new Money(10000), 'STANDARD');

        $operation = new CampaignOperation();
        $operation->operand = $campaign;
        $operation->operator = 'ADD';
        $operations[] = $operation;

        // Add campaign.
        $campaignReturnValue = $campaignService->mutate($operations);
        return $campaignReturnValue;

        /*  foreach ($result->value as $campaign) {
            printf("Campaign with name '%s' and ID '%s' was added.\n", $campaign->name,
                $campaign->id);
          }
        */

    }

    /**
     * Borrar una campaña
     * @param AdWordsUser $user the user to run the example with
     * @param string $campaignId the id of the campaign to delete
     */
    function deleteCampaign($campaignId) {
        $user = new AdWordsUser();
        // Get the service, which loads the required classes.
        $campaignService = $user->GetService('CampaignService', Core_Util_Adwords::ADWORDS_VERSION);

        // Create campaign with DELETED status.
        $campaign = new Campaign();
        $campaign->id = $campaignId;
        $campaign->status = 'DELETED';
        
        // Rename the campaign as you delete it, to avoid future name conflicts.
        $campaign->name = 'Deleted ' . date('Ymd his');

        // Create operations.
        $operation = new CampaignOperation();
        $operation->operand = $campaign;
        $operation->operator = 'SET';

        $operations = array($operation);

        // Make the mutate request.
        $result = $campaignService->mutate($operations);
        
        return $result;
        /*
        $campaign = $result->value[0];
        printf("Campaign with ID '%s' was deleted.\n", $campaign->id);
        */
    }

    function getCampaigns() {
        $user = new AdWordsUser();
        // Get the service, which loads the required classes.
         $campaignService = $user->GetService('CampaignService', Core_Util_Adwords::ADWORDS_VERSION);

          // Create selector.
          $selector = new Selector();
          $selector->fields = array('Id', 'Name');
          $selector->ordering[] = new OrderBy('Name', 'ASCENDING');

          // Create paging controls.
          $selector->paging = new Paging(0, AdWordsConstants::RECOMMENDED_PAGE_SIZE);

          do {
            // Make the get request.
            $page = $campaignService->get($selector);

            // Display results.
            if (isset($page->entries)) {
              foreach ($page->entries as $campaign) {
                printf("Campaign with name '%s' and ID '%s' was found.\n",
                    $campaign->name, $campaign->id);
              }
            } else {
              print "No campaigns were found.\n";
            }

            // Advance the paging index.
            $selector->paging->startIndex += AdWordsConstants::RECOMMENDED_PAGE_SIZE;
          } while ($page->totalNumEntries > $selector->paging->startIndex);
    }


    /**
     * addAdGroups Agrega un grupo de anuncios 
     * @param string $name Nombre del Hotel
     * @param string $campaignId el ID de la campaña
     * @param integer $bid Ejemplo 1000000 Amount in micros. One million is equivalent to one unit.
     * @param integer $contentBid Ejemplo 750000 Amount in micros. One million is equivalent to one unit.
     */

    function addAdGroup($campaignId, $name, $bid, $contentBid){
        $user = new AdWordsUser();
        // Get the service, which loads the required classes.
        $adGroupService = $user->GetService('AdGroupService', Core_Util_Adwords::ADWORDS_VERSION);

        $operations = array();
        // Create ad group.
        $adGroup = new AdGroup();
        $adGroup->campaignId = $campaignId;
        $adGroup->name = $name;

        // Set bids (required).
        $bid = new CpcBid();
        $bid->bid =  new Money($bid);
        $bid->contentBid = new Money($contentBid);
        $biddingStrategyConfiguration = new BiddingStrategyConfiguration();
        $biddingStrategyConfiguration->bids[] = $bid;
        $adGroup->biddingStrategyConfiguration = $biddingStrategyConfiguration;

        // Set additional settings (optional).
        $adGroup->status = 'ENABLED';

        // Targetting restriction settings - these setting only affect serving
        // for the Display Network.
        $targetingSetting = new TargetingSetting();
        // Restricting to serve ads that match your ad group placements.
        $targetingSetting->details[] =
            new TargetingSettingDetail('PLACEMENT', TRUE);
        // Using your ad group verticals only for bidding.
        $targetingSetting->details[] =
            new TargetingSettingDetail('VERTICAL', FALSE);

        $adGroup->settings[] = $targetingSetting;

        // Create operation.
        $operation = new AdGroupOperation();
        $operation->operand = $adGroup;
        $operation->operator = 'ADD';
        $operations[] = $operation;

        // Make the mutate request.
        $result = $adGroupService->mutate($operations);

        return $result;
        // Display result.
        /*$adGroups = $result->value;
        foreach ($adGroups as $adGroup) {
            printf("Ad group with name '%s' and ID '%s' was added.\n", $adGroup->name,
                $adGroup->id);
        }*/
    }

    /**
     * Agregar palabras clave a un grupo de anuncios
     * @param string $adGroupId the ID of the ad group to add the keywords to
     * @param array $keywords Las palabras clave que se van a usar para el grupo de anuncios
     */
    function addKeywords($adGroupId, $keywords) {
        $user = new AdWordsUser();
        $adGroupCriterionService = $user->GetService('AdGroupCriterionService', Core_Util_Adwords::ADWORDS_VERSION);
        $operations = array();

        foreach ($keywords as $word) {
            // Create keyword criterion.
            $keyword = new Keyword();
            $keyword->text = $word;
            $keyword->matchType = 'BROAD';

            // Create biddable ad group criterion.
            $adGroupCriterion = new BiddableAdGroupCriterion();
            $adGroupCriterion->adGroupId = $adGroupId;
            $adGroupCriterion->criterion = $keyword;

            /*// Set additional settings (optional).
            $adGroupCriterion->userStatus = 'PAUSED';
            $adGroupCriterion->destinationUrl = 'http://www.example.com/mars';

            // Set bids (optional).
            $bid = new CpcBid();
            $bid->bid =  new Money(500000);
            $biddingStrategyConfiguration = new BiddingStrategyConfiguration();
            $biddingStrategyConfiguration->bids[] = $bid;
            $adGroupCriterion->biddingStrategyConfiguration = $biddingStrategyConfiguration;
            */

            $adGroupCriteria[] = $adGroupCriterion;   

            // Create operation.
            $operation = new AdGroupCriterionOperation();
            $operation->operand = $adGroupCriterion;
            $operation->operator = 'ADD';
            $operations[] = $operation;
        }

        // Make the mutate request.
        $result = $adGroupCriterionService->mutate($operations);

        return $result;
/*
      // Display results.
      foreach ($result->value as $adGroupCriterion) {
        printf("Keyword with text '%s', match type '%s', and ID '%s' was added.\n",
            $adGroupCriterion->criterion->text,
            $adGroupCriterion->criterion->matchType,
            $adGroupCriterion->criterion->id);
      }*/
    }

    /**
     * Retorna todas las keywords de un grupo de anuncios, esto nos sirve para borrar las keywords
     * @param string $adGroupId the id of the parent ad group
     */
    function getKeywords($adGroupId) {
        $user = new AdWordsUser();
      // Get the service, which loads the required classes.
      $adGroupCriterionService =
          $user->GetService('AdGroupCriterionService', Core_Util_Adwords::ADWORDS_VERSION);

      // Create selector.
      $selector = new Selector();
      $selector->fields = array('KeywordText', 'KeywordMatchType', 'Id');
      $selector->ordering[] = new OrderBy('KeywordText', 'ASCENDING');

      // Create predicates.
      $selector->predicates[] = new Predicate('AdGroupId', 'IN', array($adGroupId));
      $selector->predicates[] =
          new Predicate('CriteriaType', 'IN', array('KEYWORD'));

      // Create paging controls.
      $selector->paging = new Paging(0, AdWordsConstants::RECOMMENDED_PAGE_SIZE);

      $criterions = array();

      do {
        // Make the get request.
        $page = $adGroupCriterionService->get($selector);

        // Display results.
        if (isset($page->entries)) {
          foreach ($page->entries as $adGroupCriterion) {
            $criterions[] = $adGroupCriterion;

          /*printf("Keyword with text '%s', match type '%s', and ID '%s' was "
              . "found.\n", $adGroupCriterion->criterion->text,
              $adGroupCriterion->criterion->matchType,
              $adGroupCriterion->criterion->id);*/
          }
        } else {
          //print "No keywords were found.\n";
        }

        // Advance the paging index.
        $selector->paging->startIndex += AdWordsConstants::RECOMMENDED_PAGE_SIZE;
      } while ($page->totalNumEntries > $selector->paging->startIndex);

      return $criterions;

    }


    /**
     * Borrar una palabra clave
     * @param AdWordsUser $user the user to run the example with
     * @param string $adGroupId the id of the ad group that the keyword is in
     * @param string $criterionId the id of the keyword to delete
     */
    function deleteKeyword($adGroupId, $criterionId) {
        $user = new AdWordsUser();
      // Get the service, which loads the required classes.
      $adGroupCriterionService =
          $user->GetService('AdGroupCriterionService', Core_Util_Adwords::ADWORDS_VERSION);

      // Create criterion using an existing ID. Use the base class Criterion
      // instead of Keyword to avoid having to set keyword-specific fields.
      $criterion = new Criterion();
      $criterion->id = $criterionId;

      // Create ad group criterion.
      $adGroupCriterion = new AdGroupCriterion();
      $adGroupCriterion->adGroupId = $adGroupId;
      $adGroupCriterion->criterion = new Criterion($criterionId);

      // Create operation.
      $operation = new AdGroupCriterionOperation();
      $operation->operand = $adGroupCriterion;
      $operation->operator = 'REMOVE';

      $operations = array($operation);

      // Make the mutate request.
      $result = $adGroupCriterionService->mutate($operations);

      return $result;
      /*
      // Display result.
      $adGroupCriterion = $result->value[0];
      printf("Keyword with ID '%s' was deleted.\n",
          $adGroupCriterion->criterion->id);
          */
    }




    /**
     * deleteAdGroup Borrar un grupo de anuncios
     * @param string $adGroupId the id of the ad group to delete
     */
    function deleteAdGroup($adGroupId) {
        $user = new AdWordsUser();
      // Get the service, which loads the required classes.
      $adGroupService = $user->GetService('AdGroupService', Core_Util_Adwords::ADWORDS_VERSION);

      // Create ad group with DELETED status.
      $adGroup = new AdGroup();
      $adGroup->id = $adGroupId;
      $adGroup->status = 'DELETED';
      // Rename the ad group as you delete it, to avoid future name conflicts.
      $adGroup->name = 'Deleted ' . date('Ymd his');

      // Create operations.
      $operation = new AdGroupOperation();
      $operation->operand = $adGroup;
      $operation->operator = 'SET';

      $operations = array($operation);

      // Make the mutate request.
      $result = $adGroupService->mutate($operations);
      
      return $result;
      /*
      $adGroup = $result->value[0];
      printf("Ad group with ID '%s' was deleted.\n", $adGroup->id);
      */
    }

    /**
    * addTextAds Agrega un anuncio a una campaña
    * @param headline : Hotel name, destino
    * @param description1 : Precios Especiales Hoy.
    * @param description2 : Haga Su Reserva Online !
    * @param displayUrl: www.hoteloasisduna.com
    * @param url: http://www.hoteloasisduna.com
    */

    function addTextAd($adGroupId, $headline, $description1, $description2, $displayUrl, $url, $status = 'ACTIVE'){
      $user = new AdWordsUser();
      // Get the service, which loads the required classes.
      $adGroupAdService = $user->GetService('AdGroupAdService', Core_Util_Adwords::ADWORDS_VERSION);

      $operations = array();
        // Create text ad.
        $textAd = new TextAd();
        $textAd->headline = $headline;
        $textAd->description1 = $description1;
        $textAd->description2 = $description2;
        $textAd->displayUrl = $displayUrl;
        $textAd->url = $url;

        // Create ad group ad.
        $adGroupAd = new AdGroupAd();
        $adGroupAd->adGroupId = $adGroupId;
        $adGroupAd->ad = $textAd;

        // Set additional settings (optional).
        $adGroupAd->status = $status;

        // Create operation.
        $operation = new AdGroupAdOperation();
        $operation->operand = $adGroupAd;
        $operation->operator = 'ADD';
        $operations[] = $operation;

      // Make the mutate request.
      $result = $adGroupAdService->mutate($operations);

      return $result;
      
      /*
        Example of results
          foreach ($result->value as $adGroupAd) {
            printf("Text ad with headline '%s' and ID '%s' was added.\n",
                $adGroupAd->ad->headline, $adGroupAd->ad->id);
          }
        */
    }
    
    /**
    * deleteAd Borrar un anuncio
    * @param headline : Hotel name, destino
    */

    function deleteAd($adGroupId, $adId) {
        $user = new AdWordsUser();
      // Get the service, which loads the required classes.
      $adGroupAdService = $user->GetService('AdGroupAdService', Core_Util_Adwords::ADWORDS_VERSION);

      // Create base class ad to avoid setting type specific fields.
      $ad = new Ad();
      $ad->id = $adId;

      // Create ad group ad.
      $adGroupAd = new AdGroupAd();
      $adGroupAd->adGroupId = $adGroupId;
      $adGroupAd->ad = $ad;

      // Create operation.
      $operation = new AdGroupAdOperation();
      $operation->operand = $adGroupAd;
      $operation->operator = 'REMOVE';

      $operations = array($operation);

      // Make the mutate request.
      $result = $adGroupAdService->mutate($operations);
      return $result;
      
      /*
      $adGroupAd = $result->value[0];
      printf("Ad with ID '%s' was deleted.\n", $adGroupAd->ad->id);
      */
    }

}

?>