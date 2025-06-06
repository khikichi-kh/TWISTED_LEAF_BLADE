function [m,result] = gpt_twisted_leaf_blade_20250605( m, varargin )
%[m,result] = gpt_twisted_leaf_blade_20250605( m, varargin )
%   Morphogen interaction function.
%   Written at 2025-06-05 16:53:51.
%   GFtbox revision 20211011, 2020-10-11 11:00.

% The user may edit any part of this function lying between lines that
% begin "%%% USER CODE" and "%%% END OF USER CODE".  Those lines themselves
% delimiters themselves must not be moved, edited, deleted, or added.

    result = [];
    if isempty(m), return; end

    setGlobals();
    
    % Handle new-style callbacks.
    if nargin > 1
        if exist('ifCallbackHandler','file')==2
            [m,result] = ifCallbackHandler( m, varargin{:} );
        end
        return;
    end

    fprintf( 1, '%s found in %s\n', mfilename(), which(mfilename()) );

    realtime = m.globalDynamicProps.currenttime;
    dt = m.globalProps.timestep;

%%% USER CODE: INITIALISATION
    if (Steps(m)==0) && m.globalDynamicProps.doinit
        % Put any code here that should only be performed at the start of
        % the simulation.

        % Reset several fields of m to their default states.
        % Give the command "help resetMeshValues" for details.
        % You can delete this if you do not want this to happen.
        m = resetMeshValues( m );

        if m.globalProps.IFsetsoptions
            m = setUpModelOptions( m, ...
                'modelname', {'MODEL1','MODEL2'}, 'MODEL1' ... % Model version name
                ... % Add further lines for all the options that you want.
            );
        end

        % Any further initialisation here.
    end
    OPTIONS = getModelOptions( m );
    printModelOptions( m );
%%% END OF USER CODE: INITIALISATION

%%% SECTION 1: ACCESSING MORPHOGENS AND TIME.
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.

% Each call of getMgenLevels below returns four results:
% XXX_i is the index of the morphogen called XXX.
% XXX_p is the vector of all of its values.
% XXX_a is its mutation level.
% XXX_l is the "effective" level of the morphogen, i.e. XXX_p*XXX_a.
% In SECTION 3 of the automatically generated code, all of the XXX_p values
% will be copied back into the mesh.

    polariser_i = FindMorphogenRole( m, 'POLARISER' );
    P = m.morphogens(:,polariser_i);
    [kapar_i,kapar_p,kapar_a,kapar_l] = getMgenLevels( m, 'KAPAR' );  %#ok<ASGLU>
    [kaper_i,kaper_p,kaper_a,kaper_l] = getMgenLevels( m, 'KAPER' );  %#ok<ASGLU>
    [kbpar_i,kbpar_p,kbpar_a,kbpar_l] = getMgenLevels( m, 'KBPAR' );  %#ok<ASGLU>
    [kbper_i,kbper_p,kbper_a,kbper_l] = getMgenLevels( m, 'KBPER' );  %#ok<ASGLU>
    [knor_i,knor_p,knor_a,knor_l] = getMgenLevels( m, 'KNOR' );  %#ok<ASGLU>
    [strainret_i,strainret_p,strainret_a,strainret_l] = getMgenLevels( m, 'STRAINRET' );  %#ok<ASGLU>
    [arrest_i,arrest_p,arrest_a,arrest_l] = getMgenLevels( m, 'ARREST' );  %#ok<ASGLU>
    [id_innerend_i,id_innerend_p,id_innerend_a,id_innerend_l] = getMgenLevels( m, 'ID_INNEREND' );  %#ok<ASGLU>
    [id_outerend_i,id_outerend_p,id_outerend_a,id_outerend_l] = getMgenLevels( m, 'ID_OUTEREND' );  %#ok<ASGLU>
    [s_innerend_i,s_innerend_p,s_innerend_a,s_innerend_l] = getMgenLevels( m, 'S_INNEREND' );  %#ok<ASGLU>
    [s_outerend_i,s_outerend_p,s_outerend_a,s_outerend_l] = getMgenLevels( m, 'S_OUTEREND' );  %#ok<ASGLU>
    [id_distalpart_i,id_distalpart_p,id_distalpart_a,id_distalpart_l] = getMgenLevels( m, 'ID_DISTALPART' );  %#ok<ASGLU>
    [id_proximalpart_i,id_proximalpart_p,id_proximalpart_a,id_proximalpart_l] = getMgenLevels( m, 'ID_PROXIMALPART' );  %#ok<ASGLU>
    [id_pro_dis_part_i,id_pro_dis_part_p,id_pro_dis_part_a,id_pro_dis_part_l] = getMgenLevels( m, 'ID_PRO_DIS_PART' );  %#ok<ASGLU>
    [idb_all_i,idb_all_p,idb_all_a,idb_all_l] = getMgenLevels( m, 'IDB_ALL' );  %#ok<ASGLU>

% Mesh type: cylinder
%         basecap: 0
%        baseflat: 0
%      baseheight: 1
%       baserings: 0
%          centre: 0
%      circumdivs: 48
%          height: 32
%      heightdivs: 64
%          layers: 0
%             new: 1
%      randomness: 0
%       thickness: 0
%          topcap: 0
%         topflat: 0
%       topheight: 1
%        toprings: 0
%          xwidth: 4
%          ywidth: 4

%            Morphogen    Diffusion   Decay   Dilution   Mutant
%            --------------------------------------------------
%                KAPAR         ----    ----       ----     ----
%                KAPER         ----    ----       ----     ----
%                KBPAR         ----    ----       ----     ----
%                KBPER         ----    ----       ----     ----
%                 KNOR         ----    ----       ----     ----
%            POLARISER           10    ----       ----     ----
%            STRAINRET         ----    ----       ----     ----
%               ARREST         ----    ----       ----     ----
%          ID_INNEREND         ----    ----       ----     ----
%          ID_OUTEREND         ----    ----       ----     ----
%           S_INNEREND         ----    ----       ----     ----
%           S_OUTEREND         ----    ----       ----     ----
%        ID_DISTALPART         ----    ----       ----     ----
%      ID_PROXIMALPART         ----    ----       ----     ----
%      ID_PRO_DIS_PART         ----    ----       ----     ----
%              IDB_ALL         ----    ----       ----     ----


%%% USER CODE: MORPHOGEN INTERACTIONS

% In this section you may modify the mesh in any way that does not
% alter the set of nodes.

    if (Steps(m)==0) && m.globalDynamicProps.doinit
    %Position of each regions
        id_distalpart_p(m.nodes(:,3) >= 15.8) = 1;
        id_proximalpart_p(m.nodes(:,3) <= -15.8) = 1;
        id_innerend_p((m.nodes(:,2) <= -1.5)&(m.nodes(:,1) <= 0))=1;
        id_outerend_p((m.nodes(:,2) <= -1.5)&(m.nodes(:,1) >= 0))=1;
        
        %For Fig. S1g
        %We created Fig. S1g using id_innerend_p and id_pro_dis_part_p.
        id_pro_dis_part_p((m.nodes(:,3) >= 15.8) | (m.nodes(:,3) <= -15.8)) = 1;
        
        %For Fig. S2
        %We created Fig. S2 using id_outerend_p and idb_all_p.
        idb_all_p((m.nodes(:,1) < 0))=1;
        idb_all_p((m.nodes(:,2) > -1.5)&(m.nodes(:,1) >= 0))=1;

    %Polarity field for pre-growth
        s_outerend_p = id_outerend_p;
        m.morphogenclamp((id_outerend_p==1), s_outerend_i ) = 1; 
        m = leaf_mgen_conductivity( m, 'S_OUTEREND', 10);  
        m = leaf_mgen_absorption( m, 'S_OUTEREND', 0.0001 );
        
        s_innerend_p = id_innerend_p;
        m.morphogenclamp((id_innerend_p==1), s_innerend_i ) = 1; 
        m = leaf_mgen_conductivity( m, 'S_INNEREND', 10);  
        m = leaf_mgen_absorption( m, 'S_INNEREND', 0.0001 );
        
    %Local polarity to define direction of parallel (kpar) and perpendicular (kper) growth
        P(:) = 0.1;
        P(id_proximalpart_p == 1) = 1;
        P(id_distalpart_p == 1) = 0;
        m.morphogenclamp(((id_distalpart_p == 1)|(id_proximalpart_p == 1)), polariser_i) = 1;
        m = leaf_mgen_conductivity(m, 'POLARISER', 10);
        m = leaf_mgen_absorption(m, 'POLARISER', 0.0001);


    %Pre-growth setting
    elseif (Steps(m)>5)&(Steps(m)<15)
        m = leaf_mgen_conductivity( m, 'S_OUTEREND', 0);  
        m = leaf_mgen_absorption( m, 'S_OUTEREND', 0 );
        m = leaf_mgen_conductivity( m, 'S_INNEREND', 0);  
        m = leaf_mgen_absorption( m, 'S_INNEREND', 0 );

        kapar_p(:) = 0;
        kaper_p(:) = 0.25.*pro(2, s_outerend_p);
        kbpar_p(:) = 0;
        kbper_p(:) = 0.25.*pro(2, s_innerend_p);
        knor_p(:)=0.1.*pro(2, s_outerend_p);


    % Growth setting for our three models
    elseif (Steps(m)>15)
        kapar_p(:) = 0.5;
        kaper_p(:) = 0.5;
        kbpar_p(:) = 0.5;
        kbper_p(:) = 0.5;
        knor_p(:)=0;

        %Setting of fixation
        %Fixation at inner overlapping end
        Inner_fix = true; %"true" and "false" mean "Run with fixation" and "Run without fixation", respectively.
        if Inner_fix
            m = leaf_fix_vertex(m, 'vertex', find(id_innerend_p == 1), 'dfs', 'x,y');
        end

        %Fixation at bottom and top ends
        Proximal_Distal_fix = true; %"true" and "false" mean "Run with fixation" and "Run without fixation", respectively.
        if Proximal_Distal_fix
            m = leaf_fix_vertex(m, 'vertex', find(id_proximalpart_p == 1), 'dfs', 'x,y,z');
            m = leaf_fix_vertex(m, 'vertex', find(id_distalpart_p == 1), 'dfs', 'x,y,z');
        end

    end
%%% END OF USER CODE: MORPHOGEN INTERACTIONS

%%% SECTION 3: INSTALLING MODIFIED VALUES BACK INTO MESH STRUCTURE
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.
    m.morphogens(:,polariser_i) = P;
    m.morphogens(:,kapar_i) = kapar_p;
    m.morphogens(:,kaper_i) = kaper_p;
    m.morphogens(:,kbpar_i) = kbpar_p;
    m.morphogens(:,kbper_i) = kbper_p;
    m.morphogens(:,knor_i) = knor_p;
    m.morphogens(:,strainret_i) = strainret_p;
    m.morphogens(:,arrest_i) = arrest_p;
    m.morphogens(:,id_innerend_i) = id_innerend_p;
    m.morphogens(:,id_outerend_i) = id_outerend_p;
    m.morphogens(:,s_innerend_i) = s_innerend_p;
    m.morphogens(:,s_outerend_i) = s_outerend_p;
    m.morphogens(:,id_distalpart_i) = id_distalpart_p;
    m.morphogens(:,id_proximalpart_i) = id_proximalpart_p;
    m.morphogens(:,id_pro_dis_part_i) = id_pro_dis_part_p;
    m.morphogens(:,idb_all_i) = idb_all_p;

%%% USER CODE: FINALISATION

% In this section you may modify the mesh in any way whatsoever.
%%% END OF USER CODE: FINALISATION

end

function [m,result] = ifCallbackHandler( m, fn, varargin )
    result = [];
    if exist(fn,'file') ~= 2
        return;
    end
    [m,result] = feval( fn, m, varargin{:} );
end


%%% USER CODE: SUBFUNCTIONS

% Here you may write any functions of your own, that you want to call from
% the interaction function, but never need to call from outside it.
% Remember that they do not have access to any variables except those
% that you pass as parameters, and cannot change anything except by
% returning new values as results.
% Whichever section they are called from, they must respect the same
% restrictions on what modifications they are allowed to make to the mesh.

% The GFtbox_..._Callback routines can be deleted if you do not use them.
% Those that you retain will be automatically called by GFtbox at certain
% points in the simulation cycle.
% If you retain them, their headers specifying their arguments and results
% must not be altered.

function [m,result] = GFtbox_Precelldivision_Callback( m, ci ) %#ok<DEFNU>
    result = [];
    % Your code here.

    % If a nonempty result is to be returned, it should be a struct
    % with fields result.divide, result.dividepoint, and result.perpendicular.
end

function [m,result] = GFtbox_Postcelldivision_Callback( m, ci, cei, newci, newcei, oe1, oe2, ne1, ne2, ne3 ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

function [m,result] = GFtbox_Postiterate_Callback( m ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

function [m,result] = GFtbox_Preplot_Callback( m, theaxes ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

function [m,result] = GFtbox_Postplot_Callback( m, theaxes ) %#ok<DEFNU>
    result = [];
    % Your code here.
end

