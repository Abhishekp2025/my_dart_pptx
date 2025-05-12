const template = r'''
<p:sld xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">
  <p:cSld name="{{name}}">
    {{>slide-background}}
    <p:spTree>
      <p:nvGrpSpPr>
        <p:cNvPr id="1" name=""/>
        <p:cNvGrpSpPr/>
        <p:nvPr/>
      </p:nvGrpSpPr>
      <p:grpSpPr>
        <a:xfrm>
          <a:off x="0" y="0"/>
          <a:ext cx="0" cy="0"/>
          <a:chOff x="0" y="0"/>
          <a:chExt cx="0" cy="0"/>
        </a:xfrm>
      </p:grpSpPr>

      <!-- Title: full width at the top -->
      <p:sp>
        <p:nvSpPr>
          <p:cNvPr id="2" name="Title"/>
          <p:cNvSpPr>
            <a:spLocks noGrp="1"/>
          </p:cNvSpPr>
          <p:nvPr>
            <p:ph type="title"/>
          </p:nvPr>
        </p:nvSpPr>
        <p:spPr>
          <a:xfrm>
            <a:off x="0" y="0"/>
            <a:ext cx="24384000" cy="1800000"/>
          </a:xfrm>
        </p:spPr>
        <p:txBody>
          <a:bodyPr/>
          <a:lstStyle/>
          <a:defPPr>
            <a:defRPr sz="4400"/>
          </a:defPPr>
          {{#title}}
          {{>text-value}}
          {{/title}}
        </p:txBody>
      </p:sp>

      <!-- Content: left half, large font -->
      <p:sp>
        <p:nvSpPr>
          <p:cNvPr id="3" name="Content"/>
          <p:cNvSpPr>
            <a:spLocks noGrp="1"/>
          </p:cNvSpPr>
          <p:nvPr>
            <p:ph type="body"/>
          </p:nvPr>
        </p:nvSpPr>
        <p:spPr>
          <a:xfrm>
            <a:off x="0" y="2000000"/>
            <a:ext cx="12000000" cy="11716000"/>
          </a:xfrm>
        </p:spPr>
        <p:txBody>
          <a:bodyPr/>
          <a:lstStyle/>
          <a:defPPr>
            <a:defRPr sz="3200"/>
          </a:defPPr>
          {{#content}}
          {{>text-value}}
          {{/content}}
        </p:txBody>
      </p:sp>

      <!-- First Image: right half, top -->
      <p:pic>
        <p:nvPicPr>
          <p:cNvPr id="4" name="Image 1"/>
          <p:cNvPicPr>
            <a:picLocks noChangeAspect="1"/>
          </p:cNvPicPr>
          <p:nvPr>
            <p:ph type="pic" idx="1"/>
          </p:nvPr>
        </p:nvPicPr>
        <p:blipFill>
          <a:blip r:embed="rId{{imageId1}}"/>
          <a:stretch>
            <a:fillRect/>
          </a:stretch>
        </p:blipFill>
        <p:spPr>
          <a:xfrm>
            <a:off x="12500000" y="2000000"/>
            <a:ext cx="11500000" cy="4800000"/>
          </a:xfrm>
          <a:prstGeom prst="rect">
            <a:avLst/>
          </a:prstGeom>
        </p:spPr>
      </p:pic>

      <!-- First Image Caption -->
      <p:sp>
        <p:nvSpPr>
          <p:cNvPr id="5" name="Caption 1"/>
          <p:cNvSpPr>
            <a:spLocks noGrp="1"/>
          </p:cNvSpPr>
          <p:nvPr/>
        </p:nvSpPr>
        <p:spPr>
          <a:xfrm>
            <a:off x="12500000" y="6900000"/>
            <a:ext cx="11500000" cy="1000000"/>
          </a:xfrm>
        </p:spPr>
        <p:txBody>
          <a:bodyPr/>
          <a:lstStyle/>
          <a:defPPr>
            <a:defRPr sz="2200"/>
          </a:defPPr>
          {{#caption1}}
          {{>text-value}}
          {{/caption1}}
        </p:txBody>
      </p:sp>

      <!-- Second Image: right half, bottom -->
      <p:pic>
        <p:nvPicPr>
          <p:cNvPr id="6" name="Image 2"/>
          <p:cNvPicPr>
            <a:picLocks noChangeAspect="1"/>
          </p:cNvPicPr>
          <p:nvPr>
            <p:ph type="pic" idx="2"/>
          </p:nvPr>
        </p:nvPicPr>
        <p:blipFill>
          <a:blip r:embed="rId{{imageId2}}"/>
          <a:stretch>
            <a:fillRect/>
          </a:stretch>
        </p:blipFill>
        <p:spPr>
          <a:xfrm>
            <a:off x="12500000" y="8000000"/>
            <a:ext cx="11500000" cy="4800000"/>
          </a:xfrm>
          <a:prstGeom prst="rect">
            <a:avLst/>
          </a:prstGeom>
        </p:spPr>
      </p:pic>

      <!-- Second Image Caption -->
      <p:sp>
        <p:nvSpPr>
          <p:cNvPr id="7" name="Caption 2"/>
          <p:cNvSpPr>
            <a:spLocks noGrp="1"/>
          </p:cNvSpPr>
          <p:nvPr/>
        </p:nvSpPr>
        <p:spPr>
          <a:xfrm>
            <a:off x="12500000" y="12900000"/>
            <a:ext cx="11500000" cy="800000"/>
          </a:xfrm>
        </p:spPr>
        <p:txBody>
          <a:bodyPr/>
          <a:lstStyle/>
          <a:defPPr>
            <a:defRPr sz="2200"/>
          </a:defPPr>
          {{#caption2}}
          {{>text-value}}
          {{/caption2}}
        </p:txBody>
      </p:sp>

    </p:spTree>
  </p:cSld>
  <p:clrMapOvr>
    <a:masterClrMapping/>
  </p:clrMapOvr>
</p:sld>
''';
