<?php

include_once dirname(__FILE__) . '/../Lib/pdf/fpdf.php';

class PDFWriter extends FPDF {

    // Current column
    var $col = 0;
    // Ordinate of column start
    var $y0;

    function Header()
    {
            // Page header
            global $title;

            $this->SetFont('Arial','B',15);
            $w = $this->GetStringWidth($title)+6;
            $this->SetX((210-$w)/2);
            $this->SetFillColor(255,255,255);
            $this->SetTextColor(0,0,0);		
            $this->Cell($w,9,$title,0,1,'C');
            $this->Ln(10);
            // Save ordinate
            $this->y0 = $this->GetY();
    }

    function Footer()
    {
            // Page footer
            $this->SetY(-15);
            $this->SetFont('Arial','I',8);
            $this->SetTextColor(128);
            $this->Cell(0,10,'Page '.$this->PageNo(),0,0,'C');
    }

    function SetCol($col, $w = 90)
    {
            // Set position at a given column
            $this->col = $col;
            $x = 10+$col*(10 + $w);
            $this->SetLeftMargin($x);
            $this->SetX($x);
    }

    function AcceptPageBreak()
    {
            // Method accepting or not automatic page break
            if($this->col<1)
            {
                    // Go to next column
                    $this->SetCol($this->col+1);
                    // Set ordinate to top
                    $this->SetY($this->y0);
                    // Keep on page
                    return false;
            }
            else
            {
                    // Go back to first column
                    $this->SetCol(0);
                    // Page break
                    return true;
            }
    }

    function PrintTitleRow($num, $label, $w = 90)
    {
            $label = iconv('UTF-8', 'ISO-8859-1', $label);
            // Title
            $this->SetFont('Times','B',12);
            $this->SetFillColor(255,255,255);
            $this->MultiCell($w,5,"$label",0,1,'C',true);
            $this->Ln(4);
            // Save ordinate
            $this->y0 = $this->GetY();
    }

    function ChapterBody($content, $num = 0, $w = 90, $align = 'L')
    {
            
            $txt = iconv('UTF-8', 'ISO-8859-1', $content);
            
            
            // Font
            $this->SetFont('Times','',12);
            // Output text in a 6 cm width column
            $this->MultiCell($w,5,$txt, 0, $align);
            $this->Ln();
            // Mention
            $this->SetFont('','I');
            $this->Cell(0,5,'');
            // Go back to first column
            $this->SetCol($num % 2, $w);
            
    }


    function PrintRow($num, $title, $file, $w = 90, $align = 'L')
    {
            // Add chapter
            if(!$this->PageNo())
                    $this->AddPage();
            $y = $this->GetY();
            $this->PrintTitleRow($num,$title, $w);
            $this->ChapterBody($file, $num, $w, $align);
            if($num % 2 > 0)
                $this->SetY ($y);
    }
    
    function PrintBorderTableRow($title)
    {
            $txt = $title;
            // Add chapter
            
            $y = $this->GetY();
            $this->Ln();
            $this->SetFont('Times','',12);
            $this->MultiCell(0,5,$txt, 'B', 'L');
            $this->Ln();
            //$this->SetY ($y);
    }
    
    function PrintHeaderRow($num, $title, $file, $w = 90, $align = 'L')
    {
            // Add chapter
            if(!$this->PageNo())
                    $this->AddPage();
            $y = $this->GetY();
            $this->PrintHeaderTitleRow($num,$title, $w);
            $this->HeaderChapterBody($file, $num, $w, $align);
            if($num % 2 > 0)
                $this->SetY ($y);
    }
    
    function PrintHeaderTitleRow($num, $label, $w = 90)
    {

            $txt = ' ' . $label;
            if(strpos($txt, 'img(')) {
                $imgUrl = str_replace('img(', '', $txt);
                $arr = explode(')', $imgUrl);
                $txt = $arr[1];
                $imgUrl = trim($arr[0]);
                //chmod($imgUrl, 0755);
                $y = $this->GetY();
                $this->Image($imgUrl, $this->getX() - 10, $y - 3, 10);
                $this->setY($y);
            }
            $txt = iconv('UTF-8', 'ISO-8859-1', $txt);
            // Title
            $this->SetFont('Times','B',18);
            $this->SetFillColor(255,255,255);
            $this->MultiCell($w,5,"$txt",0,1,'C',true);
            $this->Ln(4);
            // Save ordinate
            $this->y0 = $this->GetY();
    }

    function HeaderChapterBody($content, $num = 0, $w = 90, $align = 'L')
    {
            
            $txt = iconv('UTF-8', 'ISO-8859-1', $content);
            // Font
            $this->SetFont('Times','B',12);
            // Output text in a 6 cm width column
            $this->MultiCell($w,5,$txt, 0, $align);
            $this->Ln();
            // Mention
            $this->SetFont('','I');
            $this->Cell(0,5,'');
            // Go back to first column
            $this->SetCol($num % 2, $w);
            
    }
}

?>
