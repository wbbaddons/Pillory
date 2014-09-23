<?php
namespace wcf\page;

use wcf\page\AbstractPilloryPage;

/**
 * list all active shop items
 * 
 * @author	Joshua Rüsweg
 * @copyright	2014 Joshua Rüsweg
 * @license	Creative Commons Attribution-ShareAlike 4.0 <https://creativecommons.org/licenses/by-sa/4.0/legalcode>
 * @package	be.bastelstu.josh.pillory
 * @subpackage	wcf.page
 */
class PilloryUserDeletionsPage extends AbstractPilloryPage {

	/**
	 * @see \wcf\page\SortablePage::$defaultSortField
	 */
	public $defaultSortField = 'lastActivityTime';
	
	/**
	 * @see \wcf\page\SortablePage::$validSortFields
	 */
	public $validSortFields = array('lastActivityTime', 'username', 'quitStarted');

	/**
	 * @see	\wcf\page\AbstractPage::$neededPermissions
	 */
	public $neededPermissions = array('user.pillory.canSeeUserDeletions');
	
	/**
	 * @see	\wcf\page\MultipleLinkPage::$objectListClassName
	 */
	public $objectListClassName = 'wcf\data\user\UserProfileList';
	
	/**
	 * @see \wcf\page\AbstractPilloryPage::$type
	 */
	public $type = 'userdeletions'; 
	
	/**
	 * @see	\wcf\page\MultipleLinkPage::initObjectList()
	 */
	protected function initObjectList() {
		parent::initObjectList();
		
		$this->objectList->getConditionBuilder()->add("user_table.quitStarted <> 0");
	}
}