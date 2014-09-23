<?php
namespace wcf\system\menu\page; 

use wcf\system\event\EventHandler; 
use wcf\system\menu\page\DefaultPageMenuItemProvider; 
use wcf\system\request\LinkHandler; 
use wcf\system\WCF; 

/**
 * PageMenuItemProvider for Pillory-Page.
 * 
 * @author 	Joshua Rüsweg
 * @copyright	2014 Joshua Rüsweg
 * @license	Creative Commons Attribution-ShareAlike 4.0 <https://creativecommons.org/licenses/by-sa/4.0/legalcode>
 * @package	be.bastelstu.josh.pillory
 * @subpackage	system.menu.page
 */
class PilloryPageMenuItemProvider extends DefaultPageMenuItemProvider {
	
	/**
	 * all aviable pages for the pillory
	 * 
	 * @var array<String> 
	 */
	public $aviablePages = null; 
	
	public function getAviablePages() {
		if ($this->aviablePages === null) {
			if (WCF::getSession()->getPermission('user.pillory.canSeeBans')) $this->aviablePages[] = 'PilloryBans';
			if (WCF::getSession()->getPermission('user.pillory.canSeeUserDeletions')) $this->aviablePages[] = 'PilloryUserDeletions';

			EventHandler::getInstance()->fireAction($this, 'getAviablePages');
		}
	}
	
	/**
	 * Hides the button when there are no active items
	 * 
	 * @see	\wcf\system\menu\page\PageMenuItemProvider::isVisible()
	 */
	public function isVisible() {
		$this->getAviablePages(); 
		
		if (!count($this->aviablePages)) {
			return false; 
		}
		
		return true;
	}
	
	/**
	 * Modifies the link to show the Link we would be redirect to.
	 * 
	 * @see	\wcf\system\menu\page\PageMenuItemProvider::getLink()
	 */
	public function getLink() {
		$this->getAviablePages();
		
		if (count($this->aviablePages)) {
			reset($this->aviablePages);
			return LinkHandler::getInstance()->getLink(current($this->aviablePages));
		}
		
		return ''; // Pillory is invisible
	}
}