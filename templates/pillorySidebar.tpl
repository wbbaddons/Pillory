<fieldset>
	<legend>{lang}wcf.pillory.types{/lang}</legend>

	<nav>
		<ul>
			{if $__wcf->getSession()->getPermission('user.pillory.canSeeBans')}<li{if $type == 'bans'} class="active"{/if}><a href="{link controller='PilloryBans'}{/link}">{lang}wcf.pillory.bans{/lang}</a></li>{/if}
			{if $__wcf->getSession()->getPermission('user.pillory.canSeeUserDeletions')}<li{if $type == 'userdeletions'} class="active"{/if}><a href="{link controller='PilloryUserDeletions'}{/link}">{lang}wcf.pillory.userDeletions{/lang}</a></li>{/if}
			{event name='types'}
		</ul>
	</nav>
</fieldset>

{event name='boxes'}