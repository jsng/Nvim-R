###########################################################
#   This script builds both the Vimball and the deb       #
#   files of released versions of the plugin. The files   #
#   are created at the /tmp directory.                    #
###########################################################

PLUGINHOME=`pwd`
PLUGINVERSION=0.9.5
PLUGINRELEASEDATE=`date +"%Y-%m-%d"`

ifeq (, $(shell which nvim))
    VIMEXEC=vim
else
    VIMEXEC=nvim
endif

vimball:
	# Update the version date in doc/Nvim-R.txt header and in the news
	sed -i -e "s/^Version: [0-9].[0-9].[0-9] (development)/Version: $(PLUGINVERSION)/" doc/Nvim-R.txt
	sed -i -e "s/^$(PLUGINVERSION) (201[0-9]-[0-9][0-9]-[0-9][0-9])$$/$(PLUGINVERSION) ($(PLUGINRELEASEDATE))/" doc/Nvim-R.txt
	$(VIMEXEC) -c "%MkVimball Nvim-R ." -c "q" list_for_vimball
	mv Nvim-R.vmb /tmp

clean:
	rm -f R/nvimcom/src/nvimcom.o
	rm -f R/nvimcom/src/nvimcom.so
	rm -f R/nvimcom/src/nvimcom.dll
	rm -f R/nvimcom/src/apps/nclientserver
	rm -f R/nvimcom/src/apps/nclientserver.o
	rm -f R/nvimcom/src/apps/nclientserver.exe
