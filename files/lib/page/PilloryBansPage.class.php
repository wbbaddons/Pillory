<?php
namespace wcf\page;

use wcf\page\AbstractPilloryPage;

/**
 * Represents a list of user profiles which are banned.
 * 
 * @author	Joshua Rüsweg
 * @copyright	2014 Joshua Rüsweg
 * @license	Creative Commons Attribution-ShareAlike 4.0 <https://creativecommons.org/licenses/by-sa/4.0/legalcode>
 * @package	be.bastelstu.josh.pillory
 * @subpackage	wcf.page
 */
class PilloryBansPage extends AbstractPilloryPage {

	/**
	 * @see \wcf\page\SortablePage::$defaultSortField
	 */
	public $defaultSortField = 'lastActivityTime';
	
	/**
	 * @see \wcf\page\SortablePage::$validSortFields
	 */
	public $validSortFields = array('lastActivity', 'username', 'banReason');

	/**
	 * @see	\wcf\page\AbstractPage::$neededPermissions
	 */
	public $neededPermissions = array('user.pillory.canSeeBans');
	
	/**
	 * @see	\wcf\page\MultipleLinkPage::$objectListClassName
	 */
	public $objectListClassName = 'wcf\data\user\UserProfileList';
	
	/**
	 * @see \wcf\page\AbstractPilloryPage::$type
	 */
	public $type = 'bans'; 
	
	/**
	 * @see	\wcf\page\MultipleLinkPage::initObjectList()
	 */
	protected function initObjectList() {
		parent::initObjectList();
		
		$this->objectList->getConditionBuilder()->add("user_table.banned = 1");
	}
}