function [] = partFactory_test(path)
% Function factoryLayout = partFactory( partArray)
% input: partArray is a 2D binary image of the desired part.  1�s are the part, 0 are freespace
% ouput: factoryLayout, a 2D image of a factory than when actuated [up, right, down, left] produces copies of part partArray. 1�s are the boundary, 0 are freespace, 2s are 1x1 blues in the blue part hoppers, 3s are 1x1 reds in the red part hoppers.
% Authors: Sheryl Manzoor and Aaron T. Becker



G.fig = figure(2);
set(gcf,'color','k');
set(G.fig ,'KeyPressFcn',@keyhandler,'Name','AssemblyBlocks');
G.game = flipud(dlmread(path));
G.obstacle_pos = (G.game==1);  %%???
G.colormap = [  1,1,1; %Empty = white
    0,0,0; %obstacle
%     hsv(numel(unique(G.game))-2);
    1,0,0;
    0,0,1;];
colormap(G.colormap);
G.axis=imagesc(G.game);
set(gca,'box','off','xTick',[],'ytick',[],'ydir','normal','Visible','off','color',0.8*[1,1,1]);
axis equal
axis tight
%assignin('base','P',G);

% build list of items
makeItemList();
drawGameboard();

    function keyhandler(src,evnt) %#ok<INUSL>
        key = evnt.Key;
        step = [0,0];
        if strcmp(key,'leftarrow') || strcmp(key,'-x') %-x
            step = -[0,1];
        elseif strcmp(key,'rightarrow')|| strcmp(key,'+x') %+x
            step = [0,1];
        elseif strcmp(key,'uparrow')|| strcmp(key,'+y') %+y
            step = [1,0];
        elseif strcmp(key,'downarrow')|| strcmp(key,'-y') %-y
            step = -[1,0];
        end
        drawGameboard();
        revertList = [];
        while numel(revertList) < numel(G.items)
            %move everything: check for collisions, make list of objects that must be reverted
            G.game = zeros(size(G.obstacle_pos));
            revertList = [];
            for i = 1:numel(G.items)
                for j = 1:size(G.items{i},1)
                    ny = G.items{i}(j,1) + int16(step(1));
                    nx = G.items{i}(j,2) + int16(step(2));
                    G.items{i}(j,1:2) =  [ny,nx];
                    if nx>0 && ny>0 && ny<=size(G.game,1) && nx<=size(G.game,2) 
                    G.game(ny,nx) = i;
                        if  G.obstacle_pos(ny,nx)==true % if this bit hit an obstacle, make sure it is on the revertList
                            if isempty(find(revertList == i, 1))
                                revertList(end+1) = i; %#ok<AGROW>
                            end
                        end
                    else  
                        scEdge = 5;
                        if nx<-scEdge || ny<scEdge && ny>size(G.game,1)+scEdge || nx>size(G.game,2) +scEdge
                            if isempty(find(revertList == i, 1))
                                revertList(end+1) = i;
                            end
                        end
                    end
                end

            end
            
            
            % go recursively through revert list, moving them back in the image
            % and adding any shapes they collide with back to the
            i = 1;
            while i<=numel(revertList)
                item2revert = revertList(i);
                for j = 1:size(G.items{item2revert},1)
                    G.items{item2revert}(j,1:2) =  G.items{item2revert}(j,1:2)-int16(step);
                    collisionItem = G.game(G.items{item2revert}(j,1),G.items{item2revert}(j,2));
                    if collisionItem ~= item2revert && collisionItem ~= 0 
                        if isempty(find(revertList == collisionItem, 1))
                            revertList(end+1) = collisionItem;
                        end
                    end
                end
                i=i+1;
            end
            drawGameboard();
            drawnow
            makeItemList();
        end
        
    end

    function drawGameboard()
        %draw obstacles
        G.game = uint8(G.obstacle_pos);
        for i = 1:numel(G.items)
            for j = 1:size(G.items{i},1)
                %%delete any components that leave the screen
                if G.items{i}(j,1)>0 && G.items{i}(j,1)<=size(G.game,1) &&...
                   G.items{i}(j,2)>0 && G.items{i}(j,2)<=size(G.game,2)
                G.game(G.items{i}(j,1),G.items{i}(j,2)) = G.items{i}(j,3);
                end
            end
        end
        
        
%         %DRAW VECTOR DRAWING
% G.Rects = zeros(size(G.game));
% for cd = 1:size(G.game,1)
%     for rd = 1:size(G.game,2)
%         if G.game(cd,rd) == 1
%             G.Rects(cd,rd) =  rectangle('Position',[rd-1/2,cd-1/2,1,1],'FaceColor',[0.1,0.1,0.1],'linewidth',1);
%         elseif G.game(cd,rd) == 2
%             G.Rects(cd,rd) =  rectangle('Position',[rd-1/2,cd-1/2,1,1],'FaceColor',[1,0,0],'linewidth',1);
% elseif G.game(cd,rd) == 3
%             G.Rects(cd,rd) =  rectangle('Position',[rd-1/2,cd-1/2,1,1],'FaceColor',[0,0,1],'linewidth',1);
%         end
%     end
% end
% 


        
% %DRaw bitmap        
        set(G.axis,'CData',G.game)
    end


    function makeItemList()
        % searches over the whole gameboard to find 'Items'
        G.items = {};
        for x = 1:size(G.game,2)
            for y = 1:size(G.game,1)
                if G.game(y,x)>1
                    num = numel(G.items)+1;
                    color = G.game(y,x);
                    G.items{num} = int16([y,x,color]);
                    addItems(y+1,x,color,num);
                    addItems(y-1,x,color,num);
                    addItems(y,x+1,color,num);
                    addItems(y,x-1,color,num);
                end
            end
        end
        %assignin('base','items',G.items);
    end


    function  addItems(y,x,color,num)
        if y>size(G.game,1) || y<1 ||x<1 || x>size(G.game,2)   %% what does it do if the size exceeds the gameboard
            return
        end
        thisColor = G.game(y,x);  
        %if thisColor == color
        if (thisColor == 2 && color == 3) || (thisColor == 3 && color == 2)
            G.game(y,x) = 0;    %%???
            %                            y,x,color
            G.items{num}(end+1,:) = int16([y,x,thisColor]);
            addItems(y+1,x,thisColor,num);
            addItems(y-1,x,thisColor,num);
            addItems(y,x+1,thisColor,num);
            addItems(y,x-1,thisColor,num);
        end
    end
end






