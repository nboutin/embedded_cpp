alias ll='ls -laF'
#source /d/prog/git-subrepo/.rc
#export PATH=$PATH:/D/data/oss/dev/scripts/git/
#export PATH=$BMWPHUD_MINGW:$PATH

#--- Git
alias gka='gitk --all&'
alias git_br_cl='git br | grep -v "^  wip/develop" | xargs git br -d; git br'

#--- Aida
alias mmk='mingw32-make'

alias mk='time ./m.bat'
alias mkc='mk clean'
alias mkj='mk -j 22'
alias mkja='cd ../SecureBoot; mkc; mkj; cd ../SWUpdate_Agent; mkj; cd ../Application; mkj'
alias mkjca='cd ../SecureBoot; mkc; mkj; cd ../SWUpdate_Agent; mkc; mkj; cd ../Application; mkc; mkj'
alias multi='./multi.bat'
alias ota_maker='cd ../tools/ota_maker; python ota_maker.py -a; cd -'

alias gt_data='cd /d/data'
alias gt_ada1='cd /i/data/nboutin'
alias gt_r1a='gt_ada1; cd aidar1/dev/aidar1_vcA'
alias gt_r1b='gt_ada1; cd aidar1/dev/aidar1_vcB'
alias gt_r2a='gt_ada1; cd aidar2/dev/aidar2_vcA'
alias gt_r2b='gt_ada1; cd aidar2/dev/aidar2_vcB'

#--- BMW PHUD
alias gt_bmw='cd /d/data/bmw_phud'
alias gt_bmr='gt_bmw; cd dev/bmw_phud_root_ref'
alias gt_bma='gt_bmw; cd dev/bmw_phud_root_a'
alias gt_bmb='gt_bmw; cd dev/bmw_phud_root_b'
alias gt_bmc='gt_bmw; cd dev/bmw_phud_root_C'

alias cmake='cmake.exe'
alias ctest='ctest.exe'

alias dbg_gen='cmake --preset armclang_debug'
alias dbg_build='cmake --build --preset armclang_debug'
alias dbg_clean='cmake --build --preset armclang_debug --target clean'

alias phud_gen='cmake --preset armclang'
alias phud_build='cmake --build --preset armclang'
alias phud_clean='cmake --build --preset armclang --target clean'
alias dlt_parser_gen='cmake --build --preset armclang --target dlt_parser'

alias ut_gen='cmake --preset unit_tests'
alias ut_build='cmake --build --preset unit_tests'
alias ut_clean='cmake --build --preset unit_tests --target clean'
alias ut_run='ctest --preset unit_tests --rerun-failed'

alias utdg_gen='cmake --preset unit_tests_debug'
alias utdg_build='cmake --build --preset unit_tests_debug'
alias utdg_clean='cmake --build --preset unit_tests_debug --target clean'
alias utdg_run='ctest --preset unit_tests'

alias cov_clean='cmake --build --preset unit_tests --target clean_coverage_gcovr_html'
alias cov_build='cmake --build --preset unit_tests --target coverage_gcovr_html_target'
alias cov_report='cov_clean; ut_clean; ut_build; cov_build'

alias doc_gen='cmake.exe --preset doxygen'
alias doc_build_ortx='cmake.exe --build --preset doxygen --target doxygen_ortx'

#--- Cutie Demo

alias gt_cutie_demo='cd /d/data/bmw_phud/dev/cutie_project/Cutie_demo'
alias ctd_gen='cmake --preset cutie_demo'
alias ctd_build='cmake --build --preset cutie_demo'
alias ctd_clean='cmake --build --preset cutie_demo --target clean'
alias ctd_run='ctest --preset cutie_demo'
alias ctd_gcovr_html='cmake --build --preset cutie_demo --target coverage_gcovr_html_target'
alias ctd_all='rm -rf build-cutie_demo; ctd_gen; ctd_build; ctd_run; ctd_gcovr_html'
