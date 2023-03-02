
function R = nn_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare nearest-neighbour
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);

    % ignora imagini care nu sunt alb negru
    if nr_colors > 1
        R = -1;
        return
    endif
    
    % TODO: cast I la double
    I = cast(I, "double");
    % initializeaza matricea finala
    R = zeros(p, q);
    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!

    % TODO: calculeaza factorii de scalare
    sx = (q-1) / (n-1);
    sy = (p-1) / (m-1);
    % Obs: daca se lucreaza cu indici in intervalul [0, n - 1], ultimul
    % pixel al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    
    % TODO: defineste matricea de transformare pentru redimensionare
    T = [sx 0; 0 sy];
    % TODO: calculeaza inversa transformarii
    T_inv = [1/sx 0; 0 1/sy];
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : p - 1
        for x = 0 : q - 1
             % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            aux = T_inv * [x, y]';
            x_p = aux(2);
            y_p = aux(1);
            % TODO: trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            x_p = x_p + 1;
            y_p = y_p + 1;
            % TODO: calculeaza cel mai apropiat vecin
            x1 = floor(x_p);
            y1 = floor(y_p);
            x2 = x1 + 1;
            y2 = y1 + 1;
            xf = x1;
            yf = y1;
            if (x_p < x1 + 0.5)
              if (y_p < y1 + 0.5)
                xf = x1;
                yf = y1;
              else
                xf = x1;
                yf = y2;
              endif
            else
              if (y_p < y1 + 0.5)
                xf = x2;
                yf = y1;
              else
                xf = x2;
                yf = y2;
              endif
            endif
            % TODO: calculeaza valoarea pixelului din imaginea finala
            R(y + 1, x + 1) = I(xf, yf);
        endfor
    endfor
    % TODO: converteste matricea rezultat la uint8
    R = cast(R, "uint8");
    
endfunction
