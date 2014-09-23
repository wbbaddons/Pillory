<?php
namespace wcf\page;

use wcf\page\SortablePage;
use wcf\system\WCF; 

/**
 * Represents a Pillory-Page.
 * 
 * @author	Joshua Rüsweg
 * @copyright	2014 Joshua Rüsweg
 * @license	Creative Commons Attribution-ShareAlike 4.0 <https://creativecommons.org/licenses/by-sa/4.0/legalcode>
 * @package	be.bastelstu.josh.pillory
 * @subpackage	wcf.page
 */
abstract class AbstractPilloryPage extends SortablePage {

	/**
	 * @see	\wcf\page\AbstractPage::$activeMenuItem
	 */
	public $activeMenuItem = 'wcf.pillory.overview';
	
	/**
	 * @see	\wcf\page\AbstractPage::$neededModules
	 */
	public $neededModules = array('MODULE_PILLORY');
	
	/**
	 * Identifer of the current type. 
	 */
	public $type = ''; 
	
	/**
	 * @see	\wcf\page\IPage::assignVariables()
	 */
	public function assignVariables() {
		parent::assignVariables(); 
		
		WCF::getTPL()->assign(array(
		    'type' => $this->type
		));
	}
}